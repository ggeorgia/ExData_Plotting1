# Reading the file
power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Subsetting
power2 <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Histogram
hist(power2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",
     ylab="Frequency", col="red")

# Save as PNG
png(file="plot1.png", height=480, width=480)
hist(power2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",
     ylab="Frequency", col="red")
dev.off()
