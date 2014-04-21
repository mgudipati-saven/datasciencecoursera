run_analysis <- function() {
  ## Merges the training and the test sets to create one data set.
  
  # Load the features.txt file for column names.
  features = read.table("./features.txt")
  
  # Load the x test file using the column names from features list.
  xtest = read.table("./X_test.txt", col.names=features[[2]])

  # Load the x train file.
  xtrain = read.table("./X_train.txt", col.names=features[[2]])
  
  # Load the activity labels from the file.
  actlabs = read.table("./activity_labels.txt")
  
  # Load the y test file 
}