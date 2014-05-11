setwd("~/Documents/Coding/Coursera/ExData/week 1")
## read the data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", stringsAsFactors = FALSE, na.strings = c("?"))

##only need this subset of two days
sdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
## new column with combined time and date
sdata$datetime <- mapply(function(s1, s2) {as.POSIXct(paste(s1, s2), 
                        format = "%d/%m/%Y %H:%M:%S")},
                        sdata$Date,sdata$Time)

par(mfrow = c(2,2))
png(file = "plot4.png", width = 480, height = 480, units = "px", 
    bg = "transparent")
par(mfrow = c(2,2))

plot(sdata$datetime, sdata$Global_active_power, type = "l", xaxt = "n",
     xlab = " ", ylab = "Global Active Power (kilowatts)")
axis.POSIXct(1, as.POSIXct(sdata$datetime, origin = "1970-01-01"))

plot(sdata$datetime, sdata$Voltage, type = "l", xaxt = "n",
     xlab = "datetime", ylab = "Voltage")
axis.POSIXct(1, as.POSIXct(sdata$datetime, origin = "1970-01-01"))

plot(sdata$datetime, sdata$Sub_metering_1, type = "l", xaxt = "n",
     xlab = " ", ylab = "Energy sub metering")
lines(sdata$datetime, sdata$Sub_metering_2, col = "red")
lines(sdata$datetime, sdata$Sub_metering_3, col = "blue")
axis.POSIXct(1, as.POSIXct(sdata$datetime, origin = "1970-01-01"))
legend("topright", lty = 1, col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty = "n")

plot(sdata$datetime, sdata$Global_reactive_power, type = "l", xaxt = "n",
     xlab = "datetime", ylab = "Global_reactive_power")
axis.POSIXct(1, as.POSIXct(sdata$datetime, origin = "1970-01-01"))
dev.off()