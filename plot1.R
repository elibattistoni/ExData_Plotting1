# script for plot 1
setwd("~/Documents/GitHub/ExData_Plotting1")
library(data.table)

# read file
pwrcons <- data.table::fread("household_power_consumption.txt", na.strings = "?")

# change format of date column and time column
pwrcons[, Date := lapply(.SD, as.Date, format = "%d/%m/%Y"), .SDcols = "Date"]

# subset to keep only the dates you're interested in: from 2007-02-01 to 2007-02-02
pwrcons <- pwrcons[(Date >= "2007-02-01")&(Date <= "2007-02-02")]

# plot 1
png("plot1.png", width = 480, height = 480)
hist(pwrcons$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab="Frequency", col = "red") 
dev.off()