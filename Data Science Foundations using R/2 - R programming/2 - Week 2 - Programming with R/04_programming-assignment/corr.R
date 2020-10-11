# *******************************************
# example usage:
#> setwd("[this source code directory path]")
#> source("complete.R")
#> corr("specdata")
#> corr("specdata", 129)
#> corr("specdata", 2000)
#> corr("specdata", 1000)
#> corr("specdata", 1094)
#> corr("specdata", 1095)
# *******************************************
# @author Zuyufullah Manna (Github: Zuyuf)

# Computes the correlation between nitrate and sulfate
# 'directory' - location of the CSV files
# 'id' - id of each file
# 'threshold' - number of completely observed observations on all variables, default: 0

setwd("C:/Data_Science_Coursera_Jhon_Hopkin_University/Data Science Foundations using R/2 - R programming/2 - Week 2- Programming with R/04_programming-assignment")
source("complete.R")

corr <- function(directory, threshold = 0) {
      cor_results <- numeric(0)
      complete_cases <- complete(directory)
      complete_cases <- complete_cases[complete_cases$nobs>=threshold, ]
      
      if( nrow(complete_cases) >0 ) {
        
              for(monitor in complete_cases$id) {
                    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
                    monitor_data <- read.csv(path)
                    
                    interested_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
                    interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
                    
                    sulfate_data <- interested_data["sulfate"]
                    nitrate_data <- interested_data["nitrate"]
                    
                    cor_results <- c(cor_results, cor(sulfate_data, nitrate_data))
              }
      }
      cor_results	  #no rounding off.
}