## run_analysis.R

## Download data - if necessary
filename <- "getdata_projectfiles_UCI_HAR_Dataset.zip"
if (!file.exists(filename)){
     fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     download.file(fileURL, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
     unzip(filename) 
}

## Read in the training and testing datasets
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Read in the feature vector and activity labels
features <- read.table('./UCI HAR Dataset/features.txt')
activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt')

## Update column names to be more descriptive
colnames(features) <- c("feature_id","feature_name")
colnames(activity_labels) <- c("activity_id","activity_name")
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activity_id"
colnames(subject_train) <- "subject_id"
train_activities <- merge(y_train,activity_labels, by="activity_id",all.x=TRUE)
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activity_id"
colnames(subject_test) <- "subject_id"
test_activities <- merge(y_test,activity_labels, by="activity_id",all.x=TRUE)

## Merge the train and test datasets
train <- cbind(subject_train, train_activities, x_train)
test <- cbind(subject_test, test_activities, x_test)
train_test_mrg <- rbind(train, test)

## Extract the mean and standard deviation by creating a logical vector and extracting those columns
cols <- colnames(train_test_mrg)
logical_mean_stdev <- grepl("subject_id",cols) | grepl("activity_name",cols) | grepl(".*mean.*",cols) | grepl(".*std.*",cols)
mean_stdev_data <- train_test_mrg[,logical_mean_stdev==TRUE]

## Create a tidy dataset with the average of each variable for each activity and each subject
tidy_set <- aggregate(. ~ subject_id + activity_name, mean_stdev_data, mean)
tidy_set <- tidy_set[order(tidy_set$subject_id,tidy_set$activity_name),]

## Write tidy data to a file
write.table(tidy_set, "tidy_set.txt", row.name=FALSE)