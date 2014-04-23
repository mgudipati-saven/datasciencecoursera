Run Analysis Script Explained
========================================================

### Files
The run_analysis.R script assumes that the following files are present in the working directory:
* features.txt file
* activity_labels.txt file.
* y_train.txt, y_test.txt files.
* X_train.txt, X_test.txt files.
* subject_train.txt, subject_test.txt files.

### Dependencies
* The script depends on "reshape2" package for melting and dcasting data sets.

### Steps

Following steps are taken to process the raw data files and produce the first tidy data set:
* Load the features.txt file for column names.
* Load the activity labels from the activity_labels.txt file.
* Create test data frame by loading the subject_test.txt file.
* Load the y_test.txt file into test data frame using the column names from features list.
* Add "Activity" column to the test data frame using activity labels.  
* Load the x_test.txt file into test data frame using the column names from features list.  
* Create train data frame by loading the subject_train.txt file.
* Load the y_train.txt file.
* Add "Activity" column to the train data frame using activity labels.
* Load the x_train.txt file into train data frame using the column names from features list.
* Combine the test and train data sets into one data set.
* Extract only the measurements on the mean and standard deviation for each measurement.

Following steps are taken to create a second, independent tidy data set with the average of each variable for each activity and each subject:
  * Using reshape2 package, melt the data frame using Subject and Activity as id variables.
  * Reshape the data and perform mean aggregation on Subject and Activity factor variables.
