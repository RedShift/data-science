#  source("r_scripts/init.R")
setwd('w:/home/projects/data-science/johns-hopkins/exploratory-data-analysis/course-projects/project1')

options(repos=structure(c(CRAN="http://watson.nci.nih.gov/cran_mirror")))
install.packages("data.table")
install.packages("lubridate")
install.packages("RCurl")

#
#install.packages("ggplot2")

# test
source('r_scripts/canary.R')
