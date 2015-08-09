# Clear all variables
rm(list=ls())

# Load data
setwd("c:/Users/On/Desktop/DataScience/Course3/")
mydata <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert Date field to R date format
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

# Filter by Date to Feb 1-2, 2007
filtData <- mydata[mydata$Date >= as.Date("2007/02/01") & mydata$Date <= as.Date("2007/02/02"),]

# Plot 2x2
png("plot4.png")
par(mfrow = c(2,2), mar = c(4, 4, 3, 2))

plot(filtData$Global_active_power, type = "l", axes = FALSE, ylab = "Global Active Power", xlab="")
xticks <- seq(from = 0, to = length(filtData$Global_active_power), by = length(filtData$Global_active_power)/2)
axis(side = 1, at = xticks, labels = c("Thu", "Fri", "Sat"))
axis(side = 2 )
box(which = "plot", lty = "solid")

plot(filtData$Voltage, type = "l", axes = FALSE, ylab = "Voltage", xlab="datetime")
xticks <- seq(from = 0, to = length(filtData$Voltage), by = length(filtData$Voltage)/2)
axis(side = 1, at = xticks, labels = c("Thu", "Fri", "Sat"))
axis(side = 2 )
box(which = "plot", lty = "solid")

plot(filtData$Sub_metering_1, type = "n", axes = FALSE, ylab = "Energy sub metering", xlab="")
lines(filtData$Sub_metering_1, type = "l", col = "black")
lines(filtData$Sub_metering_2, type = "l", col = "red")
lines(filtData$Sub_metering_3, type = "l", col = "blue")
xticks <- seq(from = 0, to = length(filtData$Sub_metering_2), by = length(filtData$Sub_metering_2)/2)
axis(side = 1, at = xticks, labels = c("Thu", "Fri", "Sat"))
axis(side = 2 )
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), box.lty = 0)
box(which = "plot", lty = "solid")

plot(filtData$Global_reactive_power, type = "l", axes = FALSE, 
     ylab = "Global_reactive_power", xlab="datetime")
xticks <- seq(from = 0, to = length(filtData$Global_reactive_power), 
              by = length(filtData$Global_reactive_power)/2)
axis(side = 1, at = xticks, labels = c("Thu", "Fri", "Sat"))
axis(side = 2 )
box(which = "plot", lty = "solid")
dev.off()