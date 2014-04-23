run_Analysis <- function() { 
    ## Save directory and zipped file names
    directory <- "UCI HAR Dataset"
    fileName <- "getdata-projectfiles-UCI HAR Dataset.zip"
    
    ## Check if files are unzipped already. if so, don't unzip them again
    if (!file.exists(paste(directory, "README.txt", sep="/"))) {
        print("Unzipped files don't Exist. Unzipping file..")
        unzip(fileName)
    }
    else {
        print("Files exist..")
    }
    ## Read activity labels from data
    activity_labels <- read.table(file = paste(directory, "activity_labels.txt", sep="/"))
    
    ## Read x_train,y_train and subject data
    x_train <- read.table(file = paste(directory, "train", "X_train.txt", sep="/"))
    y_train <- read.table(file = paste(directory, "train", "Y_train.txt", sep="/"))
    sub_train <- read.table(file = paste(directory, "train", "subject_train.txt", sep="/"))    
    
}

## Function to create data frame
create_data_frame <- function(x,y,subject,activity_lvl) {
    df <- data.frame(subject)
    df <- cbind(df,y)
    names(df) <- c("Subject_Id", "Activity")
    df$Activity <- as.factor(df$Activity)
    levels(df$Activity) <- activity_lvl[,2]
    #df <- cbind(df,x)
    df
}
