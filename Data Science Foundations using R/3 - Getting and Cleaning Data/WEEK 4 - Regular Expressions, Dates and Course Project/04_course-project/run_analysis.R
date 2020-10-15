# run_analysis.R

#0. prepare LIBs
# install.packages("reshape2")
library(reshape2)


#1. get dataset from web
rawDataDir <- "./rawData"
rawDataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
rawDataFilename <- "rawData.zip"
rawDataDFn <- paste(rawDataDir, "/", "rawData.zip", sep = "")


if (!file.exists(rawDataDir)) {
     dir.create(rawDataDir)
     download.file(url = rawDataUrl, destfile = rawDataDFn)
}

unzip(zipfile = rawDataDFn, exdir = "./")




#2. merge {train, test} data set
# refer: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# train data
x_train <- read.table(paste(sep = "", "./UCI HAR Dataset/train/X_train.txt"))
y_train <- read.table(paste(sep = "", "./UCI HAR Dataset/train/Y_train.txt"))
s_train <- read.table(paste(sep = "", "./UCI HAR Dataset/train/subject_train.txt"))

# test data
x_test <- read.table(paste(sep = "", "./UCI HAR Dataset/test/X_test.txt"))
y_test <- read.table(paste(sep = "", "./UCI HAR Dataset/test/Y_test.txt"))
s_test <- read.table(paste(sep = "", "./UCI HAR Dataset/test/subject_test.txt"))

# merge {train, test} data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
s_data <- rbind(s_train, s_test)




#3. load feature & activity info
# feature info
feature <- read.table(paste(sep = "",  "./UCI HAR Dataset/features.txt"))

# activity labels
a_label <- read.table(paste(sep = "",  "./UCI HAR Dataset/activity_labels.txt"))
a_label[,2] <- as.character(a_label[,2])

# extract feature cols & names named 'mean, std'

selectedCols <- grep("-(mean|std).*", as.character(feature[,2]))
selectedColNames <- feature[selectedCols, 2]

selectedColNames <- gsub("-mean", "Mean", selectedColNames)
selectedColNames <- gsub("-std", "Std", selectedColNames)

selectedColNames <- gsub("[-()]", "", selectedColNames)





#4. extract data by cols & using descriptive name
x_data <- x_data[selectedCols]
allData <- cbind(s_data, y_data, x_data)
colnames(allData) <- c("Subject", "Activity", selectedColNames)

allData$Activity <- factor(allData$Activity, levels = a_label[,1], labels = a_label[,2])
allData$Subject <- as.factor(allData$Subject)





#5. generate tidy data set
meltedData <- melt(allData, id = c("Subject", "Activity"))
tidyData <- dcast(meltedData, Subject + Activity ~ variable, mean)

write.table(tidyData, "./tidy_dataset.txt", row.names = FALSE, quote = FALSE)
