# Read the data to a data frame
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)

# Convert the date values to class 'Date'
data$Date1 <- as.Date(data$Date, "%d/%m/%Y)

# Filter out the required data based on the dates provided
datause <- subset(data, data$Date1 >= "2007-02-01" & data$Date1 <= "2007-02-02")

# combine the date and time values
datause$datetime <- paste(datause$Date, datause$Time)

# convert the combined datetime values to 'Date' class
datause$datetime1 <- strptime(datause$datetime, format = "%d/%m/%Y %H:%M:%S")

# convert the Global active power and Global reactive power values to numeric
datause$Global_active_power <- as.numeric(datause$Global_active_power)
datause$Global_reactive_power <- as.numeric(datause$Global_reactive_power)

# Initiate a png file device with 480X480 pixel dimension
png(filename="plot4.png", width = 480, height = 480)

# Initiate a plot which has 4 sub plots arranged by row
par(mfrow=c(2,2))

# plot 1
plot(datause$datetime1, datause$Global_active_power, xlab ="", ylab = "Global Active Power (kilowatts)", type = "l")

# plot 2
plot(datause$datetime1, datause$Voltage, type ="l", ylab="Voltage", xlab="datetime")

# plot 3
plot(datause$datetime1, datause$Sub_metering_1, type ="l", ylab="Energy Sub metering", xlab="")
points(datause$datetime1, datause$Sub_metering_2, col="red", type="l")
points(datause$datetime1, datause$Sub_metering_3, col="blue", type="l")
legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col =c("black", "red", "blue"), lty=1, merge=FALSE)

# plot4
plot(datause$datetime1, datause$Global_reactive_power, type ="l", ylab="Global_reactive_power", xlab="datetime")

# close file
dev.off()
