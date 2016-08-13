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

# Extract the subset of the data for 2007-02-01 and 2007-02-02.
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
dataSubset <- data[which(data$DateTime >= "2007-02-01" & data$DateTime < "2007-02-03"), ]

# Create a PNG containing a plot of Energy sub metering vs time.
png("plot3.png", width = 480, height = 480)
plot(
  dataSubset$DateTime,
  dataSubset$Sub_metering_1,
  type = "l",
  col = "black",
  xlab = NA,
  ylab = "Energy sub metering")
lines(dataSubset$DateTime, dataSubset$Sub_metering_2, col = "red")
lines(dataSubset$DateTime, dataSubset$Sub_metering_3, col = "blue")
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1)
dev.off()
