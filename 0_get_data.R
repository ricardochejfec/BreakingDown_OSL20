library(tidyverse)                            # Lib for plotting
library(janitor)                              # Lib for variable name clean up


clean_up = function(dat_col){
    returnable = dat_col %>%  
        str_replace_all( "-", "") %>%
        str_replace_all( "—", "") %>%
        str_replace_all( ":", "") %>%
        str_replace_all( "&", "and") %>% 
        str_replace_all( "\\*", "") %>% 
        trimws() %>% 
        tolower() 
    return(returnable)
}

data_links = c(
    "https://files.ontario.ca/2010.csv",
    "https://files.ontario.ca/2011_0.csv",
    "https://files.ontario.ca/pssd-en-2012-fixed_0.csv",
    "https://files.ontario.ca/pssd-en-2013.csv",
    "https://files.ontario.ca/2014-pssd-full-compendium-utf8-en.csv",
    "https://files.ontario.ca/pssd/en-2015-pssd-compendium-with-addendum-20161219.csv", # 2015 (2014 is missing)
    "https://files.ontario.ca/en-2016-pssd-compendium-20171128-utf8.csv",               # 2016
    "https://files.ontario.ca/en-2018-pssd-compendium.csv",  
    "https://files.ontario.ca/en-2018-pssd-compendium-20191223.csv",
    "https://files.ontario.ca/tbs-pssd-compendium-2019-en-2020-12-21.csv",
    "https://files.ontario.ca/pssd/2020/tbs-pssd-compendium-en-2020.csv"
)

read_a = function(name){
    a <- readr::read_csv(file = name)
    a <- clean_names(a)
    if (is.numeric(a$'salary_paid')==FALSE) {
        a$salary_paid <- parse_number(a$salary_paid)
        a$taxable_benefits <- parse_number(a$taxable_benefits)
    }
    return(a)
}

findCSV = function( dl){
    master = vector(mode = "list", length = 25)
    for (x in 1996:2009) {
        master[[x-1995]] <- read_a(paste("https://files.ontario.ca/en-",x,"-pssd.csv"))
    }
    y=15
    for (x in dl) { 
        master[[y]] <- read_a(x)
        y=y+1
    }
    return(master)
}

master <- findCSV(data_links)
master = bind_rows(master)
master = mutate(master, job_title =
                    coalesce(job_title, position)) %>% 
    select(sector, salary_paid, taxable_benefits, job_title, calendar_year)

master$sector = clean_up(master$sector)
master$job_title = clean_up(master$job_title)

master = master %>% 
    mutate(sector = case_when(
        str_detect(sector, "seconded") ~ "seconded",
        str_detect(sector, "hospitals") ~ "hospitals and boards of public health",
        str_detect(sector, "universities") ~ "universities",
        str_detect(sector, "other public sector") ~ "other public sector",
        str_detect(sector, "government of ontario  legislative") ~ 
            "government of ontario  legislative assembly and offices", 
        str_detect(sector, "municipalities") ~ "municipalities and services",
        str_detect(sector, "colleges") ~ "colleges",
        TRUE ~ sector
    )
    ) %>% 
    mutate(job_title = case_when(
        str_detect(job_title, "professor") ~ "professor",
        str_detect(job_title, "professeur") ~ "professor",
        str_detect(job_title, "registered nurse") ~ "registered nurse",
        str_detect(job_title, "instructor") ~ "instructor",
        str_detect(job_title, "provincial coordinator") ~ "provincial coordinator",
        str_detect(job_title, "faculty") ~ "faculty", 
        str_detect(job_title, "case manager") ~ "case manager",
        str_detect(job_title, "specialist  return to work program") ~ "specialist return to work program",
        str_detect(job_title, "manager  operations chef de service") ~ "manager operations chef de service",
        str_detect(job_title, "director") ~ "director",
        str_detect(job_title, "judge") ~ "judge",
        str_detect(job_title, "presiding justice of the peace") ~ "presiding justice of the peace",
        str_detect(job_title, "case management master") ~ "case management master",
        str_detect(job_title, "nurse") ~ "registered nurse",
        str_detect(job_title, "teacher  elementary") ~ "elementary teacher",
        str_detect(job_title, "teacher  secondary") ~ "secondary teacher",
        str_detect(job_title, "presiding justice of the peace") ~ "presiding justice of the peace",
        TRUE ~ job_title 
    )
    )

master$job_title = sub("/.*", "", x=master$job_title)
master$job_title = sub("\\\\.*", "", x=master$job_title)



write_csv(master, "data/master.csv")
