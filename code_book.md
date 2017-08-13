# About source data - from Assignment Prompt

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# About variables
## Input variables
* ```x_train``` training data consisting of 7352 observations of 561
* ```y_train``` activity_id for each observation in training data
* ```subject_train``` subject_id for each observation in training data
* ```x_test``` test data consisting of 2947 observations of 561 features
* ```y_test``` activity_id for each observation in test data
* ```subject_test``` subject_id for each observation in test data
* ```features``` name for each feature in ```x_train``` and ```x_test```
* ```activity_labels``` [6,2] relating activity_id to activity_name 
* ```train_activities``` [7352,2] commposite relating ```y_train``` and activity_name from ```activity_labels```
* ```test_activities``` [2947,2] commposite relating ```y_test``` and activity_name from ```activity_labels```

## Intermediate and Output variables
* ```train_test_mrg``` merged and labeled train and test datasets
* ```mean_stdev_data``` subset of ```train_test_mrg``` that contains only identifying columns and columns containing a calculation with mean or standard deviation
* ```tidy_set``` average of each column for each activity/subject pair
