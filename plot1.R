# Clear all variables
rm(list=ls())

# Load data
setwd("c:/Users/On/Desktop/DataScience/Course3/")
mydata <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert Date field to R date format
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

# Filter by Date to Feb 1-2, 2007
filtData <- mydata[mydata$Date >= as.Date("2007/02/01") & mydata$Date <= as.Date("2007/02/02"),]

# Create histogram and set axes and size
png("plot1.png")
hist(filtData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
xticks <- seq(from = 0, to = 6, by = 2)
axis(side = 1, at = xticks, labels = as.character(xticks))
dev.off()