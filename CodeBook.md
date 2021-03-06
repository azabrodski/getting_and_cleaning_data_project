---
title: "CodeBook"
author: "A Zabrodski"
date: "May 19, 2015"
output: html_document
---
### Notes 

The original measurement vector names were retained for this analysis. They are explained in the **Feature Selection** section. This decision to use the same naming convention was based on that changing the labels would make them more confusing. It is important to read the feature selection section in order to understand the measurements. Please see the examples for a plain english interpretation of the variable names 

### Data Collection (modified from original data set readme.txt)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Feature Selection (modified from original data set features_info.txt)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation

Units:

- Acceleration: *Acc* measurements are in standard gravity units (g)
- Angular acceleration: *Gyro* measurements are in radians per second (radians/s)

Examples: 

- tBodyAccJerk-std()-X: Standard deviation of time domain signal of body linear acceleration in the X plane
- fBodyBodyGyroMag-std(): Standard deviation of frequency domain signal of the magnitude body angular accerlation 
- tBodyAcc-mean()-Y: Mean of time domain signal body acceleration in the Y plane

### Data Processing 

The original data was divided into test and training sets. The following steps were taken to create a single tidy data set:

1. Test and training data were imported separately, columns to identify the subject and activity type were added before the data frames were merged
2. Observations that did not record the mean or standard deviation of the variable were removed
3. The activity names were changed from numerical to text factors that described the activity observed
4. The original data set contained multiple observations for each subject and for each activity. These were averaged so that each row contains the average of all observations for that particular subject performing an activity. So for the 30 subjects performing 6 activites, there are now 180 observations

NOTE: *Original column names were retained for all data used in the tidy data set*

### List of Variables 

The original data was processed to only contain measurements regarding the mean and standard deviation. These were averaged to create a single oberservation per activity per subject

- "SubjectLabel": Number from 1-30 to identify the subject performing the action 
- "ActivityLabel": Describes the action being measured (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

**See the Feature Selection for examples and information on the remaining categories**

- "tBodyAcc-std()-X" 
- "tBodyAcc-std()-Y" 
- "tBodyAcc-std()-Z" 
- "tGravityAcc-std()-X" 
- "tGravityAcc-std()-Y" 
- "tGravityAcc-std()-Z" 
- "tBodyAccJerk-std()-X" 
- "tBodyAccJerk-std()-Y" 
- "tBodyAccJerk-std()-Z" 
- "tBodyGyro-std()-X" 
- "tBodyGyro-std()-Y" 
- "tBodyGyro-std()-Z" 
- "tBodyGyroJerk-std()-X" 
- "tBodyGyroJerk-std()-Y" 
- "tBodyGyroJerk-std()-Z" 
- "tBodyAccMag-std()" 
- "tGravityAccMag-std()" 
- "tBodyAccJerkMag-std()" 
- "tBodyGyroMag-std()" 
- "tBodyGyroJerkMag-std()" 
- "fBodyAcc-std()-X" 
- "fBodyAcc-std()-Y" 
- "fBodyAcc-std()-Z" 
- "fBodyAccJerk-std()-X" 
- "fBodyAccJerk-std()-Y" 
- "fBodyAccJerk-std()-Z" 
- "fBodyGyro-std()-X" 
- "fBodyGyro-std()-Y" 
- "fBodyGyro-std()-Z" 
- "fBodyAccMag-std()" 
- "fBodyBodyAccJerkMag-std()" 
- "fBodyBodyGyroMag-std()" 
- "fBodyBodyGyroJerkMag-std()" 
- "tBodyAcc-mean()-X" 
- "tBodyAcc-mean()-Y" 
- "tBodyAcc-mean()-Z" 
- "tGravityAcc-mean()-X" 
- "tGravityAcc-mean()-Y" 
- "tGravityAcc-mean()-Z" 
- "tBodyAccJerk-mean()-X" 
- "tBodyAccJerk-mean()-Y" 
- "tBodyAccJerk-mean()-Z" 
- "tBodyGyro-mean()-X" 
- "tBodyGyro-mean()-Y" 
- "tBodyGyro-mean()-Z" 
- "tBodyGyroJerk-mean()-X" 
- "tBodyGyroJerk-mean()-Y" 
- "tBodyGyroJerk-mean()-Z" 
- "tBodyAccMag-mean()" 
- "tGravityAccMag-mean()" 
- "tBodyAccJerkMag-mean()" 
- "tBodyGyroMag-mean()" 
- "tBodyGyroJerkMag-mean()" 
- "fBodyAcc-mean()-X" 
- "fBodyAcc-mean()-Y" 
- "fBodyAcc-mean()-Z" 
- "fBodyAccJerk-mean()-X" 
- "fBodyAccJerk-mean()-Y" 
- "fBodyAccJerk-mean()-Z" 
- "fBodyGyro-mean()-X" 
- "fBodyGyro-mean()-Y" 
- "fBodyGyro-mean()-Z" 
- "fBodyAccMag-mean()" 
- "fBodyBodyAccJerkMag-mean()" 
- "fBodyBodyGyroMag-mean()" 
- "fBodyBodyGyroJerkMag-mean()"