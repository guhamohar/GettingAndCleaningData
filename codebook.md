# Data Description, Data Cleaning and Output

##Introduction
The goal of this project is to download and clean the data collected for human activity
recognition using the built-in inertial sensors in smartphones [1]. Human activity recognition
using sensory data has become an active eld of research in the domain of mobile computing.
The advances in this eld will enable computer devices to improve user experiences and bring
better healthcare [2], [3] and living services [4].

## Data Collection
In this particular data set used, each of 30 subjects carrying a Samsung Galaxy S II performed
six dierent activities: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing,
and Laying. During each activity, a few seconds of accelerometer and gyroscope data were
collected from the smartphone at 50 Hz. These time series were then processed into a set
of classication features (details on the data website [5]) to classify the type of activity.


## Reading Data
In the first step we download and extract "UCI HAR Dataset.zip" which contains folders
"test" and "train" and txt files "activity_labels", "features", "feature_info" and "README".
The description of set of variables that were estimated are provided in "feature_info" and 
complete list of variables of each feature vector is available in "features.txt".

The test and train folders contains txt files with list of subjects, measurements of 561 
features on the subjects and the activity labels on these subjects.
We ignore the measurement "Inertial Signals" provided in the forders test and train. 


## Data Cleaning and Data Reduction
We clean the labels in feature.txt by deleting "()" from the subject names, ex tBodyAcc-mean()-X.
The data on from training  and test set are combined and we extract only the measurements on the 
mean and standard deviation for each measurement. We use the descriptive activity name corresponding
to the activity code and label the data set accordingly.


## Creating New Variable and Reshaping Data
In the final step of this project we  independent tidy data set with the average of each variable
for **each activity** and **each subject**. To accomplish this we use the reshape2 library in R and use 
the function **melt()** which melts the clean data frame with "Subject" and "Activity" as the id variables.
We then use the **dcast()** function to cast the molten data frame with aggregate function mean. 
The output "SecondData.csv" has 30(number of subjects) x 6(number of activities) = 180 records of 
68 features, namely "Subject", "Activity" and 66 averages of each variable.

## run_analysis.R
The code is written in R that can be run as long as the Samsung data is in the working directory.
We use the reshape2 library and the functions melt() and dcast() which saves us from writing multiple
loops to compute average of each variable for each subject and each activity. While extracting measurements 
on the mean and standard deviation, we use the grep() function. We also create a handle function 
maketable() that inputs a file and vector with column names and returns a table.


[1] https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

[2] O. W. H. Wu, A. a T. Bui, M. a Batalin, L. K. Au, J. D. Binney, and W. J. Kaiser,
MEDIC: medical embedded device for individualized care., Articial intelligence in
medicine, vol. 42, no. 2, pp. 137-52, Feb. 2008.

[3] R. Bartalesi, F. Lorussi, M. Tesconi, A. Tognetti, G. Zupone, and D. D. Rossi,Wearable
Kinesthetic System for Capturing and Classifying Upper Limb Gesture Kinesthetic
Wearable Sensors and Kine- matic Models of Human Joints.

[4] T.-seong Kim, Multi-modal Sensor-based Human Activity Recognition for Smart Homes
Author biography, no. February, pp. 157-174, 2011.

[5] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
