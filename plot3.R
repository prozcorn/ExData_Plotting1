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
png(filename = './plot3.png', width = 480, height = 480)

plot(x = data$date_time, y = data$Sub_metering_1, type = 'l',
     ylab = 'Energy sub metering',
     xlab = '',
     col = 'black')
points(x = data$date_time, y = data$Sub_metering_2, type = 'l',
       col = 'red')
points(x = data$date_time, y = data$Sub_metering_3, type = 'l',
       col = 'blue')
legend('topright',
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col = c('black','red','blue'),
       lty = 1)


dev.off()