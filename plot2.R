# script for plot 2
setwd("~/Documents/GitHub/ExData_Plotting1")
library(data.table)

# read file
pwrcons <- data.table::fread("household_power_consumption.txt", na.strings = "?")

# merge the date and time columns coerce them to date-time format to make a new column
pwrcons$date_time <- as.POSIXct(paste(pwrcons$Date, pwrcons$Time), format = "%d/%m/%Y %H:%M:%S")

# subset to keep only the dates you're interested in
pwrcons <- pwrcons[(date_time >= "2007-02-01")&(date_time <= "2007-02-03")]

# plot
png("plot2.png", width = 480, height = 480)
plot(x = pwrcons$date_time, y = pwrcons$Global_active_power,
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()