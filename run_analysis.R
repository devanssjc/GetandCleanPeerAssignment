# Get and Clean Peer Assignment (Assessment)

# See README.md file for summary of each STEP performed in this file, and for more explanatory information
# See CodeBook.md

# STEP I - Copy and unzip the source files to the current working directory (local clone of the repository)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zfile <- "Dataset.zip"
if (!file.exists(zfile)) { # skip downloading if the file already exists
    print("file did not exist")
    download.file(url, zfile, method = "curl")
    unzip(zfile)
}

# STEP II - Read selected files from the local directory into data frames for processing
rt <- "UCI HAR Dataset/"    # This is the root of the unzipped file directory (needed for reading data)
f0 <- "README.txt"          # Source file, README file from study authors. Not used for data in this code.
f1 <- "features_info.txt"   # Source file, information about the variables used. Not used for data in this code.
f2 <- "features.txt"        # List of all features. Used for data in this code.
f3 <- "activity_labels.txt" # Links the class labels with their activity name. Used for data in this code. 

df.f2 <- read.delim(paste(rt, f2, sep = ""), sep = " ", header = FALSE, as.is = TRUE)
df.f3 <- read.delim(paste(rt, f3, sep = ""), sep = " ", header = FALSE, as.is = TRUE)

# STEP III  -  Prepare column titles from features data by removing parenthesis and replacing dashes with underscores
df.f2$V2 <- sub("[(]", "", df.f2$V2)
df.f2$V2 <- sub("[(]", "", df.f2$V2)
df.f2$V2 <- sub("[)]", "", df.f2$V2)
df.f2$V2 <- sub("[)]", "", df.f2$V2)
df.f2$V2 <- sub("[-]", "_", df.f2$V2)
df.f2$V2 <- sub("[-]", "_", df.f2$V2)

# STEP IV   -  Read remaining selected files from local directory into data frames for processing (actual data)
# 'train' subdirectory:
tr_dat <- "train/X_train.txt"       # Training set.
tr_lab <- "train/y_train.txt"       # Training labels.
tr_sub <- "train/subject_train.txt" # Training Subject IDs 

df.tr_dat <- read.table(paste(rt, tr_dat, sep = ""), header = FALSE)
df.tr_lab <- read.delim(paste(rt, tr_lab, sep = ""), sep = " ", header = FALSE)
df.tr_sub <- read.delim(paste(rt, tr_sub, sep = ""), sep = " ", header = FALSE)

# 'test' subdirectory:
ts_dat <- "test/X_test.txt"       # Test set.
ts_lab <- "test/y_test.txt"       # Test labels.
ts_sub <- "test/subject_test.txt" # Test Subject IDs 

df.ts_dat <- read.table(paste(rt, ts_dat, sep = ""), header = FALSE)
df.ts_lab <- read.delim(paste(rt, ts_lab, sep = ""), sep = " ", header = FALSE)
df.ts_sub <- read.delim(paste(rt, ts_sub, sep = ""), sep = " ", header = FALSE)

# STEP V - Add subject identifiers and activity columns to the training and test datasets, tiding up column names
# train dataset names is first, endoding the dataset type = 'train' in the column called 'dataset'
df.tr_id <- df.tr_sub
df.tr_id[,1] <- paste("train", df.tr_sub[,1])
df.tr_dat <- cbind(df.tr_id, df.tr_sub, df.f3$V2[df.tr_lab$V1], "train", df.tr_dat)
names(df.tr_dat) <- c("subid", "subject", "activity", "dataset", df.f2$V2)

# test dataset names are second, endoding the dataset type = 'test' in the column called 'dataset'
df.ts_id <- df.ts_sub
df.ts_id[,1] <- paste("test", df.ts_sub[,1])
df.ts_dat <- cbind(df.ts_id, df.ts_sub, df.f3$V2[df.ts_lab$V1], "test", df.ts_dat)
names(df.ts_dat) <- c("subid", "subject", "activity", "dataset", df.f2$V2)

# STEP VI - Strip columns not containing the new columns, or names with 'mean' or 'std'
# train dataset firest
red_tr_dat <- df.tr_dat[,   grepl("subid", names(df.tr_dat))      |
                            grepl("subject", names(df.tr_dat))    |
                            grepl("activity", names(df.tr_dat))   |
                            grepl("dataset", names(df.tr_dat))    |
                            grepl("mean", names(df.tr_dat))       |
                            grepl("std", names(df.tr_dat))] 
# test dataset second
red_ts_dat <- df.ts_dat[,   grepl("subid", names(df.ts_dat))      |
                            grepl("subject", names(df.ts_dat))    |
                            grepl("activity", names(df.ts_dat))   |
                            grepl("dataset", names(df.ts_dat))    |
                            grepl("mean", names(df.ts_dat))       |
                            grepl("std", names(df.ts_dat))] 

# STEP VII - Merge the training and test datasets and make minor adjustments to column classes
red_all_dat <- merge(red_tr_dat, red_ts_dat, all = TRUE)
red_all_dat$subid <- factor(red_all_dat$subid) # change to a factor column type
red_all_dat$subject <- as.integer(red_all_dat$subject) # change to an integer column type


# STEP VIII - Create a new empty data set, mirroring the structure of the data set in STEP VI
mean_dat <- red_all_dat[1,]

# STEP IX - Update the features column names to reflect that this data set contains computed mean of subsets of data
names(mean_dat) <- c("subid", "subject", "activity", "dataset", paste("mean_", names(red_all_dat[,5:length(names(red_all_dat))]), sep = ""))

# STEP X    -  Populate the new dataset (subset 30 subjects x 6 activities), computing the mean of each column and subset
tot_col_count <- length(names(red_all_dat))
row_matrix <- matrix (nrow = (tot_col_count - 4)) # temporary vector for capturing the row of means computed for each column
mean_row_count <- 1
# Loop through each subject id and activity and compute the mean of for each feature (columns 5 and up)
for (subi in unique(red_all_dat$subid)) {
    for (act in unique(red_all_dat$activity)) {
        # this line of code does most of the work.
        row_matrix <- sapply(red_all_dat[    (red_all_dat$subid == subi) & 
                                                 (red_all_dat$activity == act) , names(red_all_dat[,5:length(names(red_all_dat))])], mean)
        # these lines of code get the row data into the new dataframe (incrementing through mean_row_count for each row added)
        mean_dat[mean_row_count, 1] <- subi
        if (length(grep("test ", subi) == 0)) {
            subj <- sub("test ", "", subi)
            mean_dat[mean_row_count, 2] <- subj
            mean_dat[mean_row_count, 4] <- "test"
        }
        else {
            subj <- sub("train ", "", subi)
            mean_dat[mean_row_count, 2] <- subj
            mean_dat[mean_row_count, 4] <- "train"
        }
        mean_dat[mean_row_count, 3] <- act            
        # This is what populates each row of the new data frame mean_dat
        mean_dat[mean_row_count, 5:length(names(red_all_dat))] <- row_matrix 
        mean_row_count <- mean_row_count + 1
    }                                                             
}
# This last line of code changes the subject column class to integer, mostly just to match the tidy dataset
mean_dat$subject <- as.integer(mean_dat$subject)

# STEP XI   -  Output the new dataset to a file
outfile2 <- "mean_act.txt"
write.table(mean_dat, file = outfile2, row.name=FALSE)

# Read the data back into another data frame for posterity. Not needed by the assignment
test_read <- read.table(outfile2, header = TRUE) 
