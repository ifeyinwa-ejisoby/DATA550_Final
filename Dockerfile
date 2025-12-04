FROM rocker/tidyverse:4.5.1 AS base

# create project directory
RUN mkdir /home/rstudio/final_project
WORKDIR /home/rstudio/final_project

# create renv folder 
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R 
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

# restore package library
RUN Rscript -e "renv::restore(prompt = FALSE)"

#-----
# next stage of image build
FROM rocker/tidyverse:4.5.1

RUN mkdir /home/rstudio/final_project
WORKDIR /home/rstudio/final_project

COPY --from=base /home/rstudio/final_project .

# copy folders makefile
COPY Makefile Makefile

RUN mkdir ./code
RUN mkdir ./output
RUN mkdir ./reports
RUN mkdir ./report

COPY data/bone-marrow.arff ./data/
COPY /code ./code/

# generate report
CMD make