setwd('w:/home/projects/data-science/johns-hopkins/exploratory-data-analysis/course-projects/project1')
getwd()

library(data.table)
library(lubridate)
library(RCurl)
setInternet2(use = TRUE)
if (!file.exists('raw-data')) {
  dir.create('raw-data')
}

# download raw data file if not there
if (!file.exists('raw-data/power_consumption.txt')) {
  file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  dest.file='raw-data/power_consumption.zip'
  download.file(url=file.url, destfile=dest.file)
  unzip('raw-data/power_consumption.zip',exdir='raw-data',overwrite=TRUE)
}

# After download, tidy 
if (!file.exists('raw-data/household_power_consumption.txt')) {

  # read limit 2 days
  variable.class<-c(rep('character',2),rep('numeric',7))
  power.consumption<-read.table('raw-data/household_power_consumption.txt',header=TRUE, sep=';',na.strings='?',colClasses=variable.class)
  power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]

  # clean up
  cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity', 'SubMetering1','SubMetering2','SubMetering3')
  colnames(power.consumption)<-cols
  power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
  power.consumption<-power.consumption[,c(10,3:9)]
  
  # cleaned data write 
  write.table(power.consumption,file='raw-data/power_consumption.txt',sep='|',row.names=FALSE) 
} else {
    power.consumption<-read.table('raw-data/power_consumption.txt',header=TRUE,sep='|')
    power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)  
 }
# cleanup files
#if (file.exists('raw-data/household_power_consumption.txt')) {
#  x<-file.remove('raw-data/household_power_consumption.txt')
#}
