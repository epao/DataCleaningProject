################################################################################
# AUTHOR: Eric Pao
# TITLE: Getting & Cleaning Data - Programming Assignment
# DATE: 10/31/2016
################################################################################

setwd("C:/Users/ep7246/Documents/Data Science Track/03 - Coursera/01 - Courses/02 - Getting and Cleaning Data/03 - Week 4/UCI HAR Dataset")


#### 1. Load Data Set ####

## Load Activity Labels ##
activity <- read.table("./activity_labels.txt",sep="",stringsAsFactors=FALSE)

## Load Features ##
features <- read.table("./features.txt",sep="",stringsAsFactors=FALSE)

## Load Training Set ##
XTrain <- read.table("./train/X_Train.txt",sep="")
YTrain <- read.table("./train/y_train.txt",sep="")
Subject_Train <- read.table("./train/subject_train.txt",sep="")

## Load Test Set ##
XTest <- read.table("./test/X_test.txt",sep="")
YTest <- read.table("./test/y_test.txt",sep="")
Subject_Test <- read.table("./test/subject_test.txt",sep="")

#### 2. Add descriptive variable names based on features file####

## Add Column Names ##
names(XTrain) <- features$V2
names(XTest) <- features$V2
names(Subject_Train) <- "Subject_ID"
names(Subject_Test) <- "Subject_ID"
names(YTest) <- "Activity"
names(YTrain) <- "Activity"

## Subjects as factors ##
Subject_Test$Subject_ID <- as.factor(Subject_Test$Subject)
Subject_Train$Subject_ID <- as.factor(Subject_Train$Subject)


#### 3. Label activity names for the activites in the data set ####

## Update Train/Test Activity Features with Actvity Label ##
YTrain$Activity <- as.factor(YTrain$Activity)
levels(YTrain$Activity) <- activity$V2
YTest$Activity <- as.factor(YTest$Activity)
levels(YTest$Activity) <- activity$V2

#### 4. Merge training and test data sets into master data frame ####

## Create Master Train and Test Sets ##
Test <- cbind(Subject_Test, YTest, XTest)
Train <- cbind(Subject_Train, YTrain, XTrain)

## Merge Master Training and Test Sets ##
Master <- rbind(Test,Train)

#### 5. Extract only measurements on the mean and stdev for each measurement ####

Data_Mean_Stdev <- Master[,grepl("Subject_ID|Activity|mean|std",names(Master))]

#### 6. Create second, independent tidy data set with the average of each variable for each activity and each subject. ####

library(plyr)
Subject_Activity_Avg <- ddply(Data_Mean_Stdev, .(Subject_ID,Activity), numcolwise(mean))
colnames(Subject_Activity_Avg)[3:length(Subject_Activity_Avg)] <- paste("AVERAGE", colnames(Subject_Activity_Avg[3:length(Subject_Activity_Avg)]),sep="_")
write.table(Subject_Activity_Avg, file = "Tidy_Avg_MeasurementsBy_Subject_Activity.txt",row.name=FALSE)
