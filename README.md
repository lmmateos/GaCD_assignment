##Getting and Cleaning Data programming assignment
Repository for programming assignment for Getting and Cleaning Data on Coursera

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. [1] A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In this programming assignment, one R script called run_analysis.R is developed that does the following: 

1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names.  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The files in this repository are as follows:
- README.md : This file
- CodeBook.md : Code book for the programming assignment
- run_analysis.R : Script developed as part of the programming assignment to produce a tidy data set from source data
- final_tidy_data_dt.txt : The tidy data set produced by run_analysis.R
- download_date.txt : The date the source data was downloaded and used to produce the tidy data set (March 15, 2015).

The development and test system used is an iMac with 8GB RAM running OS X 10.10.2 and RStudio 0.98.1091.

In order to produce the tidy data set, download the file run_analysis.R into a directory with sufficient space to hold the source data file (62.6 MB zipped), the source data expanded, and the resulting tidy data set.

The script produces the final_tidy_data_dt.txt and download_date.txt files.  The final_tidy_data_dt.txt file in the repository can be used for comparison.  The command to read the data is:

```
tidy_data <- read.table("finaly_tidy_data_dt.txt", header = TRUE); View(tidy_data)
```

##References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 activityrecognition@smartlab.ws

