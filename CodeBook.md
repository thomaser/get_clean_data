The dataset is based on data from [1], downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The contained data sets, 'train' and 'test' were merged into one data set

test\X_test.txt, test\y_test.txt, test\subject_test.txt were merged into test data table
test\X_train.txt, test\y_train.txt, test\subject_train.txt were merged into train data table
From features.txt a list of number of rows of mean values and standard deviations was created.
This was achieved by selecting variables containing "mean" or "std".

Subsets form both train and test sets containing all measurements regarding the mean and standard deviation were created.
These subsets were merged together in one data table.

A second, data set with the average of each variable for each activity and each subject was created. 

The entire file was reodered by subject. 
Each activity label was replaced with the according activity name.(taken from activity_labels.txt)

Created column names:

Subject: .. range of values [1:30] .. id of a subject performing ther activity
Activity: .. Name of activity performed
Rest of the colums contain averaged variables describing mean/std measurements. 
for example: tBodyAccJerkMag-std()	tBodyGyroMag-mean()	tBodyGyroMag-std()	tBodyGyroJerkMag-mean()	tBodyGyroJerkMag-std()

Names of these variables are same as in features.txt but the values are averages of each variable for each activity and each subject.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
