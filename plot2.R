library(dplyr)
library(data.table)
# Read File 
data <- fread('./household_power_consumption.txt')

# Format Data
dates <- data$Date
times <- data$Time
data$date_time <- paste(dates,times)
data$Date <- as.Date.character(dates, format = '%d/%m/%Y')
data <- filter(data, Date >= as.Date('2007-02-01'))
data <- filter(data, Date <= as.Date('2007-02-02'))
data$date_time <- as.POSIXlt.character(data$date_time, format = "%d/%m/%Y %H:%M:%S")

# Make Png
png(filename = './plot2.png', width = 480, height = 480)

plot(x = data$date_time, y = data$Global_active_power, type = 'l',
     ylab = 'Global Active Power (kilowawtts)',
     xlab = '')


dev.off()