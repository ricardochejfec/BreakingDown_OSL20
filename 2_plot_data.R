library(tidyverse)
library("gridExtra")
library(waffle)
library(scales)
library(gt)
library(webshot)

source(file = "code/functions.R")
source(file = "1_process_data.R")

# waffle ------------------------------------------------------------------

waf <- ggplot(
  secsum_20[order(secsum_20$sec_frq), ],
  aes(
    fill = reorder(sector, rank),
    values = round(sec_frq / 100)
  )
) +
  expand_limits(
    x = c(0, 0),
    y = c(0, 0)
  ) +
  coord_equal() +
  labs(
    fill = NULL,
    color = NULL
  )

waf <- waf + geom_waffle(
  n_rows = 10,
  size = .5,
  make_proportional = TRUE,
  flip = TRUE,
  color = "#f8f2e4",
  radius = unit(9, "pt")
) +
  ggtitle("Sector Count 2020") +
  guides(fill = guide_legend(nrow = 9))

waf <- theme_plt(waf, "waf") + theme(plot.title = element_text(size = 32))


# 2020 Sector Summary -----------------------------------------------------


p_secsum_d_20 <- ggplot(
  secsum_20,
  aes(
    y = reorder(
      factor(sector),
      rank
    ),
    x = money,
    fill = reorder(
      factor(sector),
      rank
    )
  )
) +
  geom_bar(stat = "identity") +
  ggtitle("Sector Avg Earnings 2020") +
  xlab("Avg Earnings") +
  ylab(element_blank()) +
  scale_x_continuous(labels = scales::dollar_format())

p_secsum_d_20 <- theme_plt(p_secsum_d_20, "nl")


# Change from 19-20 -------------------------------------------------------

p_change_1920 <- ggplot(
  change_1920,
  aes(
    x = reorder(
      sector,
      rank
    ),
    y = delta_count,
    label = delta_count,
    color = reorder(
      sector,
      rank
    )
  )
) +
  geom_point(aes(fill = reorder(
    sector,
    rank
  )),
  stat = "identity",
  size = 8,
  pch = 21
  ) +
  geom_segment(aes(
    y = 0,
    x = sector,
    yend = delta_count,
    xend = sector,
    color = reorder(
      sector,
      rank
    )
  ),
  size = 2
  ) +
  geom_text(
    color = "black",
    size = 5,
    nudge_x = .25
  ) +
  scale_y_continuous(
    labels = scales::number_format(),
    limits = c(-500, 17500)
  ) +
  coord_flip() +
  ggtitle("Sector Change (19-20) in Count") +
  ylab("Delta Count") +
  xlab("")

p_change_1920 <- theme_plt(p_change_1920, "nl")

# --- # Average Salaries

p_change_1920_d <- ggplot(
  change_1920,
  aes(
    x = reorder(
      sector,
      rank
    ),
    y = delta_money,
    label = dollar(round(delta_money)),
    color = reorder(
      sector,
      rank
    )
  )
) +
  geom_point(aes(fill = reorder(
    sector,
    rank
  )),
  stat = "identity",
  size = 8,
  pch = 21
  ) +
  geom_segment(aes(
    y = 0,
    x = sector,
    yend = delta_money,
    xend = sector,
    color = reorder(
      sector,
      rank
    )
  ),
  size = 2
  ) +
  geom_text(
    color = "black",
    size = 5,
    nudge_x = .25
  ) +
  coord_flip() +
  ggtitle("Sector Change (19 - 20) in Avg Earnings") +
  ylab("Delta Avg Earnings") +
  xlab("Count") +
  scale_y_continuous(
    labels = scales::dollar_format(),
    limits = c(-6000, 6000)
  )

p_change_1920_d <- theme_plt(p_change_1920_d, "nl")


# Analysis through time ---------------------------------------------------


p_longsum <- ggplot(
  master,
  aes(x = lbl_year)
) +
  scale_y_continuous(labels = scales::number_format()) +
  geom_bar() +
  ggtitle("Count Across Time") +
  ylab("Count") +
  xlab("Year")


p_longsum_d <- ggplot(
  master,
  aes(y = total_income, x = lbl_year)
) +
  geom_bar(stat = "summary", ) +
  scale_y_continuous(labels = scales::dollar_format()) +
  ggtitle("Avg Earnings Across Time") +
  ylab("Avg Earnings") +
  xlab("Year")

p_longsum_grid <- arrangeGrob(theme_plt(p_longsum, "nl"),
  theme_plt(p_longsum_d, "nl"),
  nrow = 2
)

# --- # Including Sectors

p_longsecsum <- ggplot(master, aes(x = lbl_year)) +
  geom_histogram(aes(fill = reorder(factor(sector), rank)),
                 binwidth = .5
  ) +
  scale_y_continuous(labels = scales::number_format()) +
  ggtitle("Sector Count Across Time") +
  xlab("Year") +
  ylab("Count")

p_secsum_d<- ggplot(
  secsum,
  aes(
    x = lbl_year,
    y = money
  )
) +
  geom_line(aes(color = reorder(factor(sector), rank)), lwd = 1.3) +
  scale_y_continuous(
    labels = scales::dollar_format(),
    limits = c(100000, 175000)
  ) +
  ggtitle("Sector Avg Earnings Across Time")

p_longsecsum <- theme_plt(p_longsecsum, "l") +
  theme(legend.justification = "left")
p_secsum_d<- theme_plt(p_secsum_d, "nl")

# Percent Change Through Time ---------------------------------------------

p_secsum_perc <- ggplot(secsum_perc, aes(x = lbl_year, y = sec_frq_chg)) +
  geom_line(aes(color = reorder(factor(sector), rank))) +
  scale_y_continuous(labels = scales::percent_format())

p_secsum_perc <- theme_plt(p_secsum_perc, "grid")

p_secsum_perc_d <- ggplot(secsum_perc, aes(x = lbl_year, y = money_chg)) +
  geom_line(aes(color = reorder(factor(sector), rank))) +
  scale_y_continuous(labels = scales::percent_format())

p_secsum_perc_d <- theme_plt(p_secsum_perc_d, "line") +
  theme(legend.justification = "left")

p_secsum_perc_grid <- arrangeGrob(p_secsum_perc,
  p_secsum_perc_d,
  nrow = 2
)


# Infl - Violins ----------------------------------------------------------

p_violins <- ggplot(master_inf, aes(x = factor(lbl_year), y = salary_inf)) +
  geom_violin() +
  geom_hline(yintercept = 100000, color = "#2270b5") +
  ggtitle("Count Across Time (1996 Dollars)") +
  xlab("Year") +
  ylab("Salary in Real Dollars (1996)") +
  scale_y_continuous(
    labels = scales::dollar_format(),
    limits = c(50000, 500000)
  )

p_violins <- theme_plt(p_violins, "nl")


# Infl - Sector Summary 2020 ----------------------------------------------

p_secsum_20_adj <- ggplot(
  secsum_20_adj,
  aes(
    y = reorder(factor(sector), -rank),
    x = sec_frq,
    fill = reorder(factor(sector), rank)
  )
) +
  geom_bar(stat = "identity") +
  ggtitle("Sector Count 2020 (1996 Dollars)") +
  xlab("Count") +
  ylab("") +
  scale_x_continuous(labels = scales::number_format())

p_secsum_d_20_adj <- ggplot(
  secsum_20_adj,
  aes(
    y = reorder(factor(sector), -rank),
    x = money,
    fill = reorder(factor(sector), rank)
  )
) +
  geom_bar(stat = "identity") +
  ggtitle("Sector Avg Earnings 2020 (1996 Dollars)") +
  xlab("Avg Earnings") +
  ylab("") +
  scale_x_continuous(labels = scales::dollar_format())

p_secsum_20_adj <- theme_plt(p_secsum_20_adj, "nl")
p_secsum_d_20_adj <- theme_plt(p_secsum_d_20_adj, "nl")

p_longsecsum_adj <- ggplot(master_adj, aes(x = lbl_year)) +
  geom_histogram(aes(fill = reorder(factor(sector), rank)),
                 binwidth = .5
  ) +
  scale_y_continuous(labels = scales::number_format()) +
  ggtitle("Sector Count (1996 Dollars)") 

p_longsecsum_adj <- theme_plt(p_longsecsum_adj, "l")

secsum_adj = left_join(secsum_adj, rank_secs, "sector")
p_longsecsum_adj_d <- ggplot(
  secsum_adj,
  aes(
    x = lbl_year,
    y = money
  )
) +
  geom_line(aes(color = reorder(factor(sector), rank)), lwd = 1.3) +
  scale_y_continuous(
    labels = scales::dollar_format(),
    limits = c(100000, 175000)
  ) +
  ggtitle("Sector Avg Earnings (1996 Dollars)")

p_longsecsum_adj_d <- theme_plt(p_longsecsum_adj_d, "l")

# Modeling ----------------------------------------------------------------

p_longsum_pred <- ggplot(
  longsum %>% filter(lbl_year <= 2019),
  aes(x = lbl_year, y = sec_frq)
) +
  geom_point() +
  xlim(1996, 2020) +
  stat_smooth(
    method = "gam",
    formula = y ~ s(x, k=9),
    fullrange = TRUE,
    color = "brown") +
  geom_point(
    data = longsum %>% filter(lbl_year > 2019),
    aes(x = lbl_year, y = sec_frq),
    color = "orange",
    size = 3
  ) +
  ggtitle("Forecasting 2020") +
  xlab("Year") +
  ylab("Count")

p_longsum_pred

p_longsum_pred_sec <- ggplot(
  secsum %>% filter(lbl_year <= 2019),
  aes(x = lbl_year, y = sec_frq)
) +
  geom_point() +
  xlim(1996, 2020) +
  stat_smooth(method = "gam",
              formula = y ~ s(x, k=9),
              fullrange = TRUE, 
              color = "brown") +
  geom_point(
    data = secsum %>% filter(lbl_year == 2020),
    aes(x = lbl_year, y = sec_frq),
    color = "orange"
  ) +
  ggtitle("Sector Forecasting 2020") +
  xlab("Year") +
  ylab("Count") +
  geom_rect(
    data = subset(
      secsum,
      sector %in% c(
        "Crown Agencies",
        "School Boards",
        "Hospitals And Boards Of Public Health"
      )
    ),
    fill = NA, colour = "brown", xmin = -Inf, xmax = Inf,
    ymin = -Inf, ymax = Inf
  ) +
  facet_wrap(~sector, scales = "free_y")

p_longsum_pred <- theme_plt(p_longsum_pred, "nl")
p_longsum_pred_sec <- theme_plt(p_longsum_pred_sec, "nl")


# Adjusted Models ---------------------------------------------------------

p_longsum_pred_adj <- ggplot(
  longsum_adj %>% filter(lbl_year <= 2019),
  aes(x = lbl_year, y = sec_frq)
) +
  geom_point() +
  xlim(1996, 2020) +
  stat_smooth(method = "gam", fullrange = TRUE, color = "blue") +
  geom_point(
    data = longsum_adj %>% filter(lbl_year == 2020),
    aes(x = lbl_year, y = sec_frq),
    color = "red",
    size = 3
  ) +
  ggtitle("Forecasting 2020 (1996 Dollars)") +
  xlab("Year") +
  ylab("Count")

p_longsum_pred_sec_adj <- ggplot(
  secsum_adj %>%
    filter(lbl_year <= 2019),
  aes(x = lbl_year, y = sec_frq)
) +
  geom_point() +
  xlim(1996, 2020) +
  stat_smooth(method = "gam", fullrange = TRUE) +
  geom_point(
    data = secsum_adj %>%
      filter(lbl_year == 2020),
    aes(x = lbl_year, y = sec_frq),
    color = "red"
  ) +
  ggtitle("Sector Forecasting 2020 (1996 Dollars)") +
  xlab("Year") +
  ylab("Count") +
  facet_wrap(~sector, scales = "free_y")

p_longsum_pred_sec_adj <- theme_plt(p_longsum_pred_sec_adj, "nl")
p_longsum_pred_adj <- theme_plt(p_longsum_pred_adj, "nl")


# Management versus Professionals ------------------------------------------

p_jobsum_20 <- ggplot(mgmt_20, aes(x = job_title, y = n)) +
  geom_bar(stat = "summary") +
  scale_y_continuous(labels = number_format()) +
  ggtitle("(2020 Dollars)")


p_jobsum_20 <- theme_plt(p_jobsum_20, "nl")

p_jobsum_20_adj <- ggplot(mgmt_20_adj, aes(x = job_title, y = n)) +
  geom_bar(stat = "summary") +
  scale_y_continuous(labels = number_format()) +
  ggtitle("(1996 Dollars)")


p_jobsum_20_adj <- theme_plt(p_jobsum_20_adj, "nl")

p_jobsum_20_grid <- arrangeGrob(p_jobsum_20, p_jobsum_20_adj, ncol = 2)


# Supplemental ------------------------------------------------------------

sector_db <- master_raw %>% group_by(calendar_year, sector) %>% summarise(n=n())

p_sector_db <- ggplot(sector_db, aes(x=calendar_year, y=sector)) + 
  geom_line(size=2) +
  ggtitle("Sectors Change Through Years")

p_sector_db <- theme_plt(p_sector_db, "nl")
# Creating Tables ---------------------------------------------------------

# Top 5 Jobs 

top_5_jobs = top_jobs %>% 
  slice(1:5)

top_5_jobs = top_5_jobs %>% mutate(job_title = stringr::str_to_sentence(job_title))

top_5_table = top_5_jobs %>% gt() %>%
  fmt_number(columns = vars(n), decimals = 0) %>%
  fmt_currency(columns = vars(mean_sal), currency = "USD",, decimals = 0) %>%
  tab_header(
    title = md("**The 5 Most Popular Job Titles in 2020**")) %>%
  cols_label(
    job_title = md("**Job Title**"),
    n = md("**Count**"), 
    mean_sal = md("**Avg Salary**")) %>% 
  tab_options(table.width = pct(100)) %>% 
  cols_align(align = "center") 

top_5_table %>% gtsave(filename = "top_5_table.png", path="tables/") 

# --- # Relevant Sector Tables

jobs = dd_delta %>% 
  group_by(sector) %>% 
  arrange(-delta, .by_group = TRUE) %>% slice(1:5)

jobs = jobs %>% mutate(job_title = ifelse(nchar(job_title)>2,
                                          stringr::str_to_sentence(job_title), 
                                          stringr::str_to_upper(job_title)))

jobs_ch = change_1920 %>% 
  filter(sector %in% c("Crown Agencies",
                       "Hospitals And Boards Of Public Health",
                       "School Boards")) %>% 
  select(sector, delta_count)

change_20 = nrow(master_20) - nrow(master_19)

jobs_tab = left_join(jobs, jobs_ch, by="sector") %>% 
  mutate(secinc =  delta/delta_count) %>% 
  mutate(totinc =  delta/change_20)

crown_change = make_table("Crown Agencies" )%>% 
  tab_source_note(
    source_note = "Specialists increased from 2 in 2019 to 216 in 2020."
  ) %>% 
  tab_source_note(
    source_note = "CM = Case Manager PM = Project Manger"
  )
hosp_change = make_table("Hospitals And Boards Of Public Health")
school_change = make_table("School Boards")

crown_change %>% gtsave(filename = "crown_change.png", path="tables/") 
hosp_change %>% gtsave(filename = "hosp_change.png", path="tables/") 
school_change %>% gtsave(filename = "school_change.png", path="tables/") 

# Saves -------------------------------------------------------------------

save_plt(waf, "waffle", 12, 8)

save_plt(p_secsum_d_20, "p_secsum_d_20", 15, 8.5)

save_plt(p_change_1920, "p_change_1920", 15, 8.5)

save_plt(p_change_1920_d, "p_change_1920_d", 15, 8.5)

save_plt(p_longsum_grid, "p_longsum_grid", 12, 10)

save_plt(p_secsum_perc_grid, "p_secsum_perc_grid", 12, 10)

save_plt(p_longsecsum, "p_longsecsum", 15, 7.5)
save_plt(p_secsum_d, "p_secsum_d", 15, 7.5)
save_plt(p_longsecsum_adj, "p_longsecsum_adj", 15, 7.5)
save_plt(p_longsecsum_adj_d, "p_longsecsum_adj_d", 15, 7.5)

save_plt(p_violins, "p_violins", 16, 10) +
    theme(plot.title = element_text(size = 18))

save_plt(p_secsum_20_adj, "p_secsum_20_adj", 15, 10)
save_plt(p_secsum_d_20_adj, "p_secsum_d_20_adj", 18, 10)

save_plt(p_longsum_pred, "p_longsum_pred", 15, 8.5)
save_plt(p_longsum_pred_sec, "p_longsum_pred_sec", 15, 8.5)

save_plt(p_longsum_pred_adj, "p_longsum_pred_adj", 15, 8.5)
save_plt(p_longsum_pred_sec_adj, "p_longsum_pred_sec_adj", 15, 8.5)

save_plt(p_jobsum_20_grid, "p_jobsum_20_grid", 12, 8.5)
save_plt(p_sector_db, "p_sector_db", 12, 6)

