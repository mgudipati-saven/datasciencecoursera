Run Analysis Script Explained
========================================================

Following steps are taken to process the raw data files and produce the tidy data set:

### Merge the training and the test sets to create one data set.  
  * Load the features.txt file for column names.
  * Load the activity labels from the file.
  * Create test data frame by loading the subject test file.
  * Load the y test file.
  * Add Activity column to the test data frame using activity labels.  
  * Load the x test file into test data frame using the column names from features list.  
  * Create train data frame by loading the subject train file.
  * Load the y train file.
  * Add Activity column to the train data frame using activity labels.
  * Load the x train file into train data frame using the column names from features list.

### Extract only the measurements on the mean and standard deviation for each measurement. 

### Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
  * Melt the data frame using Subject and Activity as id variables
  * Reshape the data and perform mean aggregation on Subject and Activity factor variables
