generatePlot <- function() {
  
  # Get data from file
  dataset <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
  
  # Subset data to use only rows for dates 2007-02-01 and 2007-02-02
  subData <- subset(dataset, dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007")

  # Convert Global_active_power column to numeric
  xData <- as.numeric(subData$Global_active_power)
  
  # Generate Histogram
  hist(xData, breaks = 20, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  
  }
