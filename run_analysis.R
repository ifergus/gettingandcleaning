
## 
## Create a large dataset by combining both the taining and the test measurements
## From the large data set, create and save an independent tidy data set with
## the average of each variable for each activity and each subject.

get.measurement.types <- function() {
  
  ## read in the measurement/column descriptions and retun a dataframe
  
  read.table("features.txt", stringsAsFactors = FALSE,
             col.names = c("measurement.column.num", "measurement.desc"),
             header = FALSE) 
}



get.measurement.column.nums <- function (measurement.names) {
  
  ## Create a vector containing the column numbers for those meansurements that 
  ## contain mean or standard deviation measurements.
  
  c(grep("mean", measurement.names$measurement.desc),
    grep("std",  measurement.names$measurement.desc))
}


get.descriptive.measurement.names <- function(raw.measurement.names) {
  
  ## creates a vector of descriptive measurements names from the original
  ## measurement/feature
  ## The column name is converted to camel case by removing parenthesis and hyphens
  ## mean and std are capitalized
  ##
  ## given the activity fBodyAccJerk-mean()-Z, fBodyAccJerkMeanZ is returned.
  
  descriprive.names <- sub("std", "Std", raw.measurement.names)
  descriprive.names <- sub("mean", "Mean", descriprive.names)
  descriprive.names <- sub("\\(\\)" , "", descriprive.names)
  descriprive.names <- sub("-", "", descriprive.names)
  descriprive.names <- sub("-", "", descriprive.names)
  
  descriprive.names
}



get.activity.types <- function() {
  
  ## read in the activity types and return a dataframe
  
  read.table("activity_labels.txt",
            col.names = c("activity.code", "activity.desc"),
            stringsAsFactors = FALSE,
            header = FALSE)
}


get.data.set <- function (measurement.table.name,
                          activity.code.table.name,
                          subject.table.name,
                          original.measurement.desc,
                          cols) {
  
    ## Only read in those measurements for those columns that contain
    ## mean or standard deviation measurements
  
    measurements <- read.table(measurement.table.name,
                              colClasses = "numeric",
                              stringsAsFactors = FALSE,
                              header = FALSE) [ ,cols]
   
    
    ## update column headings for each varibles with a descriptive name
    colnames(measurements) <- get.descriptive.measurement.names (
                                    original.measurement.desc [cols])
    
    
    ## add the subject to the table by adding a new column
    subjects <- read.table(subject.table.name,
                           colClasses = "integer",
                           col.names = "subject.code",
                           stringsAsFactors = FALSE,
                           header = FALSE)
    
    measurements <- data.frame(subject.code = subjects$subject.code, measurements)
  
    ## read in the activity codes for the measurements and add them to the dataset by adding a new column
    
    activity.codes <- read.table(activity.code.table.name,
                                 colClasses = "integer",
                                 col.names = "activity.code",
                                 stringsAsFactors = FALSE,
                                 header = FALSE)
    
    measurements <- data.frame(activity.code = activity.codes$activity.code, measurements)
    
    ## add the activity description to the dataset by merging the measurements with
    ## the activity types
    
    measurements <- merge(measurements,
                               get.activity.types(),
                               by.x = "activity.code",
                               by.y = "activity.code",
                               x.all = TRUE)
    measurements
}


measurement.types <- get.measurement.types()
mean.avg.column.numbers <- get.measurement.column.nums(measurement.types) 

test <- get.data.set("./test/X_test.txt", "./test/y_test.txt", "./test/subject_test.txt", 
                     measurement.types$measurement.desc, mean.avg.column.numbers)

train <- get.data.set("./train/X_train.txt", "./train/y_train.txt", "./train/subject_train.txt",
                      measurement.types$measurement.desc, mean.avg.column.numbers)

## merge the test and training dataset to create a large dataset.
test.and.training <- merge(test, train, all=TRUE)


## prepare tidy data by grouping the data based on the subject and activity
## and perform the mean on each grouped observation


tidy.set <- aggregate(test.and.training, 
                      by=list(subject = test.and.training$subject.code,
                              activity = test.and.training$activity.desc),
                      FUN=mean)

## order the tidy.set so that the each subject is activities are diaplayed together.

tidy.set <- tidy.set[order(tidy.set$subject, tidy.set$activity), ]

## remove unwanted columns
tidy.set$activity.code <- NULL
tidy.set$subject.code <- NULL
tidy.set$activity.desc <- NULL

## write the tidy data
write.table(tidy.set, file = "tidyData.txt", row.names = FALSE)



