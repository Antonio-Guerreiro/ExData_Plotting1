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
data <- transform(data, Sub_metering_1 = as.numeric(as.character(Sub_metering_1)))
data <- transform(data, Sub_metering_2 = as.numeric(as.character(Sub_metering_2)))
data <- transform(data, Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))
## Open PNG device to create "plot3.png" in working directory
png(file = "plot3.png") 
## Create plot
plot(data$NewTime, data$Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(data$NewTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$NewTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Close the PNG device
dev.off() 

