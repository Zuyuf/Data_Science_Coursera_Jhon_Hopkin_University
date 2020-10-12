# Set Working directory where this file and Resource files will be

setwd("C:/Data_Science_Coursera_Jhon_Hopkin_University/Data Science Foundations using R/2 - R programming/4 - Week 4 - simulation-profiling/04_programming-assignment")

source("best.R")
source("rankhospital.R")
source("rankall.R")



###   Programming Assignment 3: Quiz    ###


# Question 1
# What result is returned by the following code?
best("SC", "heart attack")
# -->> [1] "MUSC MEDICAL CENTER"





# Question 2
# What result is returned by the following code?
best("NY", "pneumonia")
# -->> [1] "MAIMONIDES MEDICAL CENTER"




# Question 3
# What result is returned by the following code?
best("AK", "pneumonia")
# -->> [1] "YUKON KUSKOKWIM DELTA REG HOSPITAL"



# Question 4
# What result is returned by the following code?
rankhospital("NC", "heart attack", "worst")
# -->> [1] "WAYNE MEMORIAL HOSPITAL"




# Question 5
# What result is returned by the following code?
rankhospital("WA", "heart attack", 7)
# -->> [1] "YAKIMA VALLEY MEMORIAL HOSPITAL"



# Question 6
# What result is returned by the following code?
rankhospital("TX", "pneumonia", 10)
# -->> [1] "SETON SMITHVILLE REGIONAL HOSPITAL"




# Question 7
# What result is returned by the following code?
rankhospital("NY", "heart attack", 7)
# -->> [1] "BELLEVUE HOSPITAL CENTER"



# Question 8
# What result is returned by the following code?
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)
# -->> [1] "CASTLE MEDICAL CENTER"





# Question 9
# What result is returned by the following code?
r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)
# -->> [1] "BERGEN REGIONAL MEDICAL CENTER"




# Question 10
# What result is returned by the following code?
r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)
# -->> [1] "RENOWN SOUTH MEADOWS MEDICAL CENTER"









