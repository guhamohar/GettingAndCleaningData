# Getting and Cleaning Data Project

In this project we download and clean a dataset collected from the accelerometers from Samsung Galaxy S smartphone.


This repository contains the following files:

* SecondData.csv
* codebook.md
* run_analysis.R

The file "run_analysis.R" contains the code written in R which performs the following
tasks:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set , "SecondData.csv", with the average of each variable for each activity and each subject. 

The file "codebook.md" describes the data and the steps performed to clean up and create the 
second dataset. 

The output of code in run_analysis.R is uploaded as "SecondData.csv", which is a dataset with dimesions 180 x 68.

