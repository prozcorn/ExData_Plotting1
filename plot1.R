library(dplyr)
library(data.table)
# Read File 
data <- fread('./household_power_consumption.txt')

# Format Data
data$Date <- as.Date.character(data$Date, format = '%d/%m/%Y')
data <- filter(data, Date >= as.Date('2007-02-01'))
data <- filter(data, Date <= as.Date('2007-02-02'))

# Make Png
png(filename = './plot1.png', width = 480, height = 480)

hist(as.numeric(data$Global_active_power),
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)',
     col = 'red')

dev.off()