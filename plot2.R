data_all <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data_all$Date <- strptime(data_all$Date,format="%d/%m/%Y")
data <- data_all[data_all$Date %in% c('2007-02-01', '2007-02-02'),]

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
data <- cbind(data,DateTime)

png("plot2.png", width=480, height=480, units="px")
plot(as.numeric(data$Global_active_power)~data$Datetime,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

