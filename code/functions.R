





# Functions for Data Manipulation -----------------------------------------

# Function that identifies management job titles
get_mgmt <- function(dt.master) {
    require(tidyverse)
    x <- dt.master %>%
        mutate(job_title = case_when(
            grepl(pattern = "chief", x = job_title) ~ "Mgmt",
            grepl(pattern = "manager", x = job_title) ~ "Mgmt",
            grepl(pattern = "director", x = job_title) ~ "Mgmt",
            grepl(pattern = "principal", x = job_title) ~ "Mgmt",
            grepl(pattern = "sergeant", x = job_title) ~ "Mgmt",
            grepl(pattern = "captain", x = job_title) ~ "Mgmt",
            grepl(pattern = "leader", x = job_title) ~ "Mgmt",
            grepl(pattern = "lead", x = job_title) ~ "Mgmt",
            grepl(pattern = "chair", x = job_title) ~ "Mgmt",
            grepl(pattern = "supervisor", x = job_title) ~ "Mgmt",
            grepl(pattern = "head", x = job_title) ~ "Mgmt",
            grepl(pattern = "direction", x = job_title) ~ "Mgmt",
            grepl(pattern = "superintendent", x = job_title) ~ "Mgmt",
            grepl(pattern = "coordinator", x = job_title) ~ "Mgmt",
            grepl(pattern = "president", x = job_title) ~ "Mgmt",
            grepl(pattern = "gestionnaire", x = job_title) ~ "Mgmt",
            grepl(pattern = "dean", x = job_title) ~ "Mgmt",
            grepl(pattern = "commander", x = job_title) ~ "Mgmt",
            grepl(pattern = "lieutenant", x = job_title) ~ "Mgmt",
            grepl(pattern = "administrator", x = job_title) ~ "Mgmt",
            grepl(pattern = "vicedoyen", x = job_title) ~ "Mgmt",
            grepl(pattern = "minister", x = job_title) ~ "Mgmt",
            grepl(pattern = "executive officer", x = job_title) ~ "Mgmt",
            grepl(pattern = "deputy", x = job_title) ~ "Mgmt",
            grepl(pattern = "directeur", x = job_title) ~ "Mgmt",
            grepl(pattern = "committee", x = job_title) ~ "Mgmt",
            grepl(pattern = "commissioner", x = job_title) ~ "Mgmt",
            grepl(pattern = "coordonnateur", x = job_title) ~ "Mgmt",
            TRUE ~ "Proff"
        ))
    return(x)
}

#COMMENT
deepdive <- function(dtb) {
    require(tidyverse)
    x <- dtb
    x <- x %>% mutate(job_title = case_when(
        grepl(pattern = "nurse", x = job_title) ~ "nurse",
        grepl(pattern = "respiratory therapist", x = job_title) ~ "respiratory therapist",
        grepl(pattern = "teacher", x = job_title) ~ "teacher",
        grepl(pattern = "enseignante", x = job_title) ~ "teacher",
        grepl(pattern = "enseignant", x = job_title) ~ "teacher",
        grepl(pattern = "assistant curriculum leader", x = job_title) ~ "assistant curriculum leader",
        grepl(pattern = "enseignement", x = job_title) ~ "teacher",
        grepl(pattern = "principal", x = job_title) ~ "management",
        grepl(pattern = "direction", x = job_title) ~ "management",
        grepl(pattern = "head", x = job_title) ~ "management",
        grepl(pattern = "chair", x = job_title) ~ "management",
        grepl(pattern = "project manager", x = job_title) ~ "pm",
        grepl(pattern = "case manager", x = job_title) ~ "cm",
        grepl(pattern = "manager", x = job_title) ~ "manager",
        TRUE ~ job_title
    ))
    return(x)
}

# Functions for plotting --------------------------------------------------

# Style plots according to type
theme_plt <- function(plt, plot.case) {
    require(tidyverse)
    require(hrbrthemes)
    require(ggthemes)
x <- plt
    if (plot.case == "nl") {
        x <- x + theme_wsj(base_size = 16) +
            theme(
                legend.position = "none",
                plot.title.position = "plot"
            )
    } else if (plot.case == "waf") {
        x <- x +
            theme_wsj(base_size = 16) +
            # theme_enhance_waffle() +
            theme(
                panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(),
                panel.border = element_blank(),
                panel.background = element_rect(fill = "#f8f2e4"),
                plot.background = element_rect(fill = "#f8f2e4"),
                strip.background = element_rect(fill = "#f8f2e4"),
                plot.title.position = "plot",
                axis.text.x = element_blank(),
                axis.text.y = element_blank(),
                axis.line.x = element_blank(),
                axis.ticks.x = element_blank(),
                axis.ticks = element_blank(),
                legend.title = element_blank(),
                legend.position = "right",
                legend.direction = "vertical",
                legend.text = element_text(
                    margin = margin(t = 5, b = 5),
                    size = 18
                )
            )
    } else if (plot.case == "line") {
        x <- x + theme_wsj(base_size = 16) + theme(
            legend.title = element_blank()
        )
    } else if (plot.case == "l") {
        x <- x + theme_wsj(base_size = 16) +
            theme(
                legend.position = "bottom",
                legend.title = element_blank(),
                plot.title.position = "plot"
            )
    } else if (plot.case == "grid") {
        x <- x + theme_wsj(base_size = 16) + theme(
            legend.position = "none"
        )
    }
    return(x)
}

# Function that saves plots to /plots with a specified size
save_plt <- function(plt, plt.name, plt.wdt, plt.hgt) {
    require(tidyverse)
    ggsave(paste(plt.name, "png", sep = "."),
           plot = plt,
           device = "png",
           scale = 1,
           width = plt.wdt,
           height = plt.hgt,
           path = "plots/"
    )
}


# Functions for Displaying Information ------------------------------------

##COMMENT
make_table = function(table.sector){
    require(tidyverse)
    require(gt)
    result_tbl = jobs_tab %>% filter(sector==table.sector) %>% 
        ungroup() %>%
        select(job_title, delta, growth, 
               secinc, 
               totinc) %>% 
        gt() %>%
        fmt_number(columns = vars(delta), decimals = 0) %>%
        fmt_percent(columns = vars(growth, 
                                   secinc, 
                                   totinc),
                    scale_values = TRUE) %>%
        tab_header(
            title = paste("Biggest Changes in", table.sector, sep=" "),
        ) %>%
        cols_label(
            job_title = md("**Job Title**"),
            delta = md("**Change**"), 
            growth = md("**Change %**"),
            secinc = md("**Share of Sector Increase**"),
            totinc = md("**Share of Total Increase**")) %>% 
        cols_align(align = "right", columns = vars(job_title)) %>% 
        cols_align(align = "center", columns = vars(delta, growth, secinc, totinc)) %>% 
        tab_options(
            table.width = pct(100)
        ) 
    return(result_tbl)
}
