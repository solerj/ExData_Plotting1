data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE)
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data$DateTime,
     as.numeric(data$Global_active_power),
     type="l",
     xlab='',
     ylab="Global Active Power")
plot(data$DateTime,
     as.numeric(data$Voltage),
     type="l",
     xlab='datetime',
     ylab="Voltage")
plot(data$DateTime, data$Sub_metering_1,type = "l", col="black",ylab = "Energy sub metering", xlab = '')
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,
       col=c("black","red","blue"),
       bty="n")
plot(data$DateTime,
     as.numeric(data$Global_reactive_power),
     type="l",
     xlab='datetime',
     ylab="Global Reactive Power")
dev.off()