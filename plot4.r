library(dplyr)

generatePlot <- function() {
  
  # Get data from file
  dataset <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
  
  # Subset data to use only rows for dates 2007-02-01 and 2007-02-02 and add datetime column
  subData <- dataset %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>% mutate(datetime = paste(Date, Time))
  
  # Convert Global_active_power and Sub_metering columns to numeric and datetime to Date
  subData$datetime <- strptime(subData$datetime, format = "%d/%m/%Y %H:%M:%S")
  subData$Global_active_power <- as.numeric(subData$Global_active_power)
  subData$Sub_metering_1 <- as.numeric(subData$Sub_metering_1)
  subData$Sub_metering_2 <- as.numeric(subData$Sub_metering_2)
  subData$Sub_metering_3 <- as.numeric(subData$Sub_metering_3)
  
  # Generate Plot
  par(mfrow = c(2, 2))
  with(subData, {
    plot(datetime, Global_active_power, type = "n", ylab = "Global Active Power", xlab = " ")
      lines(datetime, Global_active_power)
    plot(datetime, Voltage, type = "n")
      lines(datetime, Voltage)
  plot(datetime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = " ")
    lines(datetime, Sub_metering_1, col = "black")
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    legend("topright", lty = c(1,1), col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, Global_reactive_power, type = "n")
    lines(datetime, Global_reactive_power)
  })
}