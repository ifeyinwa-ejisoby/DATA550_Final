report.html: code/03_render_report.R code/report.Rmd \
  code/02_make_table.R output/logistic_reg_table.rds \
  code/01_make_figure.R output/densityplot.png
	Rscript code/03_render_report.R

data/data_clean.rds: code/00_clean_data.R data/bone-marrow.arff
	Rscript code/00_clean_data.R

output/densityplot.png: code/01_make_figure.R data/data_clean.rds
	Rscript code/01_make_figure.R
	
output/logistic_reg_table.rds: code/02_make_table.R data/data_clean.rds
	Rscript code/02_make_table.R
	
clean:
	rm -f data/*.rds && rm -f output/*.rds && rm -f output/*.png \
	 && rm -f *.html && rm -f reports/*.html