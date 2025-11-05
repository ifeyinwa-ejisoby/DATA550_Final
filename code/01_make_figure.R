# load libraries
library(gtsummary)
library(plyr)
library(ggplot2)

# load in data
here::i_am("code/01_make_figure.R")
df <- readRDS(file = here::here("data/data_clean.rds"))

# make mean lines for disease group 
mu <- ddply(df, 
                  "Disease", 
                  summarise, 
                  grp.mean=mean(Recipientage))

# make figure
densityplot <- ggplot(df, aes(x=Recipientage, color=Disease, fill=Disease)) +
  geom_density(alpha=0.05) +
  geom_vline(data=mu, aes(xintercept=grp.mean, color=Disease),
             linetype="dashed") +
  labs(title = "Distribution of Recipient Age by Disease Group",
      x = "Recipient Age (years)",
      y = "Density",
      caption = "ALL = Acute Lymphoblastic Leukemia
              AML = Acute Myeloid Leukemia") +
  theme_bw()

# save figure
ggsave(here::here("output/densityplot.png"),
        plot = densityplot,
        device = "png")
# remove mu object
rm(mu)