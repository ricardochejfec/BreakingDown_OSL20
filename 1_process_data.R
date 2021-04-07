library(tidyverse)

# OUTLINE 
# Get and Clean Data
## 1 - Get and Clean Master OSL Data
## 2 - Get and Clean Inflation Data 
# Processing Ind Years
# Processing Longitudinal Data 
# Processing Inflation-Adjusted Data


# Get and Clean Data ------------------------------------------------------

# Master contains all years of the list compiled by 0_get_data.R 
master_raw <- data.table::fread(file = "data/master.csv")
master_raw <- as_tibble(master_raw)
master <- mutate(master_raw, year = calendar_year - 1996)

# Some Years made Taxable Benefits use NAs instead of Zeros 
master <- mutate(master,
                 taxable_benefits =
                     ifelse(is.na(taxable_benefits), 0, taxable_benefits)
)
master <- drop_na(master)

# Some years use commas instead of period, resulting in larger than 
# intended numbers. Columns are renamed and total income is calculated
master <- master %>%
    mutate(
        salary_paid =
            ifelse(salary_paid > 3000000,
                   salary_paid / 100,
                   salary_paid
            ),
        total_income = salary_paid + taxable_benefits,
    ) %>%
    rename(
        salary = salary_paid,
        benefits = taxable_benefits,
        lbl_year = calendar_year
    )

# Sectors change names through the years, this standardizes them
# Seconded is a recent addition and is removed due to small size/relevance 
master <- master %>%
    mutate(
        sector = case_when(
            str_detect(sector, "government ") ~ "ontario public service",
            str_detect(sector, "hydro one") ~ "ontario power generation",
            TRUE ~ sector
        ),
        sector = str_to_title(sector)
    ) %>%
    filter(sector != "Seconded")

# --- # Inflation data

# Read Inflation data
inflation <- readr::read_csv("data/inflation.csv")

# Extract only the All-Items category for all relevant years.
# Index CPI values to base year (1996 - 88.2)
inflation <- head(inflation, 1)
inflation <- pivot_longer(inflation, 2:26,
                          names_to = "year",
                          values_to = "cpi"
) %>%
    mutate(
        year = as.numeric(year) - 1996,
        indexed = cpi / 88.2
    ) %>%
    select(year, indexed)



# Processing Ind Years ----------------------------------------------------

# Sector Summary 2020
secsum_20 <- master %>%
    filter(year == 24) %>%
    group_by(sector) %>%
    summarise(
        money = mean(total_income),
        sec_frq = n()
    )

# Create a rank of sectors by number of people. 
# To be used for plotting throughout the project
secsum_20 <- arrange(
    secsum_20,
    desc(sec_frq)
    ) %>%
    mutate(rank = 1:nrow(secsum_20))

rank_secs <- secsum_20 %>% select(sector, rank)
master <- left_join(master, rank_secs, by = "sector")

master_20 <- filter(master, year == 24)
master_19 <- filter(master, year == 23)


# Sector Summary 2019 
secsum_19 <- master_19 %>%
    group_by(sector) %>%
    summarise(
        money19 = mean(total_income),
        n19 = n()
    ) %>% 
    arrange(desc(n19))

# Calculate changes in number of people and average earnings 
# from 2019 to 2020
change_1920 <- left_join(secsum_20, secsum_19, "sector") %>%
    mutate(
        delta_count = sec_frq - n19,
        delta_money = money - money19
    )


# Processing Longitudinal Data --------------------------------------------

# Sector Summary through Time
secsum <- master %>%
    group_by(sector, year) %>%
    summarise(
        money = mean(total_income),
        sec_frq = n()
    )

# Add back in the rank and the year label
secsum <- left_join(secsum, rank_secs, by = "sector") %>%
    mutate(lbl_year = year + 1996)

# Calculate percentage changes in count and average income
secsum_perc <- secsum %>%
    group_by(sector) %>%
    arrange(year) %>%
    mutate(
        money_chg = (money - lag(money)) / lag(money),
        sec_frq_chg = (sec_frq - lag(sec_frq)) / lag(sec_frq)
    )

# Clean NAs from year 0
secsum_perc <- secsum_perc %>%
    mutate(
        money_chg = ifelse(is.na(money_chg), 0, money_chg),
        sec_frq_chg = ifelse(is.na(sec_frq_chg), 0, sec_frq_chg)
    )

# --- # Longitudinal Summary without Sectors

longsum <- master %>%
    group_by(year) %>%
    summarise(
        money = mean(total_income),
        sec_frq = n()
    ) %>%
    mutate(lbl_year = year + 1996)

# Processing Inflation-Adjusted Data --------------------------------------

# Add CPI values by year to the master table 
# Create columns for monetary values adjusted for inflation
master_inf <- left_join(x = master, y = inflation) %>%
    mutate(
        income_inf = total_income / indexed,
        salary_inf = salary / indexed,
        benefits_inf = benefits / indexed
    )

# Master DB removing all those making less than $100K in real 1996 dollars.
master_adj <- master_inf %>% filter(salary_inf >= 100000)

# Master 20 Adjusted
master_20_adj <- master_adj %>% filter(year == 24)

# Sector Summary 20 Adjusted
secsum_20_adj <- master_20_adj %>%
    group_by(sector) %>%
    summarise(money = mean(income_inf), sec_frq = n())

secsum_20_adj <- secsum_20_adj %>%
    mutate(share = sec_frq / nrow(master_20))

secsum_20_adj <- left_join(x = secsum_20_adj, y = rank_secs)

# --- # Longitudinal Summary Adjusted

#Longitudinal Summary w/o Sectors Adjusted
longsum_adj <- master_adj %>%
    group_by(year) %>%
    summarise(
        money = mean(total_income),
        sec_frq = n()
    ) %>%
    mutate(lbl_year = year + 1996)

#Longitudinal Summary w Sectors Adjusted
secsum_adj <- master_adj %>%
    group_by(year, sector) %>%
    summarise(
        money = mean(income_inf),
        sec_frq = n()
    ) %>%
    mutate(lbl_year = year + 1996)


# Processing Job Titles ---------------------------------------------------

# --- # Management versus Professionals

# get_mgmt() from code/functions.R, changes all managerial job titles
# to Manager and all others to Professionals
mgmt_20 <- get_mgmt(master_20)
mgmt_20_adj <- get_mgmt(master_20_adj)

mgmt_20 <- mgmt_20 %>%
    group_by(job_title) %>%
    count() %>%
    ungroup() %>%
    mutate(i = row_number())

mgmt_20_adj <- mgmt_20_adj %>%
    group_by(job_title) %>%
    count() %>%
    ungroup() %>%
    mutate(i = row_number())

# --- # Deepdive on Relevant Sectors

# deepdive() from code/functions.R, cleans the job titles following
# hardcoded rules built around the relevant sectors

dd_20 <- deepdive(master_20)
dd_19 <- deepdive(master_19)

# get a list of the top most popular jobs
top_jobs <- dd_20 %>%
    group_by(job_title) %>%
    summarise(n = n(), mean_sal = mean(salary)) %>%
    arrange(-n, .by_group = TRUE)

# Count number of job titles per sector 2020
dd_20 <- dd_20 %>%
    group_by(sector, job_title) %>%
    summarise(n=n(), 
           sal = mean(salary))

dd_20 = dd_20 %>% 
    mutate(perc = n/52507)

# Count number of job titles per sector 2019
dd_19 <- dd_19 %>%
    group_by(sector) %>%
    count(job_title, sort = TRUE) %>%
    ungroup() %>%
    group_by(sector)

# Filter relevant sectors
dd_20 <- dd_20 %>% filter(sector %in% c(
    "Crown Agencies",
    "School Boards",
    "Hospitals And Boards Of Public Health"))

# Filter relevant sectors
dd_19 <- dd_19 %>% filter(sector %in% c(
    "Crown Agencies",
    "School Boards",
    "Hospitals And Boards Of Public Health"))

# Get top 10 changes by sector 
# Join deepdive db by sector and join title and calculate differences
# as well as percentage change
dd_delta <- left_join(dd_20, dd_19, by = c("sector", "job_title")) %>%
    mutate(
        n.y = ifelse(is.na(n.y), 0, n.y),
        delta = n.x - n.y,
        growth = (n.x - n.y) / n.y
    ) %>% 
    arrange(-n.x,.by_group = TRUE) %>% 
    slice(1:10)

