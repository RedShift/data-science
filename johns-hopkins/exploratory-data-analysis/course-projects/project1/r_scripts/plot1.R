# how to call another script to set working directory?

setwd('w:/home/projects/data-science/johns-hopkins/exploratory-data-analysis/course-projects/project1')

# make sure the plots folder exists
if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source('r_scripts/get-clean.R')
png(filename='plots/plot1.png',width=480,height=480,units='px')
hist(power.consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

x<-dev.off()
