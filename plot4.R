# Download and unzip the data set.
filename <- "household_power_consumption.zip"
download.file(
  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
  destfile = filename)
unzip(filename)

# Read in the data.
data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE)
# Keep only data for 2007-02-01 and 2007-02-02.
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Add a column representing the combined date/time.
data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(data$datetime, data$Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power")
with(data, plot(datetime, Voltage, type = "l"))
plot(
  data$datetime,
  data$Sub_metering_1,
  type = "l",
  col = "black",
  xlab = NA,
  ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1)
with(data, plot(datetime, Global_reactive_power, type = "l"))
dev.off()
