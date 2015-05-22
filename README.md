# REPO - GetandCleanPeerAssignment
Date: Friday, May 22, 2015
Author: Doug Evans

# INTRODUCTION
This repo contains the files needed for satisfying completion of the Coursera "Getting and Cleaning Data" Course Project.
In addition to this "README.md"" file, a "CodeBook.md" file was created, documenting both the cleaned data (file not included)
and the data file "mean_act.txt" required by the project and included. Finally, the R script providing the cleaning and analysis
is included and is names "run_analysis.R". There are 4 files in total inclusive this this file.

More information about the study from which this project effort was based can be found below in the section called:
STUDY DESIGN - MORE BACKGROUND, at the end of this document.
 
# INFO ABOUT THE SOURCE DATA 
 
The input raw data is coming from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Additional information on the raw data can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Note that not all the files coming from the source zip file are needed for this project.
Specifically, the data files containing high resolution inertial data are not needed.
Details about the files thatr are used are documented below and in the run_analysis.R script.

# INSTRUCTIONS FOR CLEANING AND ANALYSIS
Here are the steps that were taken to get and clean the data (make it tidy)
STEP I    -  Copy and unzip the source files to the current working directory (local clone of the repository)
STEP II   -  Read selected files from the local directory into data frames for processing (reference information)
STEP III  -  Prepare column titles from features data by removing parenthesis and replacing dashes with underscores
STEP IV   -  Read remaining selected files from local directory into data frames for processing (actual data)
STEP V    -  Add subject identifiers and activity columns to the training and test datasets, tiding up column names
STEP VI   -  Strip columns not containing 'mean' or 'std' in training and test datasets
STEP VII  -  Merge the training and test datasets and make minor adjustments to column classes

Here are the steps taken to create the second dataset/file and perform the analysis according the to project instructions
STEP VIII -  Create a new empty data set, mirroring the structure of the data set in STEP VI
STEP IX   -  Update the features column names to reflect that this data set contains computed mean of subsets of data
STEP X    -  Populate the new dataset (subset 30 subjects x 6 activities), computing the mean of each column and subset
STEP XI   -  Output the new dataset to a file

Most of these steps are self explanatory, with the following information to consider.

Details on STEPS I and II
There are 8 source files of needed data.

There are two source data files that apply to both train and test datasets:
"features.txt" - this is the measured data names of the training and test datasets (561 named meansurements)
"activity_labels.txt" this activity names (6 total activities)

There are three files each that apply to train and test datasets. 30 subjects had data collected.
The data from the 30 subjects is randomly divided between the two datasets, with 9 subjects going to
test dataset, and 21 subjects going to the train dataset. It appears the idea was that 70% of the subject data would
be used for machine training, and 30% of the subject data would then be used to test the machine learning
algorithm. For our purposes here, we are combining everything into one dataset, but preserving the
identity information, including subject number and dataset type (train or test).

The test dataset files all contain the same number of rows (2947) for each file link together
"test/X_test.txt"- The is the main 'test' dataset (2947 rows by 561 columns of numeric data)
"test/y_test.txt" - This is the test activity labels (numbers 1 through 6), 2947 total rows
"test/subject_test.txt" - This is a unique subject number (2,4,9,10,12,13,18,20,24)

The train dataset files all contain the same number of rows (7352) for each file link together
"train/X_train.txt"- These is the test dataset (7352 rows by 561 columns of numeric data)
"train/y_train.txt" - This is the test activity labels (numbers 1 through 6), 7352 total rows
"train/subject_train.txt" - This is a unique subject number (1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,29,30)

Details on STEP V
Besides creating (and preserving) the subject ID number and the dataset type (train and test) in new columns,
a new column containing a composite of these was created (first column), called subid. This is a unique
identifier that will eventually be used to subset the data for performing the mean calculations of the 
second part of this project (STEPS VII through XI)

Details on STEP XI
The output file is text, has 180 rows (comes from 30 subjects x 6 activities),
and 82 columns. The file is named "mean_act.txt"
This file can be read in as a table using the R command:
test_read <- read.table("mean_act.txt", header = TRUE) 

# STUDY DESIGN - MORE BACKGROUND
The following information is provide as background to the source data and is from the source file
named "README.txt".

===================================================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
===================================================================================================
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Universit�  degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Polit�cnica de Catalunya (BarcelonaTech). Vilanova i la Geltr� (08800), Spain
activityrecognition '@' smartlab.ws 
===================================================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.
- A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: http://www.youtube.com/watch?v=XOEN9W05_4A

For more information about this dataset please contact: activityrecognition '@' smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Other Related Publications:
===========================
[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz.  Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. Journal of Universal Computer Science. Special Issue in Ambient Assisted Living: Home Care.   Volume 19, Issue 9. May 2013

[3] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 4th International Workshop of Ambient Assited Living, IWAAL 2012, Vitoria-Gasteiz, Spain, December 3-5, 2012. Proceedings. Lecture Notes in Computer Science 2012, pp 216-223. 

[4] Jorge Luis Reyes-Ortiz, Alessandro Ghio, Xavier Parra-Llanas, Davide Anguita, Joan Cabestany, Andreu Catal�. Human Activity and Motion Disorder Recognition: Towards Smarter Interactive Cognitive Environments. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.  

==================================================================================================
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita and Xavier Parra. November 2013.
