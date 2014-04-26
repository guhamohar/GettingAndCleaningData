# Getting and Cleaning Data Project


In this project we clean a dataset downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip,
which can be used for later analysis. 
This repository contains the following files:

* run_analysis.R
* codebook.md

The file "run_analysis.R" contains the code written in R which performs the following
tasks:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set , "SecondData.csv", with the average of each variable for each activity and each subject. 

The file "codebook.md" describes the variables, the data, and the steps performed to clean up 
the data. 

