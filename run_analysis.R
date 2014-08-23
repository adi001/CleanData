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

##Objective #3: Use descriptive activity names
activityLbl <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
dfAllMeanStddev <- cbind(activityLbl[dfAllMeanStddev[,2]],dfAllMeanStddev)
names(dfAllMeanStddev)[1] <- "ActivityName"

##Objective #4: Clean up variable names
names(dfAllMeanStddev) <- gsub("mean\\(\\)","Mean",names(dfAllMeanStddev))
names(dfAllMeanStddev) <- gsub("std\\(\\)","StdDev",names(dfAllMeanStddev))
names(dfAllMeanStddev) <- gsub("meanFreq\\(\\)","MeanFreq",names(dfAllMeanStddev))
names(dfAllMeanStddev) <- gsub("-","",names(dfAllMeanStddev))

##Objective #5: Generate a tidy data set with  average of each variable for each activity and each subject. 
dfTidySet <- melt(dfAllMeanStddev, id.vars=names(dfAllMeanStddev)[1:3], measure.vars=names(dfAllMeanStddev)[4:82])
dfTidySet <- dcast(dfTidySet, SubjectID+ActivityID+ActivityName ~ variable, mean)
write.table(dfTidySet, file="HAR_Tidy.txt", row.names=FALSE)
