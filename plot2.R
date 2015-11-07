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
## Open PNG device to create "plot2.png" in working directory
png(file = "plot2.png") 
## Create plot
data <- transform(data, Global_active_power = as.numeric(as.character(Global_active_power)))
plot(data$NewTime, data$Global_active_power, main = "", xlab = "", ylab = "Global Active Power (kilowatts)", type = "l" )
## Close the PNG device
dev.off() 

