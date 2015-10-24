## Read data
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
## Convert Date column data to date objects
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
## Select only data required for Project 1
filter <- data$Date == "2007-02-01" | data$Date == "2007-02-02"
data <- data[filter,]
## Open PNG device to create "plot1.png" in working directory
png(file = "plot1.png") 
## Create plot
data <- transform(data, Global_active_power = as.numeric(as.character(Global_active_power)))
hist(data$Global_active_power, breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
## Close the PNG device
dev.off() 
