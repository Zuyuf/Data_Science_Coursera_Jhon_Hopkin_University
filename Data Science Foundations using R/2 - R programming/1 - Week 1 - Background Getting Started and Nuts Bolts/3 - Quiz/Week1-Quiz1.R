x = 1:4
y = 2:3
x+y
typeof(x+y)
class(x+y)


data = read.csv("hw1_data.csv")


head(data, 2)


tail(data, 2)


data$Ozone[47]

sum( is.na(data$Ozone)  )

mean( data$Ozone[ !is.na(data$Ozone) ] )


mean( subset(data, Ozone > 31 & Temp > 90)$Solar.R )

mean( subset(data, Month==6)$Temp )


data_ozone_month5 = na.omit(subset(data, Month==5)$Ozone)
max(data_ozone_month5)
