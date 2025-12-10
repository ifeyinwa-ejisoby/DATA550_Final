# Report Description

This report is the study of the odds of disease relapse of patients in the Pediatrics Bone Marrow Transplant from the UCI ML Repository.

## Build Report Using Docker

- in the terminal, navigate to directory where project is open 

`To build the docker image (optional)`
- have no fear, the docker image is already built here: https://hub.docker.com/repository/docker/feyinator/final_image/general
- however, if you'd like to build it yourself, type "make build_image" into the terminal

`To run the docker container and build the report`
- run "make final_report" into the terminal to run the docker image and build the final report; the final report will be located in the `reports/` folder of your local machine's project directory

## Build Report Using Make

- in the terminal, navigate to directory where project is open
- type "make install" into the terminal to sync project library
- type "make" into the terminal to build report; the final report will be located in the `reports/` folder of your local machine's project directory

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
