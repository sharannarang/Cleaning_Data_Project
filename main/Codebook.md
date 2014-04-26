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

1. x: Data frame with all the feauture observations for each activity and subject
2. y: Data frame with all the activities corresponding to the observations 
3. subject: Data frame with the subjects that performed the activities. 
4. activity\_lvl: activity\_lablel data frame
5. features: feature\_info data frame contain feature names

Example Usage:
``
create_data_frame(x_train,y_train,sub_train,activity_labels,feature_info)
``

The function performs the following steps:

1. Creates a new data frame (df) with one column from the subject data
2. Column binds the y and x dataframes to the new data frame
3. Assigns descriptive names to the columns. The first two columns have the names "subject" and "activity". The rest of the column names are obtained from the feature dataframe.
4. Converts the values in activity columns to factors. Assign descriptive labels to these factors from the activity\_lvl dataframe.

The function returns this new dataframe (df)

## Merging training and test datasets

The raw data from test and training datasets are provided as inputs to the create\_data\_frame() function which creates two new dataframes: test\_df and train\_df. These tidy dataframes are then merged (using rbind) to create a merged dataframe (merge\_df) containing the training and test data with descriptive column names and descriptive activity labels.

## Extracting the mean and standard deviation values

The raw dataset indicates that the mean and standard deviation estimates are saved as:

>mean(): Mean value
>
>std(): Standard deviation

Any column name in the merged dataframe containing the 'mean()' or 'std()' is extracted using the grep function. This is used to extract the columns from the merged data frame in addition to the first two columns. A new dataframe with mean and standard deviation values is created titled 'mean\_std\_df'.

## Computing average value of each variable

In order to compute the average, the dataframe(mean\_std\_df) is melted with activity & subject as the id variables. The rest of the columns are measurement variables. A new dataframe titled 'molten\_mean\_std\_df' is created.

This molten dataframe is then past to the dcast function to compute the mean for each variable based on subject and activity. The final tidy dataframe is result of this operation titled "average\_values\_df".

## Final Tidy data

The tidy dataframe (average\_values\_df) is written to a text file ("tidy\_data.txt") in the working directory. It is also returned by the function. 

The tidy dataframe contains 180 observations of 68 columns. The first column is the activity column which is a factor of 6 activities. The second column is the subject column. The rest of the columns are the averages of the mean and standard deviation estimates per subject and activity. 
