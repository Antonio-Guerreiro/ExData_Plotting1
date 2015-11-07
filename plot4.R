## Read data
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
## Create a data column with time objects
d <- as.character(data$Date)
t <- as.character(data$Time)
data$NewTime <- strptime(paste(d, t, sep = " "), format = "%d/%m/%Y %H:%M:%S")
## Convert Date column data to date objects
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
## Select only data required for Project 1
filter <- data$Date == "2007-02-01" | data$Date == "2007-02-02"
data <- data[filter,]
## Transform data
data <- transform(data, Global_active_power = as.numeric(as.character(Global_active_power)))
data <- transform(data, Global_reactive_power = as.numeric(as.character(Global_reactive_power)))
data <- transform(data, Voltage = as.numeric(as.character(Voltage)))
data <- transform(data, Sub_metering_1 = as.numeric(as.character(Sub_metering_1)))
data <- transform(data, Sub_metering_2 = as.numeric(as.character(Sub_metering_2)))
data <- transform(data, Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))
## Open PNG device to create "plot4.png" in working directory
png(file = "plot4.png") 
par(mfrow = c(2,2), mar = c(5,4,4,3)) ## bottom, left, top, right
## Create first plot
plot(data$NewTime, data$Global_active_power, main = "", xlab = "", ylab = "Global Active Power", type = "l" )
## Create second plot
plot(data$NewTime, data$Voltage, main = "", xlab = "datetime", ylab = "Voltage", type = "l" )
# Create third plot
plot(data$NewTime, data$Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(data$NewTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$NewTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
# Create fourth plot
plot(data$NewTime, data$Global_reactive_power, main = "", xlab = "datetime", ylab = "Global_reactive_power", type = "l" )
## Close the PNG device
dev.off() 

