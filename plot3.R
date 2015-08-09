# Clear all variables
rm(list=ls())

# Load data
setwd("c:/Users/On/Desktop/DataScience/Course3/")
mydata <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert Date field to R date format
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

# Filter by Date to Feb 1-2, 2007
filtData <- mydata[mydata$Date >= as.Date("2007/02/01") & mydata$Date <= as.Date("2007/02/02"),]

# Plot energy sub metering
png("plot3.png")
plot(filtData$Sub_metering_1, type = "n", axes = FALSE, ylab = "Energy sub metering", xlab="")
lines(filtData$Sub_metering_1, type = "l", col = "black")
lines(filtData$Sub_metering_2, type = "l", col = "red")
lines(filtData$Sub_metering_3, type = "l", col = "blue")
xticks <- seq(from = 0, to = length(filtData$Sub_metering_2), by = length(filtData$Sub_metering_2)/2)
axis(side = 1, at = xticks, labels = c("Thu", "Fri", "Sat"))
axis(side = 2 )
box(which = "plot", lty = "solid")
legend("topright", lty = 1, col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()