# Codebook for project

## Reading Raw Dataset

The function run\_analysis() reads the raw data and creates the following data frames:
+ activity\_labels: This data frame maps the numeric activity values to descriptive names. (File Read: UCI HAR Dataset/activity\_lables.txt)
+ feature\_info: This data frame saves the mapping of features to their names. (File Read: UCI HAR Dataset/features.txt)
+ x\_train: This data frame saves the observations of all the training subjects for all features. (File Read: UCI HAR Dataset/train/X\_train.txt)
+ y\_train: This data frame saves the activity corresponding to each observation in the x\_train dataframe. (File Read:UCI HAR Dataset/train/y\_train.txt)
+ sub\_train: This data frame saves the subjects corresponding that performed the activity corresponding to the x\_train and y\_train datasets. (File Read: UCI HAR Dataset/subject\_train.txt)
+ x\_test: This data frame saves the observations of all the test subjects for all features. (File Read: UCI HAR Dataset/test/X\_test.txt)
+ y\_test: This data frame saves the activity corresponding to each observation in the x\_test dataframe. (File Read:UCI HAR Dataset/test/y\_test.txt)
+ sub\_test: This data frame saves the subjects corresponding that performed the activity corresponding to the x\_test and y\_test datasets. (File Read: UCI HAR Dataset/subject\_test.txt)

## Creating a data frame

The function **create\_data\_frame()** handles creating a dataframe from the x\_\*, y\_\* and sub\_\* datasets. Both the training and test data frames are created by this function.

Its inputs are: 
1. x: Data frame with all the feauture observations for each activity and subject (e.g. x\_train)
2. y: Data frame with all the activities corresponding to the observations (e.g. y\_train)
3. subject: Data frame with the subjects that performed the activities. (e.g. sub\_train)
4. activity\_lvl: activity\_lablel data frame
5. features: feature\_info data frame



