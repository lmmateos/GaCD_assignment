## Getting and Cleaning Data, Programming Assignment, louise.mateos@sbcglobal.net

## run_analysis.R

## Purpose
## This script is used to demonstrate an ability to collect, work with, and clean 
## a data set. This script prepares tidy data that can be used for later analysis. 

## The subject data is associated with the domain of wearable computing.  The data link
## below represents data collected from the accelerometers from the Samsung Galaxy S 
## smartphone. A full description is available at the site where the data was obtained: 
        
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Here are the data for the project

## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Preconditions:
##      1.  Ensure data.table, dplyr and tidyr packages are installed

library(data.table)
library(dplyr)
library(tidyr)

## download zipped data from internet link provided in assignment (and listed above) and 
## unzip

if (!file.exists("UCIdata.zip")) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, 
                      destfile = "UCIdata.zip", 
                      method = "curl")
        dateDownloaded <- date()
        write.csv(dateDownloaded, "download_date.txt")
        unzip("UCIdata.zip", exdir = ".")
        } else {
        dateDownloaded <- read.csv("download_date.txt", stringsAsFactors = FALSE)[[2]]
}

## read in training and test data sets

training_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
training_data_dt <- data.table(training_data)
rm(training_data)
        
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_data_dt <- data.table(test_data)
rm(test_data)

## merge training and test sets into one data set (#1 in list of tasks)

all_data_dt <- data.table(bind_rows(training_data_dt, test_data_dt))

## label variables descriptively (#4 in list of tasks)

## read in features for variable names (in same order as columns of merged data set)

variable_names <- read.table("./UCI HAR Dataset/features.txt")
variable_names_dt <- data.table(variable_names)
rm(variable_names)

## make syntactically valid variable names

clean_variable_names <- make.names(variable_names_dt[,V2], unique = TRUE)

## set column names to variable names

setnames(all_data_dt,clean_variable_names)

## extract measurements of mean and standard deviation (#2 in list of tasks)
## assume only variables that are statistical mean or std values in collected data, 
## e.g., does not include meanFreq values nor angles

all_selected_data_dt <- select(all_data_dt, 
                               contains(".mean."), 
                               contains(".std."))

## name activities descriptively (#3 in list of tasks)

## read in activity names

activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                             stringsAsFactors = FALSE)

## read in activity labels for observations in y_train.txt and y_test.txt and merge

training_labels <- read.table("./UCI HAR Dataset/train/y_train.txt")
training_labels_dt <- data.table(training_labels)
rm(training_labels)

test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_labels_dt <- data.table(test_labels)
rm(test_labels)

all_labels_dt <- data.table(bind_rows(training_labels_dt, 
                                      test_labels_dt))

## recode to activity names

#### TO DO

all_activities_dt <- data.table(sapply(all_labels_dt[,V1],as.character))
setnames(all_activities_dt,"activity")

for (i in 1:nrow(all_labels_dt)) {
        all_activities_dt[i] <- activity_names[as.integer(all_labels_dt[i]),2]
}

## merge with selected training and test data

all_labeled_selected_data_dt <- data.table(bind_cols(all_activities_dt, 
                                                     all_selected_data_dt))

## create a second, independent tidy data set with the average 
## of each variable for each activity and each subject (#5 in list of tasks)

## read in subject ids subject_train.txt and subject_test.txt and merge

training_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
training_subjects_dt <- data.table(training_subjects)
rm(training_subjects)

test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_subjects_dt <- data.table(test_subjects)
rm(test_subjects)

all_subjects_dt <- data.table(bind_rows(training_subjects_dt, 
                                        test_subjects_dt))
setnames(all_subjects_dt,"subjectId")

final_data_dt <- data.table(bind_cols(all_subjects_dt, 
                                      all_labeled_selected_data_dt))

## group by subjectId and activity variables

final_grouped_data_dt <- group_by(final_data_dt, subjectId, activity)

## create summaries ordered by subject and activity

final_tidy_data_dt <- setorder((final_grouped_data_dt[,lapply(.SD,mean),by="subjectId,activity"]),
                                subjectId,
                                activity)

write.table(final_tidy_data_dt, file = "final_tidy_data_set.txt", row.names=FALSE)
