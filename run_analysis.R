run_analysis <- function(){
    # all the datasets are in the same directory as default
    
    # read the data into each variables
    trainX <- read.table("./Dataset/train/X_train.txt")
    trainY <- read.table("./Dataset/train/y_train.txt")
    features <- read.table("./Dataset/features.txt")
    testY <- read.table("./Dataset/test/y_test.txt")
    testX <- read.table("./Dataset/test/X_test.txt")
    
    # combine train dataset and test dataset and then merge two data frames together
    
    
}