library(tidyverse)                           
library("gridExtra")
library(hrbrthemes)
library(ggthemes)
library(ggpubr)
library(kableExtra)
library(remotes)
library(waffle)
library(ggpubr)


# colpal <- c('#f7fcfd','#e0ecf4','#bfd3e6','#9ebcda','#8c96c6','#8c6bb1','#88419d','#810f7c','#4d004b') #Blue
# colpal <- c('#fff7fb','#ece2f0','#d0d1e6','#a6bddb','#67a9cf','#3690c0','#02818a','#016c59','#014636') #green
# colpal <- c('#fff7f3','#fde0dd','#fcc5c0','#fa9fb5','#f768a1','#dd3497','#ae017e','#7a0177','#49006a') # pinks

theme_ric <- function(plt, plot.case) {
    x <- plt 
    if (plot.case == "nl") {
        x = x + theme_wsj(base_size = 16) +
            theme(legend.position = "none")
    } else if (plot.case == "waf") {
        x = x + 
            theme_wsj(base_size = 16, color = "white") +
            theme(legend.position = "bottom",
                  panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank(),
                  panel.border = element_blank(),
                  panel.background = element_blank(),
                  axis.line.x = element_blank(),
                  axis.ticks.x = element_blank(),
                  axis.ticks = element_blank(),
                  legend.text = element_text(size=18),
                  legend.title = element_blank(),
                  legend.margin=margin(-20,0,40,0),
                  legend.box.margin=margin(-10,-10,-10,-10)) +
            theme_enhance_waffle() 
    } else if (plot.case == "line"){
        x = x + theme_wsj(base_size = 16) + theme(
            legend.title = element_blank()
        )
    }
    return(x)
}

save_ric <- function(plt, plt.name, plt.wdt, plt.hgt){
    ggsave(plt.name, 
           plot = plt,
           device = "png",
           scale=1,
           width = plt.wdt,
           height = plt.hgt,
           path = "plots/")
}

master <- data.table::fread(file = "data/master.csv")
master <- as_tibble(master)
master = mutate(master,calendar_year = calendar_year-1996)

master = mutate(master,taxable_benefits = 
                    ifelse(is.na(taxable_benefits), 0, taxable_benefits))
master = drop_na(master)

master = master %>% 
    mutate(salary_paid = 
               ifelse(salary_paid>3000000,
                      salary_paid/100,
                      salary_paid),
           total_income = salary_paid + taxable_benefits) %>% 
    rename(salary = salary_paid,
           benefits = taxable_benefits,
           year = calendar_year)

master = master %>% 
    mutate(sector = case_when(
        str_detect(sector, "government ") ~ "ontario public service",
        str_detect(sector, "hydro one") ~ "ontario power generation",
        TRUE ~ sector),
        sector = str_to_title(sector)) %>% 
    filter(sector!="Seconded")

# 2020 
master_20 = filter(master, year == 24)
master_19 = filter(master, year == 23)

# Sector Summary 20 
secsum_20 = master_20 %>% 
    group_by(sector) %>% 
    summarise(money = mean(total_income),
              sec_feq = n()) 

secsum_20 = arrange(secsum_20, 
                    desc(sec_feq)) %>%
    mutate(rank = 1:nrow(secsum_20))

########################################################## Waffle

waf <- ggplot(
    secsum_20[order(secsum_20$sec_feq),],
    aes(fill = reorder(sector, rank),
        values = round(sec_feq/100))) +
    expand_limits(x=c(0,0),
                  y=c(0,0)) +
    coord_equal() +
    labs(fill = NULL,
         color = NULL) +
    theme_enhance_waffle() 

waf = waf + geom_waffle(
    n_rows = 10, 
    size = .5, 
    make_proportional = TRUE,
    flip= TRUE,
    color="white",
    radius = unit(4, "pt")) +
    guides(fill = guide_legend(nrow = 3))

waf = theme_ric(waf, "waf")
save_ric(waf, "waffle", 12, 8)

########################################################## Waffle
########################################################## p_secsum_d_20

p_secsum_d_20 <- ggplot(secsum_20, 
                        aes(y=reorder(factor(sector),
                                      money), 
                            x=money, 
                            fill=reorder(factor(sector),
                                         rank))) + 
    geom_bar(stat="identity") +
    ggtitle("Average Earnings by Sector in 2020") +
    xlab("Avg Earnings")+
    ylab(element_blank())+
    scale_x_continuous(labels=scales::dollar_format()) 

p_secsum_d_20  = theme_ric(p_secsum_d_20, "nl")
save_ric(p_secsum_d_20, "p_secsum_d_20", 18, 10)

########################################################## p_secsum_d_20

# Sector change from last year 

#Get 19
secsum_19 = master_19 %>% 
    group_by(sector) %>% 
    summarise(money19 = mean(total_income),
              n19=n())

secsum_19 = arrange(secsum_19, desc(n19)) %>% mutate(rank = 1:nrow(secsum_19))

########################################################## change_1920

change_1920 = left_join(secsum_20, secsum_19,"sector") %>% 
    mutate(delta_count = sec_feq - n19, 
           delta_money = money - money19)

p_change_1920 <- ggplot(change_1920, 
                        aes(x=reorder(sector,
                                      -delta_count), 
                            y=delta_count, 
                            label=delta_count, 
                            color=reorder(sector,
                                          rank.x))) +
    geom_point(aes(fill=reorder(sector,
                                rank.x)),
               stat="identity",
               size=8,
               pch=21) + 
    geom_segment(aes(y=0,
                     x=sector,
                     yend=delta_count,
                     xend=sector,
                     color=reorder(sector,
                                   rank.x)),
                 size=2)+
    geom_text(color="black",
              size=5,
              nudge_x = .25) + 
    scale_y_continuous(labels=scales::number_format(),
                       limits = c(-500,17500)) +
    coord_flip() + 
    ggtitle("Change by Sector (19-20)")+
    ylab("Delta Count")+
    xlab("")

p_change_1920 = theme_ric(p_change_1920, "nl")
save_ric(p_change_1920, "p_change_1920", 20, 8.5)

########################################################## change_1920
########################################################## change_1920_d

p_change_1920_d <- ggplot(change_1920,
                          aes(x=reorder(sector,
                                        -delta_money), 
                              y=delta_money, 
                              label=round(delta_money), 
                              color=reorder(sector,
                                            rank.x))) +
    geom_point(aes(fill=reorder(sector,
                                rank.x)),
               stat="identity", 
               size=8,
               pch=21) + 
    geom_segment(aes(y=0,
                     x=sector,
                     yend=delta_money,
                     xend=sector,
                     color=reorder(sector,
                                   rank.x)),
                 size=2)+
    geom_text(color="black",
              size=5,
              nudge_x=.25) + 
    coord_flip() + 
    ggtitle("Change in Avg Earnings by Sector (19 - 20) ")+
    ylab("Delta Avg Earnings")+
    xlab("Count")+ 
    scale_y_continuous(labels=scales::dollar_format(),
                       limits = c(-6000,6000))

p_change_1920_d = theme_ric(p_change_1920_d, "nl")
save_ric(p_change_1920_d, "p_change_1920_d", 20, 8.5)

########################################################## change_1920_d
########################################################## job_titles

jobs20 = master_20 %>% 
    group_by(sector) %>% 
    count(job_title, sort=TRUE) %>% 
    ungroup() %>% 
    group_by(sector) %>% 
    slice(1:5)

crown_20 = jobs20 %>% 
    filter(sector == "Crown Agencies")

univ_20 = jobs20 %>% 
    filter(sector == "Universities")

power_20 = jobs20 %>% 
    filter(sector == "Ontario Power Generation")

jobs19 = master_19 %>% 
    group_by(sector) %>% 
    count(job_title, sort=TRUE) %>% 
    ungroup() %>% 
    group_by(sector) %>% 
    slice(1:5)

crown_19 = jobs19 %>% 
    filter(sector == "Crown Agencies")

univ_19 = jobs19 %>% 
    filter(sector == "Universities")

power_19 = jobs19 %>% 
    filter(sector == "Ontario Power Generation")

########################################################## job_titles
########################################################## longsum

p_longsum <- ggplot(master, 
                    aes(x=year)) +
    scale_y_continuous(labels=scales::number_format())+
    geom_bar(
        # fill="#2270b5"
    ) +
    ggtitle("Count Across Time")+
    ylab("Count")+
    xlab("Year")

p_longsum_d <- ggplot(master, 
                      aes(y=total_income, x=year)) + 
    geom_bar(stat="summary"
             # fill="#6bafd6"
    ) +
    scale_y_continuous(labels=scales::dollar_format()) +
    ggtitle("Avg Earnings Across Time")+
    ylab("Avg Earnings")+
    xlab("Year") 

p_longsum_grid = arrangeGrob(theme_ric(p_longsum, "nl"),
                             theme_ric(p_longsum_d,"nl"),
                             nrow=2)

save_ric(p_longsum_grid, "p_longsum_grid", 10, 10)

########################################################## longsum 
########################################################## longsum % change

secsum = master %>% 
    group_by(sector, year) %>% 
    summarise(money = mean(total_income),
              sec_feq = n()) 

rank_20 = secsum_20 %>% select(sector, rank)
secsum = left_join(secsum, rank_20, by="sector")

secsum_perc <- secsum %>%
    group_by(sector) %>%
    arrange(year) %>%
    mutate(money_chg = (money - lag(money))/lag(money),
           sec_feq_chg = (sec_feq - lag(sec_feq))/lag(sec_feq))

secsum_perc = secsum_perc %>% 
    mutate(money_chg = ifelse(is.na(money_chg), 0, money_chg),
           sec_feq = ifelse(is.na(sec_feq), 0, sec_feq))

p_secsum_perc <- ggplot(secsum_perc, aes(x=year, y=sec_feq_chg)) +
    geom_line(aes(color=factor(sector)))

p_secsum_perc = theme_ric(p_secsum_perc, "line")

p_secsum_perc_d <- ggplot(secsum_perc, aes(x=year, y=money_chg)) +
    geom_line(aes(color=factor(sector)))

p_secsum_perc_d = theme_ric(p_secsum_perc_d, "line")

p_secsum_perc_grid = arrangeGrob(p_secsum_perc,
                                 p_secsum_perc_d,
                                 nrow=2)

save_ric(p_secsum_perc_grid, "p_secsum_perc_grid", 15, 12)

########################################################## longsum % change
########################################################## longsum % change

longsecsum_d = master %>% 
    group_by(sector, year) %>% 
    summarise(avg_income = mean(total_income))

p_longsecsum <- ggplot(master,aes(x=year)) +
    geom_histogram(aes(fill=factor(sector)),
                   binwidth=.5) + 
    scale_y_continuous(labels=scales::number_format()) +
    ggtitle("Sector Breakdown Through Time")+
    xlab("Year")+
    ylab("Count")+
    theme_bw() +
    theme(legend.title = element_blank(),
          legend.position = "bottom",
          panel.background = element_rect(fill = "#dadada"))

p_longsecsum_d <- ggplot(longsecsum_d, 
                         aes(x=year,
                             y=avg_income)) + 
    geom_line(aes(color=factor(sector)),lwd=1.5) + 
    scale_y_continuous(labels=scales::dollar_format(),
                       limits = c(100000, 175000)) +
    ggtitle("Sector Avg Earnings Through Time")+
    xlab("Avg Earnings")+
    ylab("Count")+
    theme_bw() + 
    theme(legend.position = "none",
          panel.background = element_rect(fill = "#dadada")) 

grid.arrange(theme_ric(p_longsecsum, "bar"), theme_ric(p_longsecsum_d, "bar"), nrow=2)

