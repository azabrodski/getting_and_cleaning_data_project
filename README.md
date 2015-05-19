
Coursera Getting and Cleaning Data Project
==================================================================

run_analysis.R script

A Zabrodski
Coursera Getting and Cleaning Data Course getdata-014

==================================================================
Script Summary: 

Downloads the samsung accelerometer data, and merges the training and
test data. Removes measurements that are not mean or standard
deviation, then averages the remaining observations by subject and
type of action. The resulting file is a data frame that meets the requirements of "tidy data"
with each row representing a single obersvation and each column a single variable

======================================
Dependencies: 

The script uses the "downloader" package to download and unzip the data. The requirements indicate that 
the script should work assuming that the user already has the data downloaded in their working directory. You can ignore the 
download script in this case by commenting it out. It is assumed that the folder "UCI HAR Dataset" exists within the working
directory which is the default name when the file is unzipped

The reshape2 package is used to average the observations by subject and observation type. It is absolutely required in order
for the script to function properly 

=========================================
The repository includes the following files:

- 'README.txt'

- 'run_analysis.R' 

The run_analysis.R script completes the following operations:

1) Import test data, column names, activity labels, and subject numbers

2) Names the columns for each data frame and vector

3) Binds the vectors to the data frame for the test data

4) Repeats steps 1-3 for the training data

5) Binds the training and test data to complete a merged data frame

6) Identifies columns that contain mean() and std() measurements, then subsets the data frame to remove other columns

7) Adds descriptive names to the ActivityLabel column

8) Processes the data so that the data is averaged for each variable, for each type of action, for each subject using reshape2

9) Writes the data into a file "merged_and_averaged_data.txt" 

- 'CodeBook.md': 

Describes the variables, the data, and transformations performed to clean up the data 
