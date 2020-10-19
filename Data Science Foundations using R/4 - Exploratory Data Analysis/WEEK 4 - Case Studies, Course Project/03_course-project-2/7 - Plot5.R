
## Question 5:
## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(ggplot2)


baltimore_car = subset(NEI, NEI$fips=="24510" & NEI$type=="ON-ROAD")

baltimore_car_year = aggregate(Emissions ~ year, baltimore_car, FUN=sum)



png("plot5.png", width=500, height=400, units= "px")

g = ggplot(baltimore_car_year, aes(factor(year), Emissions))

g = g + geom_bar(stat="identity")  +
     xlab("year")  +
     ylab( expression('Total PM'[2.5]*" Emissions") )  +
     ggtitle( expression("PM"[2.5]*"Motor Vehical Source Emissions in Baltimore from 1999 to 2008") )


print(g)
dev.off()
