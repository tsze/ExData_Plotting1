data_all <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data_all$Date <- strptime(data_all$Date,format="%d/%m/%Y")
data <- data_all[data_all$Date %in% c('2007-02-01', '2007-02-02'),]

datetime <- paste(as.Date(data$Date), data$Time)
Datetime <- as.POSIXct(datetime)
data <- cbind(data,DateTime)

png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

plot(data$DateTime, data$Global_active_power, type="l", ylab= "Global Active Power", xlab="")

plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(data$DateTime,data$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(data$DateTime,data$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")

dev.off()
