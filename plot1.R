## Reading data file
datafile <- "household_power_consumption.txt"
library(data.table)
data <- read.table(datafile, header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")

## Filtering data by dates (01/02/2007 - 02/02/2007)
# data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
Date <- as.Date(data$Date, format = "%d/%m/%Y")
filterData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Prevents scientific notation
Global_active_power <- as.numeric(filterData$Global_active_power)

# Plotting & Saving histogram as png file
png("plot1.png", width = 480, height = 480)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()