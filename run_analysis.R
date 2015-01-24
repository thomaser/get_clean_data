## run_analysis.R

## This script is divided into six parts:
## 1. reading data
## 2. extracting relevant measurements
## 3. merging datasets
## 4. creating tidy data
## 5. description of tidy data
## 6. writing output

## 1. reading data
## read data from the UCI HAR Dataset. 
## This script requires the dataset to be unpacked in the working directory.

features<-read.table("UCI HAR Dataset/features.txt")["V2"]
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")["V2"]

# train set
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
names(X_train)<-features$V2

Y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
names(Y_train)<-"labels"

subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train)<-"subjects"

# test set
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
names(X_test)<-features$V2

Y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
names(Y_test)<-"labels"

subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test)<-"subjects"

## 2. extracting relevant measurements
# extracting the mean and standard deviation for each measurement
# find number of rows of mean and std data
no_of_rows_of_means_and_stds<-grep("mean|std",features$V2) 

# find names of measurements
means_and_std_colnames<-colnames(X_test)[no_of_rows_of_means_and_stds]

# create test subset
X_test_subset<-cbind(subject_test,Y_test,subset(X_test,select=means_and_std_colnames))

#create train subset
X_train_subset<-cbind(subject_train,Y_train,subset(X_train,select=means_and_std_colnames))

## 3. merging datasets
# Merge "train" set and "test" set into one data set.
XY<-rbind(X_test_subset, X_train_subset)

## 4. creating tidy data
# Create tidy data set with the mean of each variable for each activity and each subject
tidy<-aggregate(XY[,3:ncol(XY)],list(Subject=XY$subjects, Activity=XY$labels), mean)
tidy<-tidy[order(tidy$Subject),]

## 5. description of tidy data
# Add descriptive activity names to identify the activities in the tidy data set
tidy$Activity<-activity_labels[tidy$Activity,]

## 6. writing output
# Write tidy data set into txt file
write.table(tidy, file="./tidydata.txt", sep="\t", row.names=FALSE)
