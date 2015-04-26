# getting-and-cleaning-data-project
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


 
