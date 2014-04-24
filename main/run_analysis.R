run_analysis <- function() { 
    ## Save directory and zipped file names
    directory <- "working/UCI HAR Dataset"
    fileName <- "working/getdata-projectfiles-UCI HAR Dataset.zip"
    
    require(reshape2)
    
    ## Check if files are unzipped already. if so, don't unzip them again
    if (!file.exists(paste(directory, "README.txt", sep="/"))) {
        print("Unzipped files don't Exist. Unzipping file..")
        unzip(fileName, exdir="working/")
    }
    else {
        print("Files exist..")
    }
    ## Read activity labels from data
    activity_labels <- read.table(file = paste(directory, "activity_labels.txt", sep="/"))
    
    ## Read feature information from data
    feature_info <- read.table(file = paste(directory, "features.txt", sep="/"))
    
    ## Read training dataset
    x_train <- read.table(file = paste(directory, "train", "X_train.txt", sep="/"))
    y_train <- read.table(file = paste(directory, "train", "y_train.txt", sep="/"))
    sub_train <- read.table(file = paste(directory, "train", "subject_train.txt", sep="/"))    
    
    ## Create training data frame
    train_df <- create_data_frame(x_train,y_train,sub_train,activity_labels,feature_info)
    
    print("Created training dataset...")

    ## Read test dataset
    x_test <- read.table(file = paste(directory, "test", "X_test.txt", sep="/"))
    y_test <- read.table(file = paste(directory, "test", "y_test.txt", sep="/"))
    sub_test <- read.table(file = paste(directory, "test", "subject_test.txt", sep="/"))        
    
    ## Create test data frame
    test_df <- create_data_frame(x_test,y_test,sub_test,activity_labels, feature_info)
    
    print("Created test dataset...")
    
    ## Merge the two datasets based on rows
    merge_df <- rbind(test_df,train_df)
    match_string <- "mean\\(\\)|std\\(\\)"
    
    ## Extract the mean and standard deviation from the merged data frame
    mean_std_df <- merge_df[grep(match_string, names(test_df))]
    mean_std_df <- cbind(merge_df[,c(1,2)], mean_std_df)
    
    ## Melt the new data frame based on subject and 
    molten_mean_std_df <- melt(mean_std_df,id.vars=c("activity", "subject"))
    
    ## Cast the data set back computing the mean of the variables
    average_values_df <- dcast(molten_mean_std_df,activity + subject ~ variable, mean)
    
    write.table(average_values_df, file="working/tidy_data.txt")
}

## Function to create data frame
create_data_frame <- function(x,y,subject,activity_lvl, features) {
    ## create new dataset starting with subject information
    df <- data.frame(subject)
    
    ## Add a column for activity
    df <- cbind(df,y)
    
    ## Merge columns from feature dataset
    df <- cbind(df,x)

    ## Add column names for first two columns and features
    names(df) <- c("subject", "activity", as.character(features[,2]))
    
    ## Convert Activity column to a factor and add descriptive levels
    df$activity <- as.factor(df$activity)
    levels(df$activity) <- activity_lvl[,2]
    
    ## Return final data frame
    df
}
