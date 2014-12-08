setwd('w:/home/projects/data-science/johns-hopkins/exploratory-data-analysis/course-projects/project1')

if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source('r_scripts/get-clean.R')
png(filename='plots/plot4.png',width=480,height=480,units='px')
par(mfrow=c(2,2))
plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power',xlab='',type='l')
plot(power.consumption$DateTime,power.consumption$Voltage,xlab='datetime',ylab='Voltage',type='l')
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(power.consumption$DateTime,power.consumption$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(power.consumption$DateTime,power.consumption$SubMetering2,col=lncol[2])
lines(power.consumption$DateTime,power.consumption$SubMetering3,col=lncol[3])
plot(power.consumption$DateTime,power.consumption$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')

x<-dev.off()
