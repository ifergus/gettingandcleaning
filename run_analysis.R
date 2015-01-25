
## 
## Create a large dataset by combining both the taining and the test measurements
## From the large data set, create and save an independent tidy data set with
## the average of each variable for each activity and each subject.
##

get.measurement.types <- function() {
  # Reads in the column number and measurement descriptions from "features.txt"
  #
  # Returns:
  #   A data.frame containing the measurement column number and description
  #
  read.table("features.txt", stringsAsFactors = FALSE,
             col.names = c("measurement.column.num", "measurement.desc"),
             header = FALSE) 
}


get.std.mean.column.nums <- function (measurement.desc) {
  # Determines which column descriptions correspond to Mean or
  # Standard Deviation measurements
  #
  # Args:
  # measurement.desc: A Vector containing the original measurement descriptions
  #
  # Returns:
  #   An integer vector containing the column numbers for those measurement
  #   descriptions that contain the text "mean()" or "std()"
  
  grep("std[(][)]|mean[(][)]", measurement.desc)
  
}


get.descriptive.measurement.names <- function(measurement.desc) {
  # Creates a descriptive measurement name from the measurement description
  #
  # The column name is converted to camel case by removing all hyphens and periods
  # Also, "mean()" is converted to "Mean" and "std()" is converted to Std
  # Example:
  #    given the measurement fBodyAccJerk-mean()-Z, fBodyAccJerkMeanZ is returned
  #
  # Args:
  # measurement.desc: A Vector containing the original measurement descriptions
  #
  # Returns:
  #   An character vector containing of descriptive measurements names
  #   descriptions that contain the text "mean()" or "std()"
  # 
      gsub("-|[.]", "",
         sub("mean[(][)]", "Mean",
            sub("std[(][)]", "Std", measurement.desc)))
}


get.activity.types <- function() {
  # Read in the activity types from "activity_labels.txt"
  #
  # Returns:
  #   A data.frame containing the activity code and description
  # 
  read.table("activity_labels.txt",
            col.names = c("activity.code", "activity.desc"),
            stringsAsFactors = FALSE,
            header = FALSE)
}


get.measurement.data <- function (measurement.table.name,
                          activity.code.table.name,
                          subject.table.name,
                          descriptive.measurement.names,
                          mean.std.column.numbers) {
  # Creates a data frame by reading in measurement data, adding descrptive variables
  # names and adding the corresponding activty and subject columns.
  #
  # Args:
  # measurement.table.name: the file name of the meaurements table
  # activity.code.table.name: the file name of the activity code for the measurements 
  # subject.table.name: the file name of the subjects for the measurements
  # descriptive.measurement.names: a vector containing the descriptive measurement names
  # mean.std.column.numbers: A vector containing column numbers of mean and std columns
  # 
  # Returns:
  #   A data frame containing both test and measurement data
  #   

  # Read in the measurements based on the measurement.table.name
  # Extracts only the measurements on the mean and standard deviation for each measurement by 
  # only reading thos columns that are specified in the mean.std.column.numbers vector
  # store the results in measurements
   
  measurements <- read.table(measurement.table.name,
                              colClasses = "numeric",
                              stringsAsFactors = FALSE,
                              header = FALSE) [ ,mean.std.column.numbers]
   
    
  # Update column headings for each varibles with a descriptive name.
    
  colnames(measurements) <- descriptive.measurement.names
    
    
  # Read in the corresponding subject, and add the subject to the dataset by
  # adding a new varible to the data set
    
    subjects <- read.table(subject.table.name,
                           colClasses = "integer",
                           col.names = "subject.code",
                           stringsAsFactors = FALSE,
                           header = FALSE)
    
    measurements <- data.frame(subject.code = subjects$subject.code, measurements)
  
    ## Read in the corresponding Activity, and add the activity to the dataset by
    ## adding a new varible to the data set
    
    activity.codes <- read.table(activity.code.table.name,
                                 colClasses = "integer",
                                 col.names = "activity.code",
                                 stringsAsFactors = FALSE,
                                 header = FALSE)
    
    data.frame(activity.code = activity.codes$activity.code, measurements)
}


get.large.dataset <- function () {
  # Combines the training and test measurements to creates a large datset
  #
  # Returns:
  #   A data.frame containing the training and test measurement data
  #
  
  measurement.types <- get.measurement.types()
  std.mean.column.nums <- get.std.mean.column.nums(measurement.types$measurement.desc)

  # Using the original.measurement.desc vector, extract only those columns with mean
  # and std deviation text.

  descriptive.measurement.names <- get.descriptive.measurement.names (
                measurement.types$measurement.desc [std.mean.column.nums])

  test <- get.measurement.data("./test/X_test.txt",
                             "./test/y_test.txt",
                             "./test/subject_test.txt", 
                             descriptive.measurement.names,
                             std.mean.column.nums)

  train <- get.measurement.data("./train/X_train.txt",
                              "./train/y_train.txt",
                              "./train/subject_train.txt",
                              descriptive.measurement.names,
                              std.mean.column.nums)

  # Merge the test and training dataset to create a large dataset.
  test.and.training <- merge(test, train, all=TRUE)


  # Add the activity description to the dataset by merging the 
  # measurements with the activity types

  merge(test.and.training, get.activity.types(),
      by.x = "activity.code",
      by.y = "activity.code",
      x.all = TRUE)
}


get.tidy.data.set <- function(large.data.set) {
  # Creates a tidy data set from large.data.set
  #
  # Args:
  # large.data.set: a data frame containing both test and training data
  #
  # Returns:
  #   A tidy data set that's grouped by subject and activity
  #   in which the mean is calculated per observation
  
  # Group the data.frame by subject and activity
  # and perform the mean on each observation of the grouping
  
  tidy.set <- suppressWarnings(aggregate(large.dataset, 
                        by = list(subject = large.dataset$subject.code,
                                  activity = large.dataset$activity.desc),
                        FUN = mean))
  
  ## order the tidy.set so that the each subject and activity are displayed together.
  
  tidy.set <- tidy.set[order(tidy.set$subject, tidy.set$activity), ]
  
  ## remove unwanted columns
  tidy.set$activity.code <- NULL
  tidy.set$subject.code <- NULL
  tidy.set$activity.desc <- NULL
  
  tidy.set
}


large.dataset <- get.large.dataset()
tidy.dataset <- get.tidy.data.set(large.dataset)
write.table(tidy.dataset, file = "tidyData.txt", row.names = FALSE)

