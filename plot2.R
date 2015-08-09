# Clear all variables
rm(list=ls())

# Load data
setwd("c:/Users/On/Desktop/DataScience/Course3/")
mydata <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert Date field to R date format
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

# Filter by Date to Feb 1-2, 2007
filtData <- mydata[mydata$Date >= as.Date("2007/02/01") & mydata$Date <= as.Date("2007/02/02"),]

# Create line plot and set axes and size
png("plot2.png")
plot(filtData$Global_active_power, type = "l", axes = FALSE, ylab = "Global Active Power (kilowatts)", xlab="")
xticks <- seq(from = 0, to = length(filtData$Global_active_power), by = length(filtData$Global_active_power)/2)
axis(side = 1, at = xticks, labels = c("Thu", "Fri", "Sat"))
axis(side = 2 )
box(which = "plot", lty = "solid")
dev.off()