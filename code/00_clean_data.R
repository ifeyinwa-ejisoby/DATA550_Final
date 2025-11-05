# load library
library(tidyverse)

# load in data
here::i_am("code/00_clean_data.R")

data_path <- here::here("data", "bone-marrow.arff")
df <- foreign::read.arff(data_path)

# label data
labelled::var_label(df) <- list(
  Recipientage = "Recipient Age",
  Recipientage10 = "Recipient Age 10",
  Donorage = "Donor Age",
  ABOmatch = "ABO Match",
  Stemcellsource = "Stem Cell Source",
  ANCrecovery = "ANC Recovery",
  PLTrecovery = "PLT Recovery",
  HLAmatch = "HLA Match",
  HLAmismatch = "HLA Mismatch",
  CD3dCD34 = "CD3+ to CD34+ Cell Ratio",
  survival_time = "Survival Time in Days",
  survival_status = "Vital Status"
)

# clean ANC and PLT recovery variables
df <- df %>% 
  mutate(ANCrecovery = na_if(ANCrecovery, 1000000),
         PLTrecovery = na_if(PLTrecovery, 1000000),
         Allele = Alel)

# save clean data 
saveRDS(df,
        file = here::here("data", "data_clean.rds"))
