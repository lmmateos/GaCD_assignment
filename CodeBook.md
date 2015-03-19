##Code Book for Getting and Cleaning Data programming assignment on Coursera

This code book describes the variables, the data, and transformations or work performed to clean up the data to produce a tidy data set from the source data.

###Background Information

The following information was obtained from [1]. The source data represents the experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

For each record in the dataset it is provided:  
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
- Triaxial Angular velocity from the gyroscope.  
- A 561-feature vector with time and frequency domain variables.  
- Its activity label.  
- An identifier of the subject who carried out the experiment.  

Notes:  
- Features are normalized and bounded within [-1,1].  
- Each feature vector is a row on the text file.  

###Programming Assignment Information

The source data for this programming assignment is downloaded from this link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Once unzipped, the following files are found in directory "UCI HAR Dataset":  
- activity_labels.txt (used by script)  
- features_info.txt  --describes time and frequency domain collected and calculated data
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

The combination of the training and test data files provides 10299 observations of 561 variables. The variables of interest are the 66 statistical mean and standard deviation values as follows, where the initial number indicates the column in the sorce data set:  
1 tBodyAcc-mean()-X  
2 tBodyAcc-mean()-Y  
3 tBodyAcc-mean()-Z  
4 tBodyAcc-std()-X  
5 tBodyAcc-std()-Y  
6 tBodyAcc-std()-Z  
41 tGravityAcc-mean()-X  
42 tGravityAcc-mean()-Y  
43 tGravityAcc-mean()-Z  
44 tGravityAcc-std()-X  
45 tGravityAcc-std()-Y  
46 tGravityAcc-std()-Z  
81 tBodyAccJerk-mean()-X  
82 tBodyAccJerk-mean()-Y  
83 tBodyAccJerk-mean()-Z  
84 tBodyAccJerk-std()-X  
85 tBodyAccJerk-std()-Y  
86 tBodyAccJerk-std()-Z  
121 tBodyGyro-mean()-X  
122 tBodyGyro-mean()-Y  
123 tBodyGyro-mean()-Z  
124 tBodyGyro-std()-X  
125 tBodyGyro-std()-Y  
126 tBodyGyro-std()-Z  
161 tBodyGyroJerk-mean()-X  
162 tBodyGyroJerk-mean()-Y  
163 tBodyGyroJerk-mean()-Z  
164 tBodyGyroJerk-std()-X  
165 tBodyGyroJerk-std()-Y  
166 tBodyGyroJerk-std()-Z  
201 tBodyAccMag-mean()  
202 tBodyAccMag-std()  
214 tGravityAccMag-mean()  
215 tGravityAccMag-std()  
227 tBodyAccJerkMag-mean()  
228 tBodyAccJerkMag-std()  
240 tBodyGyroMag-mean()  
241 tBodyGyroMag-std()  
253 tBodyGyroJerkMag-mean()  
254 tBodyGyroJerkMag-std()  
266 fBodyAcc-mean()-X  
267 fBodyAcc-mean()-Y  
268 fBodyAcc-mean()-Z  
269 fBodyAcc-std()-X  
270 fBodyAcc-std()-Y  
271 fBodyAcc-std()-Z  
345 fBodyAccJerk-mean()-X  
346 fBodyAccJerk-mean()-Y  
347 fBodyAccJerk-mean()-Z  
348 fBodyAccJerk-std()-X  
349 fBodyAccJerk-std()-Y  
350 fBodyAccJerk-std()-Z  
424 fBodyGyro-mean()-X  
425 fBodyGyro-mean()-Y  
426 fBodyGyro-mean()-Z  
427 fBodyGyro-std()-X  
428 fBodyGyro-std()-Y  
429 fBodyGyro-std()-Z  
503 fBodyAccMag-mean()  
504 fBodyAccMag-std()  
516 fBodyBodyAccJerkMag-mean()  
517 fBodyBodyAccJerkMag-std()  
529 fBodyBodyGyroMag-mean()  
530 fBodyBodyGyroMag-std()  
542 fBodyBodyGyroJerkMag-mean()  
543 fBodyBodyGyroJerkMag-std()  

See the file "features_info.txt" in the source data for a description of the features.  

These feature names are converted to syntactically valid R variable names by replacing non-alphanumeric characters with "."  Two variables are added to for subject ID (1-30) and activity (walking, walking_upstairs, walking_downstairs, sitting, standing and laying). The resulting variable names are:  
- subjectID
- activity
- tBodyAcc.mean...X  
- tBodyAcc.mean...Y  
- tBodyAcc.mean...Z  
- tGravityAcc.mean...X  
- tGravityAcc.mean...Y  
- tGravityAcc.mean...Z  
- tBodyAccJerk.mean...X  
- tBodyAccJerk.mean...Y  
- tBodyAccJerk.mean...Z  
- tBodyGyro.mean...X  
- tBodyGyro.mean...Y  
- tBodyGyro.mean...Z  
- tBodyGyroJerk.mean...X  
- tBodyGyroJerk.mean...Y  
- tBodyGyroJerk.mean...Z  
- tBodyAccMag.mean..  
- tGravityAccMag.mean..  
- tBodyAccJerkMag.mean..  
- tBodyGyroMag.mean..  
- tBodyGyroJerkMag.mean..  
- fBodyAcc.mean...X  
- fBodyAcc.mean...Y  
- fBodyAcc.mean...Z  
- fBodyAccJerk.mean...X  
- fBodyAccJerk.mean...Y  
- fBodyAccJerk.mean...Z  
- fBodyGyro.mean...X  
- fBodyGyro.mean...Y  
- fBodyGyro.mean...Z  
- fBodyAccMag.mean..  
- fBodyBodyAccJerkMag.mean..  
- fBodyBodyGyroMag.mean..  
- fBodyBodyGyroJerkMag.mean..  
- tBodyAcc.std...X  
- tBodyAcc.std...Y  
- tBodyAcc.std...Z  
- tGravityAcc.std...X  
- tGravityAcc.std...Y  
- tGravityAcc.std...Z  
- tBodyAccJerk.std...X  
- tBodyAccJerk.std...Y  
- tBodyAccJerk.std...Z  
- tBodyGyro.std...X  
- tBodyGyro.std...Y  
- tBodyGyro.std...Z  
- tBodyGyroJerk.std...X  
- tBodyGyroJerk.std...Y  
- tBodyGyroJerk.std...Z  
- tBodyAccMag.std..  
- tGravityAccMag.std..  
- tBodyAccJerkMag.std..  
- tBodyGyroMag.std..  
- tBodyGyroJerkMag.std..  
- fBodyAcc.std...X  
- fBodyAcc.std...Y  
- fBodyAcc.std...Z  
- fBodyAccJerk.std...X  
- fBodyAccJerk.std...Y  
- fBodyAccJerk.std...Z  
- fBodyGyro.std...X  
- fBodyGyro.std...Y  
- fBodyGyro.std...Z  
- fBodyAccMag.std..  
- fBodyBodyAccJerkMag.std..  
- fBodyBodyGyroMag.std..  
- fBodyBodyGyroJerkMag.std..  

Note that the column order reflects selecting first the mean values as a group then the standard deviation values as a group.  

For these last 66 variables, the 10299 observations (numeric data) are averaged over and ordered by subject identifier (an integer) and activity (a character string) resulting in a total of 180 average values (30 subject * 6 activities) for each variable in the final tidy data set.  

###References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

Source:  Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

