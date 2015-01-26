run_analysis <- function(){
    ## all the datasets are in the same directory as default
    
    ## read the data into each variables
    trainX <- read.table("./Dataset/train/X_train.txt")
    trainY <- read.table("./Dataset/train/y_train.txt")
    features <- read.table("./Dataset/features.txt")
    testY <- read.table("./Dataset/test/y_test.txt")
    testX <- read.table("./Dataset/test/X_test.txt")
    
    ## combine train dataset and test dataset and then merge two data frames together
    train <- cbind(trainX, trainY)
    test <- cbind(testX, testY)
    data <- rbind(train, test)
    
    ## labels the columns with the feature names
    features <- as.vector(features$V2)
    colnames(data) <- c(features)
    
    ## remove duplicated colnames (no mean or std involved)
    data <- data[,!duplicated(features)]
    
    ## extracts the measurements on mean and standard deviation for each measurement
    ## use dplyr to select the columns and combine to a new data frame
    library(dplyr)
    meanData <- select(data, contains("mean()"))
    stdData <- select(data, contains("std()"))
    data <- cbind(meanData, stdData)
    
    ## label the data set with descriptive varible names
    acti_labels <- read.table("./Dataset/activity_labels.txt")
    activity <- rbind(trainY, testY)
    activity <- activity$V1
    for (i in 1:length(activity)) {
        index <- activity[i]
        label <- as.character(acti_labels[index,]$V2)
        activity[i] <- label
    }
    data <- cbind(data, activity)
    colnames(data)[67] <-"activity"
    
    ## write the data
    write.table(data, file = "./resultData.txt", row.name = FALSE)
    data
}