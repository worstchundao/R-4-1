filename <- "household_power_consumption.txt"
data <- read.table(filename,header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

png("plot3.png", width=400, height=400)
        
plot(data$Time, data$Sub_metering_1, type="l", col="black",
             xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright",
             col=c("black", "red", "blue"),
             c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             lty=1)

dev.off()
