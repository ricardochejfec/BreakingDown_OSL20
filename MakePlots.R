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
            theme(legend.position = "none",
                  plot.title.position =  "plot")
        } else if (plot.case == "waf") {
        x = x + 
            theme_wsj(base_size = 16) +
            # theme_enhance_waffle() +
            theme(panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank(),
                  panel.border = element_blank(),
                  panel.background = element_rect(fill="#f8f2e4"),
                  plot.background = element_rect(fill="#f8f2e4"),
                  strip.background = element_rect(fill="#f8f2e4"),
                  plot.title.position =  "plot",
                  axis.text.x = element_blank(),
                  axis.text.y = element_blank(),
                  axis.line.x = element_blank(),
                  axis.ticks.x = element_blank(),
                  axis.ticks = element_blank(),
                  legend.text = element_text(size=18),
                  legend.title = element_blank(),
                  legend.position = "right",
                  legend.direction = "vertical")
    } else if (plot.case == "line"){
        x = x + theme_wsj(base_size = 16) + theme(
            legend.title = element_blank())
    }else if (plot.case == "l"){
        x = x + theme_wsj(base_size = 16) +
            theme(legend.position = "bottom",
                  plot.title.position =  "plot")
    } else if (plot.case == "grid"){
        x = x + theme_wsj(base_size = 16) + theme(
            legend.position = "none")
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
         color = NULL) 

waf = waf + geom_waffle(
    n_rows = 10, 
    size = .5, 
    make_proportional = TRUE,
    flip= TRUE,
    color="#f8f2e4",
    radius = unit(4, "pt")) +
    ggtitle("Distribution of Sectors for 2020") +
    guides(fill = guide_legend(nrow = 9)) 

waf = theme_ric(waf, "waf")

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
master = master %>% mutate(lbl_year = year + 1996)
p_longsum <- ggplot(master, 
                    aes(x=lbl_year)) +
    scale_y_continuous(labels=scales::number_format())+
    geom_bar(
        # fill="#2270b5"
    ) +
    ggtitle("Count Across Time")+
    ylab("Count")+
    xlab("Year")

p_longsum_d <- ggplot(master, 
                      aes(y=total_income, x=lbl_year)) + 
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
           sec_feq_chg = ifelse(is.na(sec_feq_chg), 0, sec_feq_chg))

####### Recessions? ######

secsum_perc = secsum_perc %>% 
    mutate(recession = ifelse(year==12 | year==19 | year==22 | year==24,
                              1, 0))

ggplot(secsum_perc, aes(x=recession, y= sec_feq_chg)) + 
    geom_point(alpha=.5) + geom_smooth()

answer = lm(sec_feq_chg ~ factor(recession), data = secsum_perc)

summary(answer)

####### Recessions? ######

secsum_perc = secsum_perc %>% mutate(lbl_year=year +1996)
p_secsum_perc <- ggplot(secsum_perc, aes(x=lbl_year, y=sec_feq_chg)) +
    geom_line(aes(color=factor(sector)))

p_secsum_perc = theme_ric(p_secsum_perc, "grid")

p_secsum_perc_d <- ggplot(secsum_perc, aes(x=lbl_year, y=money_chg)) +
    geom_line(aes(color=factor(sector)))

p_secsum_perc_d = theme_ric(p_secsum_perc_d, "line")

p_secsum_perc_grid = arrangeGrob(p_secsum_perc,
                                 p_secsum_perc_d,
                                 nrow=2)

########################################################## longsum % change
########################################################## longsecsum

longsecsum_d = master %>% 
    group_by(sector, year) %>% 
    summarise(avg_income = mean(total_income)) %>% 
    mutate(lbl_year=year+1996)


p_longsecsum <- ggplot(master,aes(x=lbl_year)) +
    geom_histogram(aes(fill=factor(sector)),
                   binwidth=.5) + 
    scale_y_continuous(labels=scales::number_format()) +
    ggtitle("Sector Breakdown Through Time")+
    xlab("Year")+
    ylab("Count")

p_longsecsum_d <- ggplot(longsecsum_d, 
                         aes(x=lbl_year,
                             y=avg_income)) + 
    geom_line(aes(color=factor(sector)),lwd=1.5) + 
    scale_y_continuous(labels=scales::dollar_format(),
                       limits = c(100000, 175000)) +
    ggtitle("Sector Avg Earnings Through Time")+
    xlab("Avg Earnings")+
    ylab("Count")+
    theme_bw() 

p_longsecsum = theme_ric(p_longsecsum, "l")
p_longsecsum_d = theme_ric(p_longsecsum_d, "nl")

########################################################## longsecsum
########################################################## inflation

inflation <- readr::read_csv("data/inflation.csv")
inflation = head(inflation, 1)
inflation = pivot_longer(inflation, 2:26, names_to = "year",
                         values_to = "cpi") %>%
    mutate(year = as.numeric(year)-1996,
           indexed = cpi/88.2) %>%
    select(year, indexed)

master_inf = left_join(x=master, y=inflation) %>%
    mutate(income_inf = total_income / indexed,
           salary_inf = salary / indexed,
           benefits_inf = benefits / indexed)

master_adj = master_inf %>% filter(salary_inf>=100000)

master_20_adj = master_adj %>% filter(year==24)

secsum_20_adj = master_20_adj %>% 
    group_by(sector) %>% 
    summarise(money = mean(income_inf), sec_feq=n()) 

secsum_20_adj = secsum_20_adj %>% 
    mutate(perc = sec_feq/nrow(master_20))

secsum_20_adj2 = left_join(x=secsum_20_adj, y=rank_20)

########################################################## inflation
########################################################## violins

p_violins <- ggplot(master_inf, aes(x=factor(year), y=salary_inf)) +
    geom_violin() + 
    geom_hline(yintercept = 100000, color="#2270b5") + 
    ggtitle("Distribution of the OSL in real numbers") +
    xlab("Year") +
    ylab("Salary in Real Dollars (1996)") +
    scale_y_continuous(labels=scales::dollar_format(),
                       limits = c(50000,500000))

p_violins = theme_ric(p_violins, "nl")

########################################################## violins
########################################################## p_secsum_20_adj 

p_secsum_20_adj <- ggplot(secsum_20_adj2, 
                          aes(y=reorder(factor(sector), sec_feq),
                              x=sec_feq, 
                              fill=reorder(factor(sector), rank))) + 
    geom_bar(stat="identity") +
    ggtitle("2020 Count, Adjusted for Inflation") +
    xlab("Count") +
    ylab("")+
    scale_x_continuous(labels=scales::number_format())

p_secsum_d_20_adj <- ggplot(secsum_20_adj2, 
                            aes(y=reorder(factor(sector), rank), x=money, fill=sector)) + 
    geom_bar(stat="identity")  +
    ggtitle("2020 Avg Earnings, Adjusted for Inflation") +
    xlab("Avg Earnings") +
    ylab("")+
    scale_x_continuous(labels=scales::dollar_format()) 

p_secsum_20_adj = theme_ric(p_secsum_20_adj, "nl")
p_secsum_d_20_adj = theme_ric(p_secsum_d_20_adj, "nl")

########################################################## p_secsum_20_adj 
########################################################## saves
save_ric(waf, "waffle", 12, 8.5)

save_ric(p_secsum_d_20, "p_secsum_d_20", 15, 8.5)

save_ric(p_change_1920, "p_change_1920", 15, 8.5)

save_ric(p_change_1920_d, "p_change_1920_d", 15, 8.5)

save_ric(p_longsum_grid, "p_longsum_grid", 12, 10)

save_ric(p_secsum_perc_grid, "p_secsum_perc_grid", 12, 10)

save_ric(p_longsecsum, "p_longsecsum", 12, 9.5)
save_ric(p_longsecsum_d, "p_longsecsum_d", 15, 7.5)

save_ric(p_violins, "p_violins", 16, 10) + 
    theme(plot.title = element_text(size = 18))

# save_ric(p_secsum_20_grid, "p_secsum_20_grid", 12, 10)

save_ric(p_secsum_20_adj, "p_secsum_20_adj", 15, 10)
save_ric(p_secsum_d_20_adj, "p_secsum_d_20_adj", 18, 10)

########################################################## saves
