# getting-and-cleaning-data-project
# This script will download and unzip files from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# Merge all the data sets to create one data set and extract the mean and standard deviation for each #measurement. 
# It will appropriately label the data set with descriptive activity names
# It will create a tidy data set with the average of each variable for each activity and each subject
#setting directory
setwd("O:/")
#storing url
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#downloading the files
download.file(url, "./quizdata/dataset.zip", mode="wb")
#making sure that file was downloaded in the directory
list.files("./quizdata")
#unzip the file
unzip("./quizdata/dataset.zip", exdir = ".")
#read the training and test data into handles
#setting the directory to the file that contains the training set
setwd("O:/UCI HAR Dataset/train")
trainx<-read.table("x_train.txt")
trainy<-read.table("y_train.txt")
trainsubject<-read.table("subject_train.txt")
#setting the directory to the file that contains the test set
setwd("O:/UCI HAR Dataset/test")
#reading the test files
testx<-read.table("x_test.txt")
testy<-read.table("y_test.txt")
testsubject<-read.table("subject_test.txt")
#y files have the labels for the x data files 
setwd("O:/UCI HAR Dataset")
labels<-read.table("activity_labels.txt")
features<-read.table("features.txt")
info<-read.csv("features_info.txt",header=FALSE)
#Starting merging data sets with same number of observations to create one data set
datax<-rbind(testx,trainx)
datay<-rbind(testy,trainy)
datasub<-rbind(testsubject,trainsubject)
#setting variable names
names(datax)<-features$v2
names(datay)<-c("activity")
names(datasub)<-c("subject")
#merging all the columns together now for the final dataframe
combinedata<-cbind(datax,cbind(datay,datasub))
# getting the standard deviation and average
View(features)
#we need to pull from the feature list, the features that contain std and mean
meanstd<-features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
meanstdata<-subset(combinedata,select=meanstd)
#adding subject and activity columns back
meanstdata2<-cbind(meanstdata,combinedata$subject)
meanstdata3<-cbind(meanstdata2,combinedata$activity)
View(meanstdata)
#it looks as though I am missing my column names
namesc<-c(as.character(meanstd), "subject", "activity" )
colnames(meanstdata3)=namesc
# Now using descriptive activity names instead of numbers
meanstdata3$activity <- factor(meanstdata3$activity, levels=labels$V1, labels=labels$V2)
#creating the tidy data set with the average of each variable for each activity and each subject
tidyd<-aggregate(.~subject+activity,meanstdata3,mean)
#writing the file
write.table(tidyd, file = "tidydata.txt",row.name=FALSE)




 
