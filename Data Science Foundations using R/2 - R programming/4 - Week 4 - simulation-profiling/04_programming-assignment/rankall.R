# *******************************************
# example usage:
#> setwd("[source code directory path]")
#> source("rankall.R")
#> head(rankall("heart attack", 20), 10)
#> tail(rankall("pneumonia", "worst"), 3)
#> tail(rankall("heart failure"), 10)
# *******************************************
# @author Zuyufullah Manna

# Function to find the best hospital in all state for a given outcome
rankall <- function(outcome, num = "best") {
     data_2 <- read.csv("outcome-of-care-measures.csv", )
     data = data_2[, c(2, 7, 11, 17, 23)]
     
     #Fetching distinct states from data
     States <- levels(factor(data[, 2]))
     
     # defining all possible outcomes
     Outcomes <- c("heart attack", "heart failure", "pneumonia")
     
     
     # validity check for state, outcome & num
     if ((outcome %in% Outcomes) == FALSE) {
          stop(print("Invalid outcome."))
     }
     if (is.numeric(num) == TRUE) {
          if (length(data[,1]) < num) { return(NA) }
     }
     
     
     # defining mapping of outcome column w.r.t. input
     colNumber <- if (outcome == "heart attack") {3}
                    else if (outcome == "heart failure") {4}
                    else {5}
     
     
     # considering output as numeric and Hospital.Name as character
     data[, colNumber] <- suppressWarnings(  as.numeric(data[, colNumber])  )
     data[, 1] <- as.character(data[, 1])    
     
     
     
     # initializing empty AllStatesHospitalRanking:
     AllStatesHospitalRanking <- vector()
     
     
     # computing AllStatesHospitalRanking.
     for(i in 1:length(States)) {
          
          # based on state
          selectedData <- subset(data, State == States[i])
          
          
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
          
          
          HospitalsRanked = rankedHospital[numRank, 1]
          AllStatesHospitalRanking <- append(AllStatesHospitalRanking, c(HospitalsRanked, States[i]))
     }
     
     
     # AllStatesHospitalRanking as data frame along with column names and row names:
     AllStatesHospitalRanking <- as.data.frame(  matrix(AllStatesHospitalRanking, length(States), 2, byrow = TRUE)  )
     print(AllStatesHospitalRanking)
     
     colnames(AllStatesHospitalRanking) <- c("hospital", "state")
     rownames(AllStatesHospitalRanking) <- States
     
     
     return(AllStatesHospitalRanking)
}

