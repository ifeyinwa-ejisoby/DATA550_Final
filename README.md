# Report Description

This report is the study of the odds of disease relapse of patients in the Pediatrics Bone Marrow Transplant from the UCI ML Repository.

## Build Report

`Makefile`
- navigate to directory where project is open 
- run "make install" in terminal to synchronize package repository 
- run "make" in the terminal to build final report

# Code Description 

`code/00_clean_data.R`
- read raw data from `data/*.arff` file
- save clean data in `data/` folder

`code/01_make_figure.R`
- read clean data from `data/` folder
- save figure in `output/` folder

`code/02_make_table.R`
- read clean data from `data/` folder
- fit logistic regression model
- save regression table in `output/` folder

`code/03_render_report.R`
- render `code/report.Rmd` 
- save compiled report in `reports/` folder

`code/report.Rmd`
- read table and figure from `output/` folder
- display results for final report
