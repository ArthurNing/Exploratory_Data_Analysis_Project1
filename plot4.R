### Plot 4 ###
dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dataset <- na.omit(dataset)
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset <- within(dataset, datetime <- paste(Date, Time, sep = ' '))
dataset <- within(dataset, datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S"))
object <- subset(dataset, {Date == "2007-02-01" | Date == "2007-02-02"})

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(object, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(object, plot(datetime, Voltage, type = "l"))

with(object, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(object, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(object, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red","blue"))

with(object, plot(datetime, Global_reactive_power, type = "l"))
dev.off()