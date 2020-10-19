## Assignment #Q2: Have total emissions from PM2.5 decreased in the Baltimore 
## City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
## system to make a plot answering this question.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")


DataSub <- subset(NEI, fips == "24510")
BaltCnty <- tapply(DataSub$Emissions, DataSub$year, sum)

png("Plot2.png",width=500,height=480)

plot(BaltCnty, type = "o", main = "Total PM2.5 Emissions in Baltimore County", 
               xlab = "Year", ylab = "PM2.5 Emissions", 
               pch = 18, col = "darkblue", lty = 5)

dev.off()
