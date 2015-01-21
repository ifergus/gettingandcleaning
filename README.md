
READ ME

This repository contains a solution that demonstrate how to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.



### Files
1. README.md  - This readme file
2. run_analysis.R  - R source code file that perform the  
3. CodeBook.md
   

### Approach

A review of the source file (run_analysis.R) conveys the approach towards addressing the requirements of the project assignment.

Several functions are defined that 

* `get.measurement.types` - reads in the types of measurements from `features.txt`

* `get.measurement.columns.num` - takes as input the measurement type names and returns a vector with only the column numbers for those measurements that contain the text 'mean' or 'std'.  This vector is used to limit the variables read in to only those containing 'mean' or 'std'

* `get.descriptive.measurement.names` - This function takes a measurement/variable name and converts it to a descriptive variable name. For a given feature/measurement name, a new name is created by converted the existing description to camel case by (1) removing parenthesis, (2) removing hyphens and (3) converting 'std' and 'mean' to up-low case.  So given the activity fBodyAccJerk-mean()-Z, fBodyAccJerkMeanZ is returned.

* `get.activity.types` - reads in the descriptive activity text and returns a data-frame containing activity descriptions and codes from `activity_labels.txt`

* `get.data.set` - This function reads in the trail or test data based on the specified parameter.  Additionally it:
-- reads in corresponding activity codes and add them to the data-frame
-- adds the descriptive activity names to the data-frame
-- read in and adds the subject to the data-frame



Solution Steps:
 
* read in the measurement type by calling `get.measurement.types`
* create a vector `mean.avg.column.numbers` by calling `get.measurement.column.nums(measurement.types)` to get only those column number that contain the text 'std' and 'mean'
* call get.data.set for both `test` and `train` measurements.  The returned data-frame is only contains those variables that contain the text `mean` or `std`.  Also, the descriptive activity text, descriptive variable heading and the subject are added to the data frame.
* The train and text data-frames are combined for form a large data-frame, test.and.training.
* The aggregate function is used to create a tidy dataset that grouped by the variables `subject` and `activity.desc`



