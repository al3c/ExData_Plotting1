setwd("~/Documents/Coding/Coursera/ExData/week 1")
## read the data
data <- read.table("household_power_consumption.txt", header = TRUE, 
            sep = ";", stringsAsFactors = FALSE, na.strings = c("?"))
## convert data and time
data$Date <- as.Date(data$Date)
data$Time <- strptime(data$Time, "%H:%M")

##only need this subset of two days
relevant_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(relevant_data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()