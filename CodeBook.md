
# CodeBook
Date: Friday, May 22, 2015
Author: Doug Evans

# Two datasets covered by this Codebook
There are two datasets documented in this CoodBook, and they are structured very
similar to each other. The first dataset is named 'red_all_dat', and the other is the file
'mean_act.txt'. Both are created by the 'run_analysis.R' R script in this repository.
Both datasets have the same number of columns. The desciption that follows documents
the similarities and differences of these two datasets.

Column names and headers are implemented in both the dataset and the file.
There are 10299 rows by 83 columns of data 'red_all_dat', and 180 rows
and 83 columns of data in the file 'mean_act.txt

# First 4 columns of both datasets are exactly common:
The following information describes that data contained in the first 4 columns of both 
the dataframe named 'red_all_dat', and the file named 'mean_act.txt' (see 'run_analysis.R in this 
repository for more information:

# Column 1, title and heading name = 'subid'
 Factor w/ 30 levels with these values:                     'test 10', 
                                                            'test 12', 
                                                            'test 13', 
                                                            'test 18', 
                                                            'test 2', 
                                                            'test 20', 
                                                            'test 24', 
                                                            'test 4', 
                                                            'test 9', 
                                                            'train 1', 
                                                            'train 11', 
                                                            'train 14', 
                                                            'train 15', 
                                                            'train 16', 
                                                            'train 17' 
                                                            'train 19', 
                                                            'train 21', 
                                                            'train 22', 
                                                            'train 23', 
                                                            'train 25', 
                                                            'train 26', 
                                                            'train 27', 
                                                            'train 28', 
                                                            'train 29', 
                                                            'train 3', 
                                                            'train 30', 
                                                            'train 5', 
                                                            'train 6', 
                                                            'train 7', 
                                                            'train 8' 

# Column 2, title and heading name = 'subject'
 
 with integer values                                        1 to 30
 
# Column 3, title and heading name = 'activity'
 
 Factor w/ 6 levels and values:                             'WALKING', 
                                                            'WALKING_UPSTAIRS', 
                                                            'WALKING_DOWNSTAIRS', 
                                                            'SITTING', 
                                                            'STANDING', 
                                                            'LAYING',
 
 
# Column 4, title and heading name = 'dataset'
 Factor w/ 2 levels and values:                             'train', 
                                                            'test 
 
# Columns 5 - 83 (numeric data)
 The following columns differ only slightly between the the two datasets.
 For brevity, the columns names are list here once, and the differnce beween them
 is noted as follows. For the red_all_dat dataset, the column name and heading
 are is as shown, except the prefix 'mean_' is removed. For the file "mean_act.txt",
 the file names are correct as shown.

# All columns contain numeric data, and this is the feature data desribed by the
 original study authors. Since this data cleaning exercise is limited to cleaning
 and computing means, no additional detail is provided here regarding this data.
 The file "mean_act.txt" contains a mean computation for each activty and subject,
 totalling 180 columns. The dataset "red_all_dat" contains the raw data from which
 these means were computed.
 
The format is column number followed by the column name (unquoted). For example, the first 
column name is 'mean_tBodyAcc_mean_X'

  5 mean_tBodyAcc_mean_X              

  6 mean_tBodyAcc_mean_Y              

  7 mean_tBodyAcc_mean_Z 

  8 mean_tBodyAcc_std_X 

  9 mean_tBodyAcc_std_Y 

 10 mean_tBodyAcc_std_Z
 
 11 mean_tGravityAcc_mean_X
 
 12 mean_tGravityAcc_mean_Y
 
 13 mean_tGravityAcc_mean_Z
 
 14 mean_tGravityAcc_std_X
 
 15 mean_tGravityAcc_std_Y
 
 16 mean_tGravityAcc_std_Z
 
 17 mean_tBodyAccJerk_mean_X
 
 18 mean_tBodyAccJerk_mean_Y
 
 19 mean_tBodyAccJerk_mean_Z
 
 20 mean_tBodyAccJerk_std_X
 
 21 mean_tBodyAccJerk_std_Y
 
 22 mean_tBodyAccJerk_std_Z
 
 23 mean_tBodyGyro_mean_X
 
 24 mean_tBodyGyro_mean_Y
 
 25 mean_tBodyGyro_mean_Z
 
 26 mean_tBodyGyro_std_X 
 
 27 mean_tBodyGyro_std_Y
 
 28 mean_tBodyGyro_std_Z
 
 29 mean_tBodyGyroJerk_mean_X
 
 30 mean_tBodyGyroJerk_mean_Y
 
 31 mean_tBodyGyroJerk_mean_Z
 
 32 mean_tBodyGyroJerk_std_X
 
 33 mean_tBodyGyroJerk_std_Y
 
 34 mean_tBodyGyroJerk_std_Z
 
 35 mean_tBodyAccMag_mean
 
 36 mean_tBodyAccMag_std
 
 37 mean_tGravityAccMag_mean
 
 38 mean_tGravityAccMag_std
 
 39 mean_tBodyAccJerkMag_mean
 
 40 mean_tBodyAccJerkMag_std
 
 42 mean_tBodyGyroMag_mean
 
 42 mean_tBodyGyroMag_std
 
 43 mean_tBodyGyroJerkMag_mean
 
 44 mean_tBodyGyroJerkMag_std
 
 45 mean_fBodyAcc_mean_X
 
 46 mean_fBodyAcc_mean_Y
 
 47 mean_fBodyAcc_mean_Z
 
 48 mean_fBodyAcc_std_X
 
 49 mean_fBodyAcc_std_Y
 
 50 mean_fBodyAcc_std_Z
 
 51 mean_fBodyAcc_meanFreq_X
 
 52 mean_fBodyAcc_meanFreq_Y
 
 53 mean_fBodyAcc_meanFreq_Z
 
 54 mean_fBodyAccJerk_mean_X
 
 55 mean_fBodyAccJerk_mean_Y
 
 56 mean_fBodyAccJerk_mean_Z
 
 57 mean_fBodyAccJerk_std_X
 
 58 mean_fBodyAccJerk_std_Y
 
 59 mean_fBodyAccJerk_std_Z
 
 60 mean_fBodyAccJerk_meanFreq_X
 
 61 mean_fBodyAccJerk_meanFreq_Y
 
 62 mean_fBodyAccJerk_meanFreq_Z
 
 63 mean_fBodyGyro_mean_X
 
 64 mean_fBodyGyro_mean_Y
 
 65 mean_fBodyGyro_mean_Z
 
 66 mean_fBodyGyro_std_X
 
 67 mean_fBodyGyro_std_Y
 
 68 mean_fBodyGyro_std_Z
 
 69 mean_fBodyGyro_meanFreq_X
 
 70 mean_fBodyGyro_meanFreq_Y
 
 71 mean_fBodyGyro_meanFreq_Z
 
 72 mean_fBodyAccMag_mean
 
 73 mean_fBodyAccMag_std
 
 74 mean_fBodyAccMag_meanFreq
 
 75 mean_fBodyBodyAccJerkMag_mean
 
 76 mean_fBodyBodyAccJerkMag_std
 
 77 mean_fBodyBodyAccJerkMag_meanFreq
 
 78 mean_fBodyBodyGyroMag_mean 
 
 79 mean_fBodyBodyGyroMag_std 
 
 80 mean_fBodyBodyGyroMag_meanFreq 
 
 81 mean_fBodyBodyGyroJerkMag_mean
 
 82 mean_fBodyBodyGyroJerkMag_std
 
 83 mean_fBodyBodyGyroJerkMag_meanFreq
 
