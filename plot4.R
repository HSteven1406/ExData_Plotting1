data <- read.delim('household_power_consumption.txt', sep=";")
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
OData <- subset(data,data$Date %in% c(as.Date('2007-02-02'),as.Date('2007-02-01')))
OData$Global_active_power <- as.numeric(OData$Global_active_power)
DateTime <- strptime(paste(OData$Date,OData$Time), format='%Y-%m-%d %H:%M:%S')

png(filename='plot4.png')
par(mfrow=c(2,2))

##Plot Top Left
plot(DateTime,OData$Global_active_power, ylab='Global Active Power (kilowatts)',xlab='',type='n')
lines(DateTime,OData$Global_active_power)

##Plot Top Right
plot(DateTime,OData$Voltage, ylab='Voltage',xlab='datetime',type='n')
lines(DateTime,OData$Voltage)

##Plot Bottom Left
plot(DateTime,OData$Sub_metering_1, ylab='Energy sub metering',xlab='',type='n')
lines(DateTime,OData$Sub_metering_1)
lines(DateTime,OData$Sub_metering_2,col='red')
lines(DateTime,OData$Sub_metering_3,col='blue')
legend('topright',lty=c(1,1,1),col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),bty='n')

##Plot Bottom Right
plot(DateTime,OData$Global_reactive_power,xlab='datetime',type='n',ylab='Global_reactive_power')
lines(DateTime,OData$Global_reactive_power)

dev.off()