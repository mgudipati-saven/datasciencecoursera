run_analysis <- function() {
  ## Merges the training and the test sets to create one data set.
  
  # Load the features.txt file for column names.
  features = read.table("./features.txt")

  # Load the activity labels from the file.
  actlabs = read.table("./activity_labels.txt")
  
  # Create test data frame by loading the subject test file.
  har.test = read.table("./subject_test.txt", col.names="Subject")  
  
  # Load the y test file.
  ytest = read.table("./y_test.txt")
  
  # Add Activity column to the test data frame using activity labels.
  har.test$Activity = factor(ytest[[1]], labels=actlabs[[2]])
  
  # Load the x test file into test data frame using the column names from features list.
  har.test[as.character(features[[2]])] = read.table("./X_test.txt")  
}