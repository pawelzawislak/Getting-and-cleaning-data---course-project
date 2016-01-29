## 1. Reading data


features <- read.table("UCI HAR Dataset/features.txt")

testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

test <- read.table("UCI HAR Dataset/test/X_test.txt")
train <- read.table("UCI HAR Dataset/train/X_train.txt")

testLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
trainLabels <- read.table("UCI HAR Dataset/train/y_train.txt")


## 2. Preparing variable names

columneNames <- as.character(features$V2)

columneNames <- gsub("[(]|[)]|[-]|[,]|[.]","",columneNames)

columneNames <- gsub("mean", "Mean", columneNames)
columneNames <- gsub("std", "Std", columneNames)
columneNames <- gsub("mad", "Mad", columneNames)
columneNames <- gsub("max", "Max", columneNames)
columneNames <- gsub("min", "Min", columneNames)
columneNames <- gsub("sma", "Sma", columneNames)
columneNames <- gsub("energy", "Energy", columneNames)
columneNames <- gsub("iqr", "Iqr", columneNames)
columneNames <- gsub("entropy", "Entropy", columneNames)
columneNames <- gsub("arCoeff", "ArCoeff", columneNames)	
columneNames <- gsub("correlation", "Correlation", columneNames)
columneNames <- gsub("maxInds", "MaxInds", columneNames)
columneNames <- gsub("meanFreq", "MeanFreq", columneNames)
columneNames <- gsub("skewness", "Skewness", columneNames)
columneNames <- gsub("kurtosis", "Kurtosis", columneNames)
columneNames <- gsub("bandsEnergy", "BandsEnergy", columneNames)
columneNames <- gsub("anlge", "Angle", columneNames)
columneNames <- gsub("gravity", "Gravity", columneNames)

names(testLabels)="act"
names(testSubject)="subjectId"

names(trainLabels)="act"
names(trainSubject)="subjectId"

names(test)=columneNames
names(train)=columneNames

## 3. Merging data

trainMerged <- cbind(trainSubject, trainLabels)
testMerged <- cbind(testSubject, testLabels)

##### Adding descriptive variable "activity" according to the numeric variable "act"

activityCode <- c("WALKING"=1, "WALKING_UPSTAIRS"=2, "WALKING_DOWNSTAIRS"=3, "SITTING"=4, "STANDING"=5, "LAYING"=6)
trainMerged$activity <- names(activityCode)[match(trainMerged$act, activityCode)]
testMerged$activity <- names(activityCode)[match(testMerged$act, activityCode)]

trainMerged <- cbind(trainMerged, train)
testMerged <- cbind(testMerged, test)


dataMerged <- rbind(testMerged, trainMerged) 

 
## 4. Choosing columns with Mean and Std

dataMerged <- dataMerged[,(grepl("Mean",names(dataMerged)))|(grepl("Std",names(dataMerged)))|(grepl("activity",names(dataMerged)))|(grepl("subjectId",names(dataMerged)))]

## 5. Creating a tidy data set

tidyData <- aggregate(dataMerged[, 3:88], list(subjectId=dataMerged$subjectId, activity=dataMerged$activity), mean)

## 6. Writing data in a txt file

write.table(tidyData, "tidyData.txt", sep=",", row.names = FALSE)


