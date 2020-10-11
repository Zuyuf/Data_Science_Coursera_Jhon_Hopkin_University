setwd("C:/Data_Science_Coursera_Jhon_Hopkin_University/Data Science Foundations using R/2 - R programming/3 - Week 3 - Loop Functions and Debugging/03_quiz")

# Week 3 Quiz


# Question 1. Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:
data(iris)

# A description of the dataset can be found by running
?iris

# There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? 
# Please round your answer to the nearest whole number.
# (Only enter the numeric result and nothing else.)

mean( iris$Sepal.Length[iris$Species == "virginica"] )
# -->> 6.588 = 7





# Question 2
# Continuing with the 'iris' dataset from the previous Question, 
# what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
apply(iris[,1:4], 2, mean)






# Question 3
# Load the 'mtcars' dataset in R with the following code
data(mtcars)

# There will be an object names 'mtcars' in your workspace. You can find some information about the dataset by running
?mtcars

# How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.

sapply(split(mtcars$mpg, mtcars$cyl), mean) ###
with(mtcars, tapply(mpg, cyl, mean)) ###
tapply(mtcars$mpg, mtcars$cyl, mean) ### 






# Question 4
# Continuing with the 'mtcars' dataset from the previous Question, 
# what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

# (Please round your final answer to the nearest whole number. Only enter the numeric result and nothing else.)
hp_data =  sapply(split(mtcars$hp, mtcars$cyl), mean)
abs(hp_data[["8"]] - hp_data[["4"]])
# -->> [1] 126.5779




# Question 5
# If you run
debug(ls)

# -->> Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.

