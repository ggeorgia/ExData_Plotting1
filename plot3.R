# Reading the file
power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Subsetting
power2 <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting Date /Time
datetime <- paste(as.Date(power2$Date), power2$Time)
power2$Datetime <- as.POSIXct(datetime)

# Plot
with(power2, {
        plot(Sub_metering_1~Datetime, type="l",
        ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", lty=1, lwd=2,col=c("black", "red", "blue"),  
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save as PNG
png(file="plot3.png", height=480, width=480)
with(power2, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", lty=1, lwd=2,col=c("black", "red", "blue"),  
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
