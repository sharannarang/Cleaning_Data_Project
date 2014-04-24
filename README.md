# README for Getting and Cleaning Data - Coursera Class project

## Files and organization

The project contains three files:

+ run\_analysis.R: R code that performs cleans the data to generate a tidy data set.
+ README.md: File to explain how-to-use the R code.
+ Codebook.md: Explains the operations performed on the data and the various data frames that are created.

The files are organized as follows:

+ run\_analysis.R: Present in the main/ directory.
+ README.md: Present in the root directory.
+ Codebook.md: Present in the main/ directory.


## Requirements:

run\_analysis.R has the following requirements:

1. The raw data set (getdata-projectfiles-UCI HAR Dataset.zip) should be downloaded and saved in the main/ directory. The raw data can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. The run\_analysis.R script requires the reshape2 package to be installed in RStudio.

## Using the script:

run\_analysis.R defines the run\_analysis() function. This function **does not take** any arguements. It only assumes the presence of a zipped raw dataset in the same folder.

The script can be run by calling the function from the R console as follows:

```
run_analysis()
```

## Outputs produced by the script:

1. The code produces several print statements to indicate the progress of the function.
2. A folder called "working" is created in the existing directory. It contains:
    + A final tidy dataset titled tidy\_data.txt. Please refer Codebook.md for details regarding the tidy dataset.
    + A folder titled "UCI HAR Dataset" containing the unzipped raw dataset.
3. The tidy data frame (named average\_values\_df in the script) is also returned by the function. 
