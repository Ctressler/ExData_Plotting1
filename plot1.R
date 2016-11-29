# Read the data to a data frame
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)

# Convert the date values to class 'Date'
data$Date1 <- as.Date(data$Date, "%d/%m/%Y)

# Filter out the required data based on the dates provided
datause <- subset(data, data$Date1 >= "2007-02-01" & data$Date1 <= "2007-02-02")

# convert the Global active power values to numeric
datause$Global_active_power <- as.numeric(datause$Global_active_power)

# Initiate a png file device with 480X480 pixel dimension
png(filename="plot1.png", width = 480, height = 480)

# Create a histogram
hist(datause$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# close file
dev.off()
