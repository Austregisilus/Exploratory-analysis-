# Read the data we are interested in
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'), na.strings = "?")

#Find the data we want to perform exploratory analysis on 
interested <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Variable for date and time combined
library(lubridate)
datetime <- strptime(paste(interested$Date, interested$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot 1
png("plot1.png", width = 480, height = 480, units = "px")
hist(interested$Global_active_power, col = "red", main = "Global active power", xlab = "Global Active Power (kilowatts)")
dev.off()

#Plot 2
png("plot2.png", width = 480, height = 480, units = "px")
plot(datetime, interested$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()

#Plot 3
png("plot3.png", width = 480, height = 480, units = "px")
plot(datetime, interested$Sub_metering_1, type = "l", ylab = "Energy submetering")
lines(datetime, interested$Sub_metering_2, col = "red")
lines(datetime, interested$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

#Plot 4
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(datetime, interested$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
plot(datetime, interested$Voltage, type = "l", ylab = "Voltage")
plot(datetime, interested$Sub_metering_1, type = "l", ylab = "Energy submetering")
lines(datetime, interested$Sub_metering_2, col = "red")
lines(datetime, interested$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, interested$Global_reactive_power, type = "l", ylab = "Global Reactive Power")
dev.off()
