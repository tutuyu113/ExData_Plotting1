## Setting Working Directory ##

geywd()
setwd("./R/Course 4/ProgrammingAssignment1")


## Downloading and Reading Data ##

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileUrl, temp, mode="wb")
unzip(temp)
unlink(temp)

data_all <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?",
                       colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"))

data <- subset(data_all, Date=="1/2/2007"|Date=="2/2/2007") 

data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")



## Plotting and Saving as png ##

par(mfrow=c(2,2), mar=c(4,4,2,1),oma=c(0,0,0,0))
with(data, {
  plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
  
  plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", lwd=2, lty=1, bty="n",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(DateTime, Global_reactive_power, xlab="datetime", type="l")
})

dev.copy(png, "plot4.png", width=480, height=480)
dev.off()