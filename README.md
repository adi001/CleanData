CleanData
=========

###Introduction

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here is the complete dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


###Running the script
1. Clone this repository
2. Download the dataset from the link above and unzip it in the same directory.
  1. A subdirectory called ```UCI HAR Dataset``` is where the data will reside.
3. If you don't already have the ```reshape2``` package installed, install it.
4. Run the script, ```run_analysis.R``` . This is a single script that does the following:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. This tidy dataset is saved as ```HAR_Tidy.txt```
5. The script is also annotated with code comments at each step for readability.
6. The code book contains information about variables in the data set.
  
