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

# Plot
plot(power2$Global_active_power~power2$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Save as PNG
png(file="plot2.png", height=480, width=480)
plot(power2$Global_active_power~power2$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
