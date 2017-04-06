---
title: "CodeBook"
author: "Franco Zanini"
date: "06 aprile 2017"
output: html_document
---

## Description
The script tidy_project.R performs the five steps required by the instructions:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
I performed the following actions in order to reach the required result, using only dplyr as library:  
•	Use of the rbind() function to merge the test sets, labels and subject identifier in order to create a single data set from the original training and test data sets.  
•	Use of the grep() function to subset the data set i order to keep only the data related to mean and standard deviation.  
•	Extraction of the correct labels of the activities from the activity_labels.txt file.   
•	Use of clear variable names instead of the sometimes obscure original names and correction of a mistake (“bodybody” instead of “body”).  
•	Creation of a tidy data set (clean_data.txt) for the 6 activities and the 30 subjects, containing the average measures of the different variables.  

## Original data
The original data have been downloaded from   
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
which generates the directory UCI HAR Dataset, which should be used as working directory to run the script.   
## Variables
•	x_train, y_train, x_test, y_test, subject_train and subject_test are the data from the downloaded files for training and test, where x are the sets, y are the labels and subject are the subject identifiers.  
•	x_data, y_data and subject_data correspond to the merge of the described original files.  
•	features  and features_info list and describe the measured variables associated with the columns.  
•	stat_features is used to extract only the variables related to mean and standard deviation.  
•	activity_labels and activities are related to the 6 activities used for the original measurements.  
•	Fulldatacols are the names of the columns to be changes to correct a typo and use, where possible, a less obscure definition. 
•	full_data is an intermediate tidy dataset, where full_data_stat contains the requested averages to be written in clean_data.txt as a final result.  
•	The units of the different measured data are not described in the original files.

