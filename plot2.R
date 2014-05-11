### Plot 2 ###
dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dataset <- na.omit(dataset)
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset <- within(dataset, datetime <- paste(Date, Time, sep = ' '))
dataset <- within(dataset, datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S"))
object <- subset(dataset, {Date == "2007-02-01" | Date == "2007-02-02"})

png(filename = "plot2.png", width = 480, height = 480)
with(object, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()