library(dplyr)

generatePlot <- function() {
  
  # Get data from file
  dataset <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
  
  # Subset data to use only rows for dates 2007-02-01 and 2007-02-02 and add datetime column
  subData <- dataset %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>% mutate(datetime = paste(Date, Time))
  
  # Convert Sub_metering columns to numeric and datetime to Date
  xData <- strptime(subData$datetime, format = "%d/%m/%Y %H:%M:%S")
  sub1 <- as.numeric(subData$Sub_metering_1)
  sub2 <- as.numeric(subData$Sub_metering_2)
  sub3 <- as.numeric(subData$Sub_metering_3)
  
  # Generate Plot
  plot(xData, sub1, type = "n", ylab = "Energy sub metering", xlab = " ")
  lines(xData, sub1, col = "black")
  lines(xData, sub2, col = "red")
  lines(xData, sub3, col = "blue")
  legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}