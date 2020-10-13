
setwd("C/Data_Science_Coursera_Jhon_Hopkin_University/Data Science Foundations using R/3 - Getting and Cleaning Data/WEEK 1 - Intro, Reading Various Files/03_quiz")


##   Week 1 Quiz  ##


# Question 1
# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#     https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

# and load the data into R. The code book, describing the variable names is here:
     
#      https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

# How many properties are worth $1,000,000 or more?

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "./house_data.csv" )
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf", destfile = "./getdata2Fdata2FPUMSDataDict06.pdf")

house_data = read.csv("house_data.csv")
prop_val = house_data$VAL


# How many properties are worth $1,000,000 or more?
prop_val = prop_val[ !(is.na(prop_val)) ]

ans1 = prop_val[prop_val == 24]
length(ans1)

## ANSWER -->> 53






# Question 2
# Use the data you loaded from Question 1. Consider the variable FES in the code book. 
# Which of the "tidy data" principles does this variable violate?

## ANSWER -->> * Tidy data has one variable per column.








# Question 3
# Download the Excel spreadsheet on Natural Gas Aquisition Program here:

#    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx

# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called: "dat"

# What is the value of:  sum( dat$Zip * dat$Ext, na.rm=T)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile = "./getFDATA-gov_NGAP.xlsx", mode="wb")

Sys.setenv(JAVA_HOME = "C:/Program Files/Java/jre1.8.0_261/")
library(xlsx)

dat <- read.xlsx("getFDATA-gov_NGAP.xlsx", sheetIndex=1, header=TRUE, startRow = 18, endRow = 23)
sum(dat$Zip * dat$Ext, na.rm=T)

#ANSWER -->> [1] 36534720








# Question 4
# Read the XML data on Baltimore restaurants from here:

#    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml

# How many restaurants have zipcode 21231?

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", destfile = "./get-restaurants.xml")

library(XML)

fileName = "get-restaurants.xml"
doc = xmlTreeParse(fileName, useInternalNodes = TRUE)
rootNode = xmlRoot(doc)

zipcodes = xpathSApply(rootNode, "//zipcode", xmlValue)

ans2 = zipcodes[zipcodes == "21231"]
length(ans2)

# ANSWER -->> [1] 127







# Question 5
# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:

#    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv

# using the fread() command load the data into an R object: "DT"

# The following are ways to calculate the average value of the variable
# pwgtp15
# broken down by sex. Using the data.table package, which will deliver the fastest user time?

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "./getdata-ss06pid.csv")

library(data.table)
DT = fread("./getdata-ss06pid.csv")

## ANSWER -->> * DT[,mean(pwgtp15),by=SEX]







