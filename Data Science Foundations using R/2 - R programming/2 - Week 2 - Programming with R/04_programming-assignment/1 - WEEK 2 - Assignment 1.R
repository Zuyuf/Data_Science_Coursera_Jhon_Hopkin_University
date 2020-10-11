# *******************************************
#> setwd("[this source code directory path]")
#> source("pollutantmean.R")
#> source("corr.R")
#> source("complete.R")
#*******************************************
# @author Zuyufullah Manna (Github: Zuyuf)

setwd("C:/Data_Science_Coursera_Jhon_Hopkin_University/Data Science Foundations using R/2 - R programming/2 - Week 2- Programming with R/04_programming-assignment")

source("pollutantmean.R")
source("corr.R")
source("complete.R")


# Question 1. What value is returned by the following call to pollutantmean()? You should round your output to 3 digits.
pollutantmean("specdata", "sulfate", 1:10)
# -->> [1] 4.064128



# Question 2. What value is returned by the following call to pollutantmean()? You should round your output to 3 digits.
pollutantmean("specdata", "nitrate", 70:72)
# -->> [1] 1.706047



# Question 3. What value is returned by the following call to pollutantmean()? You should round your output to 3 digits.
pollutantmean("specdata", "sulfate", 34)
# -->> [1] 1.477143



# Question 4. What value is returned by the following call to pollutantmean()? You should round your output to 3 digits.
pollutantmean("specdata", "nitrate")
# -->> [1] 1.702932



# Question 5. What value is printed at end of the following code?
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
# -->> [1] 228 148 124 165 104 460 232



# Question 6. What value is printed at end of the following code?
cc <- complete("specdata", 54)
print(cc$nobs)
# -->> [1] 219



# Question 7. What value is printed at end of the following code?
RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
# -->> [1] 711 135  74 445 178  73  49   0 687 237




# Question 8. What value is printed at end of the following code?
cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
# -->> [1]  0.2688  0.1127 -0.0085  0.4586  0.0447




# Question 9. What value is printed at end of the following code?
cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
# -->> [1] 243.0000   0.2540   0.0504  -0.1462  -0.1680   0.5969





# Question 10. What value is printed at end of the following code?
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
# -->> [1]  0.0000 -0.0190  0.0419  0.1901


