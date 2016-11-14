# Coursera Getting and Cleaning Data Final Project

## Introduction:
The goal of this project is to collect, process, and clean a data set. For this project, the following data set from UCI will be used to perform the analysis: 

Wearable Computing Data from Samsung Galaxy S smartphone: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 


## The data set is processed and cleaned using the script "run_analysis.R":
### 1. Download and Load Data
Load the Training, Testing, Subject, and Activity files.

### 2. Add Appropriate Descriptors
Based on the provided features file, update column names for the test and training data frames.

### 3. Add Activity Labels
Replace activity index with activity descriptor from provided file

### 4. Merge Test and Training data sets
Merge both test and training data sets into one master data set to perform additional analyses.

### 5. Extract Only Measurements on the Mean and STDEV for each Measurement
The purpose of this step is to select the measurements in the data frame that were **only** means or standard deviations, according to the provided data dictionary.

### 6. Create second, independent tidy data set with the average of each variable for each activity and each subject.
The final step is to take the average of each measurement for each subject-activity combination. The script then writes the table to a .txt file in the user's primary working directory.
