run_analysis <- function() {
  ## Check for files.
  if (!file.exists("./features.txt") 
      || !file.exists("./activity_labels.txt")
      || !file.exists("./subject_test.txt")
      || !file.exists("./y_test.txt")
      || !file.exists("./y_train.txt")
      || !file.exists("./subject_test.txt")
      || !file.exists("./y_test.txt")
      || !file.exists("./y_train.txt")) {
    stop("File(s) not found.")
  }
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
  
  # Create train data frame by loading the subject train file.
  har.train = read.table("./subject_train.txt", col.names="Subject")  
  
  # Load the y train file.
  ytrain = read.table("./y_train.txt")
  
  # Add Activity column to the train data frame using activity labels.
  har.train$Activity = factor(ytrain[[1]], labels=actlabs[[2]])
  
  # Load the x train file into train data frame using the column names from features list.
  har.train[as.character(features[[2]])] = read.table("./X_train.txt")
  
  # Combine the train and test data sets.
  har.total = rbind(har.train, har.test)
  
  ## Extracts only the measurements on the mean and standard deviation for each measurement. 
  har.mean.std = har.total[,c("Subject", "Activity", grep("mean\\(|std\\(", names(har.total), value=T))]
  
  ## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  
  # Melt the data frame using Subject and Activity as id variables
  har.melt = melt(har.mean.std, id=c("Subject", "Activity"))
  
  # Reshape the data and perform mean aggregation on Subject and Activity factor variables
  har.aggregate = dcast(har.melt, Subject + Activity ~ variable, mean)
  
  return(har.aggregate)
}