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
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataSubset <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

# Create a PNG containing the histogram of Global Active Power.
png("plot1.png", width = 480, height = 480)
hist(
  dataSubset$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)")
dev.off()
