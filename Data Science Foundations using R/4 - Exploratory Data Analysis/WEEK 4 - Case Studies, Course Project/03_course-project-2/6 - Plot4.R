## Assignment #Q4: Across the United States, how have emissions from coal 
## combustion-related sources changed from 1999-2008?
##

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")


SCC.sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]


png("Plot4.png", width=400, height=400, units="px", bg="transparent")


ggp <- ggplot(NEI.sub, aes(x= factor(year), y= Emissions, fill= type))  + 
               geom_bar(stat= "identity", width= .4)  +
               xlab("year")  +
               ylab("Coal-Related PM2.5 Emissions")  + 
               ggtitle("Total Coal-Related PM2.5 Emissions")

print(ggp)
dev.off()
