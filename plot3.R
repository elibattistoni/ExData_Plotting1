# script for plot 3
setwd("~/Documents/GitHub/ExData_Plotting1")
library(data.table)

# read file
pwrcons <- data.table::fread("household_power_consumption.txt", na.strings = "?")

# merge the date and time columns coerce them to date-time format to make a new column
pwrcons$date_time <- as.POSIXct(paste(pwrcons$Date, pwrcons$Time), format = "%d/%m/%Y %H:%M:%S")

# subset to keep only the dates you're interested in
pwrcons <- pwrcons[(date_time >= "2007-02-01")&(date_time <= "2007-02-03")]

# plot
png("plot3.png", width = 480, height = 480)
plot(x = pwrcons$date_time, y = pwrcons$Sub_metering_1,
     type="l", xlab="", ylab="Energy sub metering", col = "black")
lines(x = pwrcons$date_time, y = pwrcons$Sub_metering_2, type="l", col = "red")
lines(x = pwrcons$date_time, y = pwrcons$Sub_metering_3, type="l", col = "blue")
legend("topright", col = c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty = c(1,1), lwd = c(1,1))
dev.off()