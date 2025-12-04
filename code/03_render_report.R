# load rmarkdown
library(rmarkdown)
pandoc::pandoc_activate("latest")
here::i_am("code/03_render_report.R")

# render report
render("code/report.Rmd",
       output_dir = "reports")