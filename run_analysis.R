require(reshape2)


##Reading column headers
dfFeatures <- read.table("UCI HAR Dataset/features.txt")

## Reading Training dataset
dfSubjTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(dfSubjTrain) = "SubjectID"
dfXTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
names(dfXTrain) = dfFeatures[,2]   
dfYTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
names(dfYTrain) = "ActivityID"

## Reading Test dataset
dfSubjTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(dfSubjTest) = "SubjectID"
dfXTest <- read.table("UCI HAR Dataset/test/X_test.txt")
names(dfXTest) = dfFeatures[,2]   
dfYTest <- read.table("UCI HAR Dataset/test/y_test.txt")
names(dfYTest) = "ActivityID" 

## Objective #1: Merge training & test datasets
# First merge training datasets to 1 and do the same for test
# Then merge the two to form the single data set 
dfTrain <- cbind(dfSubjTrain,dfYTrain,dfXTrain)
dfTest <- cbind(dfSubjTest,dfYTest,dfXTest)
dfAll <- rbind(dfTrain,dfTest)

##Objective #2: Extract only mean & standard deviation
headersMeanStddev <- grepl("mean|std", dfFeatures[,2])
##Also include first two columns (Subject ID & Activity ID)
headersMeanStddev <- c(TRUE,TRUE,headersMeanStddev)
dfAllMeanStddev <- dfAll[,headersMeanStddev]



