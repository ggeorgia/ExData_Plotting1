# Reading the file
power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Subsetting
power2 <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting Date /Time
datetime <- paste(as.Date(power2$Date), power2$Time)
Sys.setlocale("LC_TIME", "English")
power2$Datetime <- as.POSIXct(datetime)

# Plots
par(mfrow=c(2, 2))
with(power2, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", xlab="datetime", ylab="Voltage")
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", lty=1, lwd=2, bty="n", col=c("black", "red", "blue"),  
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", xlab="datetime", 
             ylab="Global_reactive_power")
})

# Save as PNG
png(file="plot4.png", height=480, width=480)
par(mfrow=c(2, 2))
with(power2, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", xlab="datetime", ylab="Voltage")
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", lty=1, lwd=2, bty="n", col=c("black", "red", "blue"),  
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", xlab="datetime", 
             ylab="Global_reactive_power")
})
dev.off()
