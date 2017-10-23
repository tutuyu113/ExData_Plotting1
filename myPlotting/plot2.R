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

with(data, plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))

dev.copy(png, "plot2.png", width=480, height=480)
dev.off()
