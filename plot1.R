
# This script creates plot1

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


# Construct Plot 1

# Save to a PNG file with a width of 480 pixels and a height of 480 pixels.
png('plot1.png', width=480, height=480)

par(mfrow = c(1,1))
hist(data$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()
