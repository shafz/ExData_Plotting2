library(ggplot2)
# Loading provided datasets - loading from local machine
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

#  Create Data 
BC <- subset(NEI, fips == "24510") 
pd <- aggregate(BC[c("Emissions")], list(type = BC$type, year = BC$year), sum)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

#  Create Plot
png('plot3.png', width=640, height=480)

ggplot(pd, aes(x=year, y=Emissions, colour=type)) +
    geom_point(alpha=.3) +
    geom_smooth(alpha=.2, size=1, method="loess") +
    ggtitle("Total Emissions by Type in Baltimore City")

dev.off()