data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE)
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png(filename="plot2.png", width=480, height=480)
par(mfrow=c(1,1))
plot(data$DateTime,
     as.numeric(data$Global_active_power),
     type="l",
     xlab='',
     ylab="Global Active Power (kilowatts)")
dev.off()