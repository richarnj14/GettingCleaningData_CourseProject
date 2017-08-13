# GettingCleaningData_CourseProject
Coursera's Data Science Specialization: Getting and Cleaning Data course project

All code for this project is included in the R script, run_analysis.R, which does the following:

* Check to see if the data exists in the working directory, if not download and extract the data
* Load the training and test datasets
* Load the activity and feature datasets
* Update the column names for all datasets to be more descriptive, then merge the activity names with the activity_id vectors
* Merges the train and test datasets
* Extract only those columns that are include a calculation with mean or standard deviation
* Create a tidy dataset with the average of each variable for each activity and each subject
* Write the tidy dataset to tidy_set.txt

Variables used in run_analysis.R are explained by code_book.md.  The end result is shown in the file tidy_set.txt.
