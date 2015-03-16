##Code Book for Getting and Cleaning Data programming assignment on Coursera

This code book describes the variables, the data, and transformations or work performed to clean up the data to produce a tidy data set from the source data.

The source data for this programming assignment is downloaded from this link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Once unzipped, the following files are found in directory "UCI HAR Dataset":  
- activity_labels.txt (used by script)  
- features_info.txt  
- features.txt (used by script)  
- README.txt  
- subdirectory "test" with files:  
      - subdirectory "Inertial Signals" with 9 files  
      - subject_test.txt (used by script)  
      - X_test.txt (used by script)  
      - y_test.txt (used by script)  
- subdirectory "train" with files:  
      - subdirectory "Inertial Signals" with 9 files  
      - subject_train.txt (used by script)  
      - X_train.txt (used by script)  
      - y_train.txt (used by script)  

The data of interest are all the statistical mean and standard deviation values.  These are contained in the "X_train.txt" and "X_test.txt" files along with other statistical values to be filtered out.  The "y_train.txt" and "y_test.txt" files contain the activities corresponding to each row in the "X" data.  The "subject_train.txt" and "subject_test.txt" files contain the subject identifiers corresponding to each row in the "X" data.  The "features.txt" file contains the variable identifiers corresponding to each column in the "X" data.

In the resulting tidy data file, the selected statistical mean and standard deviation data (numeric data) is averaged by and ordered by corresponding subject identifier (an integer) and activity type (a character string).