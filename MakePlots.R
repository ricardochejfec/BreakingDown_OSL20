library(tidyverse)                           
library("gridExtra")
library(hrbrthemes)
library(ggthemes)
library(ggpubr)
library(kableExtra)
library(remotes)
library(waffle)
library(ggpubr)
library(modelr)
library(gghighlight)
library(scales)
library(mgcv)

# Jonah
# model by sector doesnt work. 
# where do i put my functions?
# 

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
                  legend.title = element_blank(),
                  legend.position = "right",
                  legend.direction = "vertical",
                  legend.text = element_text(margin = margin(t = 5, b=5),
                                             size=18))
    } else if (plot.case == "line"){
        x = x + theme_wsj(base_size = 16) + theme(
            legend.title = element_blank())
    }else if (plot.case == "l"){
        x = x + theme_wsj(base_size = 16) +
            theme(legend.position = "bottom",
                  legend.title = element_blank(),
                  plot.title.position =  "plot")
    } else if (plot.case == "grid"){
        x = x + theme_wsj(base_size = 16) + theme(
            legend.position = "none")
    }
    return(x)
}

get_jobs <- function(dt.master){
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

save_ric <- function(plt, plt.name, plt.wdt, plt.hgt){
    ggsave(paste(plt.name,"png", sep = "."),
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
           total_income = salary_paid + taxable_benefits,
           lbl_year = calendar_year + 1996) %>% 
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

########################################################## Vars
# 2020 

# Sector Summary 20 
secsum_20 = master %>% 
    filter(year == 24) %>% 
    group_by(sector) %>% 
    summarise(money = mean(total_income),
              sec_feq = n()) 

secsum_20 = arrange(secsum_20, 
                    desc(sec_feq)) %>%
    mutate(rank = 1:nrow(secsum_20))

rank_secs = secsum_20 %>% select(sector, rank)
master = left_join(master, rank_secs, by="sector")

master_20 = filter(master, year == 24)
master_19 = filter(master, year == 23)
########################################################## Vars

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
    radius = unit(9, "pt")) +
    ggtitle("Distribution of Sectors for 2020") +
    guides(fill = guide_legend(nrow = 9)) 

waf = theme_ric(waf, "waf")+theme(plot.title = element_text(size = 32))

########################################################## Waffle
########################################################## p_secsum_d_20

p_secsum_d_20 <- ggplot(secsum_20, 
                        aes(y=reorder(factor(sector),
                                      rank), 
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

secsum_19 = arrange(secsum_19, desc(n19))

########################################################## change_1920

change_1920 = left_join(secsum_20, secsum_19,"sector") %>% 
    mutate(delta_count = sec_feq - n19, 
           delta_money = money - money19)

p_change_1920 <- ggplot(change_1920, 
                        aes(x=reorder(sector,
                                      rank), 
                            y=delta_count, 
                            label=delta_count, 
                            color=reorder(sector,
                                          rank))) +
    geom_point(aes(fill=reorder(sector,
                                rank)),
               stat="identity",
               size=8,
               pch=21) + 
    geom_segment(aes(y=0,
                     x=sector,
                     yend=delta_count,
                     xend=sector,
                     color=reorder(sector,
                                   rank)),
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
                                        rank), 
                              y=delta_money, 
                              label=dollar(round(delta_money)), 
                              color=reorder(sector,
                                            rank))) +
    geom_point(aes(fill=reorder(sector,
                                rank)),
               stat="identity", 
               size=8,
               pch=21) + 
    geom_segment(aes(y=0,
                     x=sector,
                     yend=delta_money,
                     xend=sector,
                     color=reorder(sector,
                                   rank)),
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
########################################################## longsum

p_longsum <- ggplot(master, 
                    aes(x=lbl_year)) +
    scale_y_continuous(labels=scales::number_format())+
    geom_bar() +
    ggtitle("Count Across Time")+
    ylab("Count")+
    xlab("Year")


p_longsum_d <- ggplot(master, 
                      aes(y=total_income, x=lbl_year)) + 
    geom_bar(stat="summary",) +
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

secsum = left_join(secsum, rank_secs, by="sector") %>% 
    mutate(lbl_year=year +1996)

secsum_perc <- secsum %>%
    group_by(sector) %>%
    arrange(year) %>%
    mutate(money_chg = (money - lag(money))/lag(money),
           sec_feq_chg = (sec_feq - lag(sec_feq))/lag(sec_feq))

secsum_perc = secsum_perc %>% 
    mutate(money_chg = ifelse(is.na(money_chg), 0, money_chg),
           sec_feq_chg = ifelse(is.na(sec_feq_chg), 0, sec_feq_chg))

p_secsum_perc <- ggplot(secsum_perc, aes(x=lbl_year, y=sec_feq_chg)) +
    geom_line(aes(color=reorder(factor(sector), rank))) +
    scale_y_continuous(labels=scales::percent_format())

p_secsum_perc = theme_ric(p_secsum_perc, "grid")

p_secsum_perc_d <- ggplot(secsum_perc, aes(x=lbl_year, y=money_chg)) +
    geom_line(aes(color=reorder(factor(sector), rank)))+
    scale_y_continuous(labels=scales::percent_format())

p_secsum_perc_d = theme_ric(p_secsum_perc_d, "line") + 
    theme(legend.justification  = "left")

p_secsum_perc_grid = arrangeGrob(p_secsum_perc,
                                 p_secsum_perc_d,
                                 nrow=2)

########################################################## longsum % change
########################################################## longsecsum

longsecsum_d = master %>% 
    group_by(sector, year) %>% 
    summarise(avg_income = mean(total_income)) %>% 
    mutate(lbl_year=year+1996)

longsecsum_d = left_join(longsecsum_d, rank_secs, by="sector")

p_longsecsum <- ggplot(master, aes(x=lbl_year)) + 
    geom_histogram(aes(fill=reorder(factor(sector), rank)),
                   binwidth=.5) + 
    scale_y_continuous(labels=scales::number_format()) +
    ggtitle("Sector Breakdown Through Time") +
    xlab("Year") +
    ylab("Count") 

p_longsecsum_d <- ggplot(longsecsum_d, 
                         aes(x=lbl_year,
                             y=avg_income)) + 
    geom_line(aes(color=reorder(factor(sector), rank)),lwd=1.3) + 
    scale_y_continuous(labels=scales::dollar_format(),
                       limits = c(100000, 175000)) +
    ggtitle("Sector Avg Earnings Through Time") 

p_longsecsum = theme_ric(p_longsecsum, "l") + 
    theme(legend.justification = 'left')
p_longsecsum_d = theme_ric(p_longsecsum_d, "nl") 
#+ xlab("year") + theme(axis.title=element_text(size=12))

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

secsum_20_adj = left_join(x=secsum_20_adj, y=rank_secs) 

########################################################## inflation
########################################################## violins

p_violins <- ggplot(master_inf, aes(x=factor(lbl_year), y=salary_inf)) +
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

p_secsum_20_adj <- ggplot(secsum_20_adj, 
                          aes(y=reorder(factor(sector), -rank),
                              x=sec_feq, 
                              fill=reorder(factor(sector), rank))) + 
    geom_bar(stat="identity") +
    ggtitle("2020 Count, Adjusted for Inflation") +
    xlab("Count") +
    ylab("")+
    scale_x_continuous(labels=scales::number_format())

p_secsum_d_20_adj <- ggplot(secsum_20_adj, 
                            aes(y=reorder(factor(sector), -rank),
                                x=money, 
                                fill=reorder(factor(sector), rank))) + 
    geom_bar(stat="identity")  +
    ggtitle("2020 Avg Earnings, Adjusted for Inflation") +
    xlab("Avg Earnings") +
    ylab("")+
    scale_x_continuous(labels=scales::dollar_format()) 

p_secsum_20_adj = theme_ric(p_secsum_20_adj, "nl")
p_secsum_d_20_adj = theme_ric(p_secsum_d_20_adj, "nl")

########################################################## p_secsum_20_adj 
########################################################## model NI 

longsum_pred = master  %>% 
    group_by(year) %>% 
    summarise(money = mean(total_income),
              sec_feq = n()) %>% 
    mutate(lbl_year=year+1996)

########################################################## model GAM Long 

longsum_pred_mod = longsum_pred %>% filter(year<24)

lin_model = gam(sec_feq~year, data = longsum_pred_mod,
                family = "poisson")
summary(lin_model)

gam_model =  gam(sec_feq~s(year, bs = "cr", k = 2), data = longsum_pred_mod,
                 family = "poisson")
summary(gam_model)

# p <- predict(gam_model, type="lpmatrix")
# beta <- coef(gam_model)[grepl("sec_feq", names(coef(gam_model)))]
# s <- p[,grepl("sec_feq", colnames(p))] %*% beta
# ggplot(data=cbind.data.frame(s, longsum_pred$sec_feq), aes(x=longsum_pred$sec_feq, y=s)) + geom_line()

newdf <- longsum_pred 
gam_pred <- add_predictions(newdf, gam_model, var="pred",  type="response")
lim_pred <- add_predictions(newdf, lin_model, var="pred", type="response")

z_score = qt(.975, df=23)

# gam_pred_2 <- predict(gam_model, newdata = newdf, type="response", se.fit = TRUE)
# gam_pred_2 = data.frame(newdf,gam_pred_2) %>% mutate(
#     upper = fit + z_score*se.fit,
#     lower = fit - z_score*se.fit
# )


# ggplot(gam_pred_2, aes(x=year, y=fit)) +  
#     geom_ribbon(aes(ymin=lower, ymax=upper), fill="grey") +
#     geom_line() + 
#     geom_point(aes(x=year, y=sec_feq), color="red", alpha=.5)

ggplot(gam_pred, aes(x=year, y=pred)) + geom_line() +
    geom_point(aes(x=year, y=sec_feq), color="red", alpha=.5)

ggplot(lim_pred, aes(x=year, y=pred)) + geom_line() + 
    geom_point(aes(x=year, y=sec_feq), color="red", alpha=.5)

########################################################## model GAM Long 
########################################################## model GAM Sec 

longsum_pred_sec = master  %>% 
    group_by(year, sector) %>% 
    summarise(money = mean(total_income),
              sec_feq = n()) %>% 
    mutate(lbl_year=year+1996)

longsum_pred_sec_mod =  longsum_pred_sec %>% 
    filter(year<24)

crown_pred_mod = longsum_pred_sec_mod %>% 
    filter(sector=="Crown Agencies")
crown_lin = gam(sec_feq~year, data = crown_pred_mod,
                family = "poisson")
crown_gam = gam(sec_feq ~ s(year),
                    data = crown_pred_mod,
                    family = "poisson")

school_pred_mod = longsum_pred_sec_mod %>% 
    filter(sector=="School Boards")
school_lin = gam(sec_feq~year, data = school_pred_mod,
                family = "poisson")
school_gam = gam(sec_feq ~ s(year),
                    data = school_pred_mod,
                    family = "poisson")

hosp_pred_mod = longsum_pred_sec_mod %>% 
    filter(sector=="Hospitals And Boards Of Public Health")
hosp_lin = gam(sec_feq~year, data = hosp_pred_mod,
                 family = "poisson")
hosp_gam = gam(sec_feq ~ s(year),
                 data = hosp_pred_mod,
                 family = "poisson")

summary(crown_lin)
summary(crown_gam)

summary(school_lin)
summary(school_gam)

summary(hosp_lin)
summary(hosp_gam)

crown_pred = longsum_pred_sec %>% 
    filter(sector=="Crown Agencies")
crown_pred <- add_predictions(crown_pred, crown_gam,
                              var="pred", type = "response")

school_pred  = longsum_pred_sec %>% 
    filter(sector=="School Boards")
school_pred <- add_predictions(school_pred, school_gam,
                               var="pred", type = "response")

hosp_pred = longsum_pred_sec %>% 
    filter(sector=="Hospitals And Boards Of Public Health")
hosp_pred <- add_predictions(hosp_pred, hosp_gam,
                             var="pred", type = "response")

gam_sector_plot_test = rbind(crown_pred,school_pred,hosp_pred)

ggplot(gam_sector_plot_test, aes(x=year, y=pred)) + geom_line()+
    geom_point(aes(x=year, y=sec_feq), color="red", alpha=.5)+
    facet_wrap(~sector, scales = "free_y")

########################################################## model GAM Sec 
########################################################## model NI 

p_longsum_pred <- ggplot(longsum_pred %>% filter(lbl_year<=2019),
                         aes(x=lbl_year, y=sec_feq))+ 
    geom_point()+
    xlim(1996,2020)+
    stat_smooth(method="gam", fullrange=TRUE, color="brown") +
    geom_point(data = longsum_pred %>% filter(lbl_year==2020),
               aes(x=lbl_year, y=sec_feq),
               color="orange",
               size=3) +
    ggtitle("Predicting 2020") +
    xlab("Year") +
    ylab("Count") 

p_longsum_pred_sec <- ggplot(longsum_pred_sec %>% filter(lbl_year<=2019),
                             aes(x=lbl_year, y=sec_feq))+ 
    geom_point()+
    xlim(1996,2020)+
    stat_smooth(method="gam", fullrange=TRUE, color="brown") +
    geom_point(data = longsum_pred_sec %>% filter(lbl_year==2020),
               aes(x=lbl_year, y=sec_feq),
               color="orange") +
    ggtitle("Predicting 2020 - Sectors") +
    xlab("Year") +
    ylab("Count") +
    geom_rect(data = subset(longsum_pred_sec,
                            sector %in% c("Crown Agencies",
                                          "School Boards",
                                          "Hospitals And Boards Of Public Health")), 
              fill = NA, colour = "brown", xmin = -Inf,xmax = Inf,
              ymin = -Inf,ymax = Inf) +
    facet_wrap(~sector, scales = "free_y")

p_longsum_pred = theme_ric(p_longsum_pred,"nl")
p_longsum_pred_sec = theme_ric(p_longsum_pred_sec,"nl")

########################################################## model NI 
########################################################## model adj 

longsum_pred_adj = master_adj  %>% 
    group_by(year) %>% 
    summarise(money = mean(total_income),
              sec_feq = n()) %>% 
    mutate(lbl_year=year+1996)

longsum_pred_sec_adj = master_adj  %>% 
    group_by(year, sector) %>% 
    summarise(money = mean(total_income),
              sec_feq = n()) %>% 
    mutate(lbl_year=year+1996)

p_longsum_pred_adj <- ggplot(longsum_pred_adj %>% filter(lbl_year<=2019), 
                             aes(x=lbl_year, y=sec_feq))+ 
    geom_point()+
    xlim(1996,2020)+
    stat_smooth(method="gam", fullrange=TRUE, color="blue") +
    geom_point(data = longsum_pred_adj %>% filter(lbl_year==2020),
               aes(x=lbl_year, y=sec_feq),
               color="red",
               size=3) +
    ggtitle("Predicting 2020") +
    xlab("Year") +
    ylab("Count") 

p_longsum_pred_sec_adj <- ggplot(longsum_pred_sec_adj %>% 
                                     filter(lbl_year<=2019),
                                 aes(x=lbl_year, y=sec_feq))+ 
    geom_point()+
    xlim(1996,2020)+
    stat_smooth(method="gam", fullrange=TRUE) +
    geom_point(data = longsum_pred_sec_adj %>% 
                   filter(lbl_year==2020),
               aes(x=lbl_year, y=sec_feq),
               color="red") +
    ggtitle("Predicting 2020") +
    xlab("Year") +
    ylab("Count") +
    facet_wrap(~sector,scales = "free_y")

p_longsum_pred_sec_adj = theme_ric(p_longsum_pred_sec_adj,"nl")
p_longsum_pred_adj = theme_ric(p_longsum_pred_adj,"nl")

########################################################## model adj
########################################################## management 

prac_jobs_20 <- get_jobs(master_20)
prac_jobs_20_adj <- get_jobs(master_20_adj)

jobsum_20 <- prac_jobs_20 %>%
    group_by(job_title) %>%
    count() %>%
    ungroup() %>%
    mutate(i=row_number())

jobsum_20_adj <- prac_jobs_20_adj %>%
    group_by(job_title) %>%
    count() %>%
    ungroup() %>%
    mutate(i=row_number())

p_jobsum_20 <- ggplot(jobsum_20, aes(x = job_title,y=n)) + 
    geom_bar(stat = "summary") + 
    scale_y_continuous(labels = number_format())+
    ggtitle("2020")


p_jobsum_20 = theme_ric(p_jobsum_20, "nl")

p_jobsum_20_adj <-  ggplot(jobsum_20_adj, aes(x = job_title,y=n)) + 
    geom_bar(stat = "summary")+ 
    scale_y_continuous(labels = number_format())+
    ggtitle("2020 - Adjusted")


p_jobsum_20_adj = theme_ric(p_jobsum_20_adj,"nl")

p_jobsum_20_grid <- arrangeGrob(p_jobsum_20, p_jobsum_20_adj, ncol=2)

########################################################## management 
########################################################## job_deep_dive 

deepdive = function(dtb){
    x <- dtb 
    x = x %>% mutate(job_title = case_when(
        grepl(pattern = "nurse", x=job_title) ~ "nurse", 
        grepl(pattern = "respiratory therapist", x=job_title) ~ "respiratory therapist", 
        grepl(pattern = "teacher", x=job_title) ~ "teacher",
        grepl(pattern = "enseignante", x=job_title) ~ "teacher",
        grepl(pattern = "enseignant", x=job_title) ~ "teacher",
        grepl(pattern = "assistant curriculum leader", x=job_title) ~ "assistant curriculum leader",
        grepl(pattern = "enseignement", x=job_title) ~ "teacher",
        grepl(pattern = "principal", x=job_title) ~ "management",
        grepl(pattern = "direction", x=job_title) ~ "management",
        grepl(pattern = "head", x=job_title) ~ "management",
        grepl(pattern = "chair", x=job_title) ~ "management",
        grepl(pattern = "project manager", x=job_title) ~ "pm", 
        grepl(pattern = "case manager", x=job_title) ~ "cm", 
        grepl(pattern = "manager", x=job_title) ~ "manager", 
        
        TRUE ~ job_title
    ))
    return(x)
}

jobs_deepdive_20 = deepdive(master_20)
jobs_deepdive_19 = deepdive(master_19)

top_10_jobs = jobs_deepdive_20 %>% group_by(job_title) %>% 
    summarise(n=n(), mean_sal = mean(salary)) %>% 
    arrange(-n, .by_group = TRUE) 

dd_20 = jobs_deepdive_20 %>% 
    group_by(sector) %>% 
    count(job_title, sort=TRUE) %>% 
    ungroup() %>% 
    group_by(sector)

dd_19 = jobs_deepdive_19 %>% 
    group_by(sector) %>% 
    count(job_title, sort=TRUE) %>% 
    ungroup() %>% 
    group_by(sector) 

dd_20 = dd_20 %>% filter(sector %in% c("Crown Agencies",
                                       "School Boards",
                                       "Hospitals And Boards Of Public Health",
                                       "Universities",
                                       "Ontario Power Generation"))

dd_19 = dd_19 %>% filter(sector %in% c("Crown Agencies",
                                       "School Boards",
                                       "Hospitals And Boards Of Public Health",
                                       "Universities",
                                       "Ontario Power Generation"))

dd_delta = left_join(dd_20, dd_19, by=c("sector", "job_title")) %>% 
    mutate(n.y = ifelse( is.na(n.y) , 0, n.y),
        delta = n.x-n.y,
        growth = (n.x-n.y)/n.y) %>% 
    slice(1:10)

########################################################## job_titles
########################################################## job_titles



########################################################## job_titles
########################################################## saves

# save_ric(waf, "waffle", 12, 8)
# 
# save_ric(p_secsum_d_20, "p_secsum_d_20", 15, 8.5)
# 
# save_ric(p_change_1920, "p_change_1920", 15, 8.5)
# 
# save_ric(p_change_1920_d, "p_change_1920_d", 15, 8.5)
# 
# save_ric(p_longsum_grid, "p_longsum_grid", 12, 10)
# 
# save_ric(p_secsum_perc_grid, "p_secsum_perc_grid", 12, 10)
# 
# save_ric(p_longsecsum, "p_longsecsum", 15, 7.5)
# save_ric(p_longsecsum_d, "p_longsecsum_d", 15, 7.5)
# 
# save_ric(p_violins, "p_violins", 16, 10) + 
#     theme(plot.title = element_text(size = 18))
# 
# save_ric(p_secsum_20_adj, "p_secsum_20_adj", 15, 10)
# save_ric(p_secsum_d_20_adj, "p_secsum_d_20_adj", 18, 10)
# 
# save_ric(p_longsum_pred, "p_longsum_pred", 15, 8.5)
# save_ric(p_longsum_pred_sec, "p_longsum_pred_sec", 15, 8.5)
# 
# save_ric(p_longsum_pred_adj, "p_longsum_pred_adj", 15, 8.5)
# save_ric(p_longsum_pred_sec_adj, "p_longsum_pred_sec_adj", 15, 8.5)
# 
# save_ric(p_jobsum_20_grid, "p_jobsum_20_grid", 12, 8.5)

 ########################################################## saves