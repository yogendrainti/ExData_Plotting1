## Reading data file
datafile <- "household_power_consumption.txt"
library(data.table)
data <- read.table(datafile, header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")

## Filtering data by dates (01/02/2007 - 02/02/2007)
filterData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Combine Date and Time to plot by hrs
dateTime <- strptime(paste(filterData$Date, filterData$Time),
                     "%d/%m/%Y %H:%M:%S")

# Prevents scientific notation
Global_active_power <- as.numeric(filterData$Global_active_power)

# Plotting and Saving histogram as png file
png("plot3.png", width = 480, height = 480)
plot(dateTime, filterData$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(dateTime, filterData$Sub_metering_2, col = "red")
lines(dateTime, filterData$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue")
       ,c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 ")
       ,lty = c(1,1), lwd = c(1,1))
dev.off()