library(tidyverse)
library(mgcv)
library(modelr)

# Models w/o Sectors ------------------------------------------------------
# I used a Poisson distribution because the variable of interest is a count. 

# We feed the model a dataframe including a summary by year excluding 2020
longsum_pred <- longsum %>% filter(year < 24)

# Linear Model with Poisson Distribution
lin_model <- gam(sec_frq ~ year,
                 data = longsum_pred,
                 family = "poisson"
)

# summary(lin_model)

#GAM Model with Poisson Distribution
gam_model <- gam(sec_frq ~ s(year, bs = "cr", k = 2),
                 data = longsum_pred,
                 family = "poisson"
)
# summary(gam_model)

# Predict the complete data using the linear model
lim_pred <- add_predictions(longsum, lin_model, var = "pred", type = "response")

# Predict the complete data using the GAM model
gam_pred <- add_predictions(longsum, gam_model, var = "pred", type = "response")

# The Confidence Interval can be obtained by uncommenting the following lines.
# z_score <- qt(.975, df = 23)
# gam_pred_2 <- predict(gam_model, newdata = newdf, type="response", se.fit = TRUE)
# gam_pred_2 = data.frame(newdf,gam_pred_2) %>% mutate(
#     upper = fit + z_score*se.fit,
#     lower = fit - z_score*se.fit
# )

# Models w Sectors --------------------------------------------------------
# We model indivudally the three sectors of interest 

# Data summarized by sector and year with 2020 removed
longsec_pred <- secsum %>%
    filter(year < 24)

# CROWN AGENCIES 
crown_pred_mod <- longsec_pred %>%
    filter(sector == "Crown Agencies")
# Linear Model
crown_lin <- gam(sec_frq ~ year, 
                 data = crown_pred_mod,
                 family = "poisson"
)
# GAM
crown_gam <- gam(sec_frq ~ s(year),
                 data = crown_pred_mod,
                 family = "poisson"
)

# SCHOOL BOARDS
school_pred_mod <- longsec_pred %>%
    filter(sector == "School Boards")
# Linear Model
school_lin <- gam(sec_frq ~ year,
                  data = school_pred_mod,
                  family = "poisson"
)
# GAM
school_gam <- gam(sec_frq ~ s(year),
                  data = school_pred_mod,
                  family = "poisson"
)


# HOSPITALS
hosp_pred_mod <- longsec_pred %>%
    filter(sector == "Hospitals And Boards Of Public Health")
# Linear Model
hosp_lin <- gam(sec_frq ~ year,
                data = hosp_pred_mod,
                family = "poisson"
)
# GAM
hosp_gam <- gam(sec_frq ~ s(year),
                data = hosp_pred_mod,
                family = "poisson"
)

# summary(crown_lin)
# summary(crown_gam)
# 
# summary(school_lin)
# summary(school_gam)
# 
# summary(hosp_lin)
# summary(hosp_gam)

# Forecast CROWN
crown_pred <- secsum %>%
    filter(sector == "Crown Agencies")
crown_pred <- add_predictions(crown_pred, crown_gam,
                              var = "pred", type = "response"
)

# Forecast School
school_pred <- secsum %>%
    filter(sector == "School Boards")
school_pred <- add_predictions(school_pred, school_gam,
                               var = "pred", type = "response"
)

# Forecast Hospitals
hosp_pred <- secsum %>%
    filter(sector == "Hospitals And Boards Of Public Health")
hosp_pred <- add_predictions(hosp_pred, hosp_gam,
                             var = "pred", type = "response"
)

gam_sector_plot_test <- rbind(crown_pred, school_pred, hosp_pred)

ggplot(gam_sector_plot_test, aes(x = year, y = pred)) +
    geom_line() +
    geom_point(aes(x = year, y = sec_frq), color = "red", alpha = .5) +
    facet_wrap(~sector, scales = "free_y")
