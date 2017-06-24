
# This script creates plot4

# Set Working Directory
setwd("C:/Users/kareem.gamgoum/Desktop/DataScience/Course 4 - Exploratory Data Analysis/Course Project 1")

# Load in the data 
rawdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# Create DateTime variable
rawdata$DateTime <-strptime(paste(rawdata$Date, rawdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

# Create Date variable
rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")    

# Now the data is prepared, we shall rename appropriately
data <- rawdata

# Filter to only look at 2007-02-01 and 2007-02-02
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))


# Construct Plot 4

# Save to a PNG file with a width of 480 pixels and a height of 480 pixels.
png('plot4.png', width=480, height=480)

par(mfrow = c(2,2))
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), bty = "n", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()
