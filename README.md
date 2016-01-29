# Getting-and-cleaning-data---course-project

The "run_analysis.R" script do the following:

* reads the data ("features.txt", "subject_test.txt", "subject_train.txt", "X_test.txt", "y_test.txt", "X_train.txt" and "y_train.txt")
	* uses read.table()
	* file names are fixed, namely: "UCI HAR Dataset/features.txt", "UCI HAR Dataset/test/subject_test.txt" and so one; we demand the Samsung data are in the working directory

* prepares variable names
	* uses gsub() to remove some characters or replace characters by another
	
* merges data
	* uses cbind() and rbind()

* Adds descriptive variable "activity" according to the numeric variable

* chooses the appropriate columnes
	*uses grepl()

* creates a tidy data set
	*uses aggregate()

* writes data in the "tidyData.txt" file
	*uses write.table() with sep="," and row.names=FALSE 



To run the script do the following:

* save the Samsung data (the "UCI HAR Dataset" directory with the content) and the file "run_analysis.R" in your working directory
* run R.Studio (or R)
* run R script using "source("run_analysis.R")"
* the "tidyData.txt" file should be created


To read the "tidyData.txt" file do the following

* run "tidyData <- read.table(""tidyData.txt", sep=",", header=TRUE)" to read the data

