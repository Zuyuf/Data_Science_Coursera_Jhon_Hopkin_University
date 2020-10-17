
source("2 - load_data.R")

data = load_data()

# create png device size 480 x 480
png(filename = "Plot1.png", width = 480, height = 480, units = "px")

# create histogram of Global_active_power
hist( data$Global_active_power, col = "red", main = "Global Active Power", 
          xlab = "Global Active Power (kilowatts)", breaks = 12, ylim = c(0, 1200) )


dev.off()

rm(data)
