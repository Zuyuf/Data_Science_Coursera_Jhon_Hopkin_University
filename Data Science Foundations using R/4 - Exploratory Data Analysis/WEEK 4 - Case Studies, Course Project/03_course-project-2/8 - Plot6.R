
## Assignment #Q6: Compare emissions from motor vehicle sources in Baltimore 
## City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(ggplot2)


vehicleBaltimore <- NEI[ NEI$fips == 24510, ]
vehicleBaltimore$city <- "Baltimore City"

vehicleLA <- NEI[ NEI$fips=="06037", ]
vehicleLA$city <- "Los Angeles County"

bothNEI <- rbind( vehicleBaltimore, vehicleLA )



png("Plot6.png", width=700, height=600, units="px", bg="transparent")

ggp <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city))   +
               geom_bar( aes(fill= year), stat= "identity")   +
               facet_grid(scales= "free", space= "free", . ~ city)   +
               guides(fill= FALSE) + 
               theme_bw()   +
               labs( x= "year", y= expression("Total PM"[2.5]*" Emission (Kilo-Tons)") )   + 
               labs( title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008") )

print(ggp)
dev.off()
