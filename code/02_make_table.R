# load library
library(gtsummary)
library(broom.helpers)
library(car)
library(parameters)

# load data
here::i_am("code/02_make_table.R")
df <- readRDS(file = here::here("data/data_clean.rds"))

# fit logistic regression model
fit <- glm(
  Relapse ~ Donorage + Recipientage + HLAmismatch + Disease + CD3dCD34,
  family = binomial(link = "logit"),
  data = df)

# make table for regression results
logistic_reg_table <- tbl_regression(fit, exponentiate = TRUE) %>% 
  modify_caption("Logistic Regression Model for Disease Relapse") %>% 
  bold_p(t=0.05) %>% 
  add_global_p()

# save regression table
saveRDS(logistic_reg_table,
        file = here::here("output/logistic_reg_table.rds"))