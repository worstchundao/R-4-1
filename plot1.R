filename <- "household_power_consumption.txt"
data <- read.table(filename,header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)
        
png("plot1.png", width=400, height=400)
        
hist(data$Global_active_power,
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)",
             ylab="Frequency",
             col="red")
        
dev.off()
