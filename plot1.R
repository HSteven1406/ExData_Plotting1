data <- read.delim('household_power_consumption.txt', sep=";")
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
OData <- subset(data,data$Date %in% c(as.Date('2007-02-02'),as.Date('2007-02-01')))

png(filename='plot1.png')
with(OData,hist(as.numeric(Global_active_power), main='Global Active Power', col='red', xlab='Global Active Power (kilowatts)'))
dev.off()