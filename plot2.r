library(dplyr)

generatePlot <- function() {
  
  # Get data from file
  dataset <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
  
  # Subset data to use only rows for dates 2007-02-01 and 2007-02-02 and add datetime column
  subData <- dataset %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>% mutate(datetime = paste(Date, Time))
  
  # Convert Global_active_power column to numeric and datetime to Date
  xData <- strptime(subData$datetime, format = "%d/%m/%Y %H:%M:%S")
  yData <- as.numeric(subData$Global_active_power)
  
  # Generate Plot
  plot(xData, yData, type = "n", ylab = "Global Active Power (kilowatts)", xlab = " ")
  lines(xData, yData)
}