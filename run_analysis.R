

require(reshape2)


# returns table with input as  a file and a vector with heading names
maketable <- function(file,col.names){ 
  table <- read.table(paste("./UCI HAR Dataset", file, sep="/"),col.names=col.names)
}

# extract feature labels (clean the labels) and activity labels from txt files

featureLabels <- maketable("features.txt")[,2]
featureLabels <- sub("()", "", featureLabels, fixed=T)

activityLabels <- maketable( "activity_labels.txt", col.names=c("code", "label"))


# Read test data and training data and make a table with heading names
# as the feature labels. 

xtestData <- maketable("test/X_test.txt", col.names=featureLabels)
xtrainingData <- maketable("train/X_train.txt", col.names=featureLabels)

ytestData <- maketable("test/y_test.txt")
ytrainData <- maketable("train/y_train.txt")


# Merges the training and the test sets to create one data set 
allXData <- rbind(xtestData, xtrainingData)
allYData <- rbind(ytestData, ytrainData)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Select the feature labels measuring mean and standard deviation and reduce the dataset

meanlabels<- grep("\\bmean\\b",featureLabels)
stdlabels<- grep("std",featureLabels)

# x stores the indices of the featurelabels with measurements on the mean and standard deviation
x <-sort(union(meanlabels,stdlabels))
#alldata is the reduced dataset
dataReduced <- allXData[,x]

#labels the y-data set with descriptive activity names
yLabels=vector(mode="character", length=length(allYData))
for(i in 1:6){
  pos <- which(allYData==i)
  yLabels[pos]<- as.character(activityLabels[i,2])
}

# reading subject IDs of training and test sets
subjectTrain <- maketable("train/subject_train.txt")
subjectTest <- maketable("test/subject_test.txt")

# combine the subject IDs
subjectVector = rbind(subjectTrain, subjectTest)
idVector <- sort(unique(subjectVector)[,1])


tidyData<-cbind(subjectVector,yLabels,dataReduced)
names(tidyData)<-c("Subject","Activity",paste("Avg",names(dataReduced),sep="."))

#melt tidyData with id's as "Subject"and "Activity"
molten <- melt(tidyData,id=c("Subject","Activity"))
#dcast with aggregate function mean
secondData<-dcast(molten,Subject+Activity~variable,mean)

write.csv(secondData,file="SecondData.csv")
      
