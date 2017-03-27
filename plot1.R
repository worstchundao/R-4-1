date_time <- function(date, time) {
        return (strptime(paste(date, time), "%d/%m/%Y %H:%M:%S"))
}

load_data <- function() {
        filename <- "household_power_consumption.txt"
        df <- read.table(filename,
                         header=TRUE,
                         sep=";",
                         colClasses=c("character", "character", rep("numeric",7)),
                         na="?")
        df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
        df$Date <- as.Date(df$Date, "%d/%m/%Y")
        dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
        df <- subset(df, Date %in% dates)
        
        return(df)
        
}

plot1 <- function(data=NULL) {
        if(is.null(data))
                data <- load_data()
        
        png("plot1.png", width=400, height=400)
        
        hist(data$Global_active_power,
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)",
             ylab="Frequency",
             col="red")
        
        dev.off()
}

plot1()