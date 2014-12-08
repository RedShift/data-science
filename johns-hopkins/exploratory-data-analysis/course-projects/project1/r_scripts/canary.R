setwd('w:/home/projects/data-science/johns-hopkins/exploratory-data-analysis/course-projects/project1')
getwd()

# required packages
library(data.table)
library(lubridate)
library(RCurl)

# create raw-data dir 
if (!file.exists('raw-data')) {
  dir.create('raw-data')
}
