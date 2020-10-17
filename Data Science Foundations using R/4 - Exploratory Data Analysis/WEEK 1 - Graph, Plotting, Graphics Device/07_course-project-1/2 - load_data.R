
# download the data set and extract it
# place the data_set in ./resource folder
#   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip


# Set working directory where this file resides


load_data <- function() {
     
if (!file.exists("./resource/PowerConsumption.csv")) {

     # Read the Data to a data frame
     data <- read.csv( "./resource/household_power_consumption.txt",
                         sep = ";", na.strings =  "?", 
                         col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                       "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                         colClasses = c(rep("character", 2), rep("numeric", 7))  )
     
     # select the dates 2007-02-01 and 2007-02-02
     data = data[ (data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
     
     # convert Date, Time character format to Date format
     data$DateTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
     
     # bring the DateTime variable in 1st position and
     # remove the Date and Time column and attach rest of the variables to DateTime
     data = cbind(data[10], data[3:9])
     
     # reset row names
     rownames(data) <- 1 : nrow(data)
}

     # return the data
     data
}