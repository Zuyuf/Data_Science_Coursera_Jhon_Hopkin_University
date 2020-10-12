# Set Working directory where this file and Resource files will be

setwd("C:/Data_Science_Coursera_Jhon_Hopkin_University/Data Science Foundations using R/2 - R programming/4 - Week 4 - simulation-profiling/04_programming-assignment")


# *******************************************
# example usage:
#> setwd("[source code directory path]")
#> source("rankhospital.R")
#> rankhospital("TX", "heart failure", 4)
#[1] "DETAR HOSPITAL NAVARRO"
#> rankhospital("MD", "heart attack", "worst")
#[1] "HARFORD MEMORIAL HOSPITAL"
#> rankhospital("MN", "heart attack", 5000)
#[1] NA
# *******************************************
# @author Zuyufullah Manna


#Function to find the best hospital in a state with a given rank
rankhospital <- function(state, outcome, num = "best") {
     data_2 <- read.csv("outcome-of-care-measures.csv", )
     data = data_2[, c(2, 7, 11, 17, 23)]
     
     #Fetching distinct states from data
     States <- levels(factor(data[, 2]))
     
     # defining all possible outcomes
     Outcomes <- c("heart attack", "heart failure", "pneumonia")
     
     
     # validity check for state, outcome & num
     if ((state %in% States) == FALSE) {
          stop(print("Invalid state."))
     }
     else if ((outcome %in% Outcomes) == FALSE) {
          stop(print("Invalid outcome."))
     }
     if (is.numeric(num) == TRUE) {
          if (length(data[,1]) < num) { return(NA) }
     }
     
     
     # defining mapping of outcome column w.r.t. input
     colNumber <- if (outcome == "heart attack") {3}
                    else if (outcome == "heart failure") {4}
                    else {5}
     
     
     # slicing & cleaning data based on the requested inputs
     data[, colNumber] <- suppressWarnings(  as.numeric(data[, colNumber])  )
     data[, 1] <- as.character(data[, 1])    
     
     
     # based on state
     selectedData <- subset(data, State == state)
     
     
     # re-selecting data based on requested input 'outcome' and clean it from all 'na' values
     selectedData <- selectedData[ !( is.na(selectedData[,colNumber]) ), ]
     
     #based on outcome
     rankedHospital <- selectedData[ order( selectedData[, colNumber], selectedData[, 1] ) , ]
     
     
     
     # if input 'num' == 'best' then then 'numRank' = first;
     if(num == "best") {
          numRank = 1
     }
     
     # if input 'num' == 'worst' then 'numRank' = last;
     else if(num == "worst") {
          numRank = nrow(rankedHospital)
     }
     
     # if input 'num' == number then 'numRank' = 'num'.
     else{ numRank = num }
     
     
     return(rankedHospital[numRank, 1])
}
