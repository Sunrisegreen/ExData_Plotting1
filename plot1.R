setwd("F://R//ExploratoryDataAnalysis");

#read only observations having date 1/2/2007 or 2/2/2007
library(sqldf);
power <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",eol="\n",sql="select * from file where Date in ('1/2/2007','2/2/2007')");

#Combine Date and Time variables and convert to POSIXlt,POSIXct class
power$DateTime <- paste(power$Date,power$Time);
power$DateTime <- strptime(power$DateTime,"%d/%m/%Y %H:%M:%S");

png(file="plot1.png",height=480,width=480,units="px")
hist(power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)");
dev.off()

