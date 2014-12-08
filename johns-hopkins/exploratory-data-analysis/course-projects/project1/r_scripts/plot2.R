setwd('w:/home/projects/data-science/johns-hopkins/exploratory-data-analysis/course-projects/project1')

if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source('r_scripts/get-clean.R')
png(filename='plots/plot2.png',width=480,height=480,units='px')
plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

x<-dev.off()
