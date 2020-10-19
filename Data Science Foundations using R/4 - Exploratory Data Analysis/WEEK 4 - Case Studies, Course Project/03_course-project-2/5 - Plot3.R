
## Assignment #Q3: Of the four types of sources indicated by the type (point, 
## nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)
library(dplyr)

## This first line will likely take a few seconds. Be patient!
NEI = readRDS("./data/summarySCC_PM25.rds")
SCC = readRDS("./data/Source_Classification_Code.rds")


baltimoreNEI = NEI[ NEI$fips=="24510", ]
baltimoreNEI = baltimoreNEI %>% group_by(type, year) %>% summarise(Total= sum(Emissions))

png("Plot3.png",width=550,height=450)

ggp = ggplot(baltimoreNEI, aes(x= year, y= Total, col= type))  +
          geom_line()  +
          labs(x= "year", y= expression("Total PM"[2.5]*" Emission (Tons)"))  +
          labs(title= expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

dev.off()
