CleanData
=========

###Introduction

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here is the complete dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


###What the script does
The main script is ```run_analyis.R``` This is a single script that does the following:
1. Merges the training and the test sets to create one data set.
  1. The three training sets are merged first (column-binding) - subject_train.txt, X_train.txt & y_train.txt
  2. The three test sets are then merged (column-binding) - subject_test.txt, X_test.txt & y_test.txt
  3. The above two sets are finally merged (row-binding)
2. Extracts only the measurements on the mean and standard deviation for each measurement.
  1. Column names that contain the word 'mean' and 'std' are extracted into a new data table.
3. Uses descriptive activity names to name the activities in the data set
  1. The activity names are merged from the label activity_labels.txt against the index of Activity ID
4. Appropriately labels the data set with descriptive variable names. 
  1. In the labels, mean(), std() and meanFreq() are replaced with capitalized forms of the word and the parantheses (brackets) are dropped.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  1. The data set generated in step #2 is melted based on the following:
    1. IDs: Subject ID, Activity ID & Activity Name
    2. Measures: The rest of the columns
  2. The data table is then rolled up using dcast to generate the means for each variable measure.


###Running the script
1. Clone this repository
2. Download the dataset from the link above and unzip it in the same directory.
  1. A subdirectory called ```UCI HAR Dataset``` is where the data will reside.
3. If you don't already have the ```reshape2``` package installed, install it.
4. Run the script, ```run_analysis.R```.
5. A tidy dataset is generated. and saved as ```HAR_Tidy.txt```
6. The script is also annotated with code comments at each step for readability.
7. The code book contains information about variables in the data set.
  
