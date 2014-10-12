setwd("F://R//ExploratoryDataAnalysis");

#read only observations having date 1/2/2007 or 2/2/2007
library(sqldf);
power <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",eol="\n",sql="select * from file where Date in ('1/2/2007','2/2/2007')");

#Combine Date and Time variables and convert to POSIXlt,POSIXct class
power$DateTime <- paste(power$Date,power$Time);
power$DateTime <- strptime(power$DateTime,"%d/%m/%Y %H:%M:%S");

png(file="plot3.png",height=480,width=480,units="px")
par(mfrow=c(1,1))
with (power,{
  plot(DateTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  
  lines(DateTime,Sub_metering_1)
  lines(DateTime,Sub_metering_2,col="red")
  lines(DateTime,Sub_metering_3,col="blue")
  legend("topright",lwd="2",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
});
dev.off() 

