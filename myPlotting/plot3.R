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

with(data, plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black"))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lwd=c(1,1,1),col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, "plot3.png", height=480, width=480)
dev.off()