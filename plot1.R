data_all <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data_all$Date <- strptime(data_all$Date,format="%d/%m/%Y")
data <- data_all[data_all$Date %in% c('2007-02-01', '2007-02-02'),]

png("plot1.png", width=480, height=480, units="px",bg = "transparent")
hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()