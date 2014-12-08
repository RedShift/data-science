setwd('w:/home/projects/data-science/johns-hopkins/exploratory-data-analysis/course-projects/project1')

if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source('r_scripts/get-clean.R')
png(filename='plots/plot3.png',width=480,height=480,units='px')
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(power.consumption$DateTime,power.consumption$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(power.consumption$DateTime,power.consumption$SubMetering2,col=lncol[2])
lines(power.consumption$DateTime,power.consumption$SubMetering3,col=lncol[3])

legend('topright',legend=lbls,col=lncol,lty='solid')

x<-dev.off()
