
library(dplyr)

# Merges the training and the test sets to create one data set, assigned to df.

testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSet <- read.table("./UCI HAR Dataset/test/x_test.txt")
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSet <- read.table("./UCI HAR Dataset/train/x_train.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)

dfSubject <- rbind(testSubject,trainSubject)
dfLable <- rbind(testLabel,trainLabel)
dfSet <- rbind(testSet,trainSet)
df <- cbind(dfSubject,dfLable,dfSet)
# label all the col with names
colnames(df) <- make.names(c("SubjectID", "Activity", features$V2))

# Extracts all measurements contains "mean" and "std" (case insensitive) 
colsMeanStd <- c("SubjectID", "Activity","[Mm]ean","[Ss]td")
dfMeanStd <- df[,grep(pattern=paste(colsMeanStd,collapse="|"),colnames(df))]

# Uses descriptive activity names to name the activities in the data set
actLab <- read.table("./UCI HAR Dataset/activity_labels.txt")
dfMeanStd$Activity = as.factor(dfMeanStd$Activity)
levels(dfMeanStd$Activity) = actLab$V2

# Labels the data set with descriptive variable names
reName <- function(x, pattern, replace){
  for (i in seq_along(pattern))
    x <- gsub(pattern[i], replace[i], x)
  x
}

abb <- c("Acc","Gyro","Mag","BodyBody")
full <- c("Accelerometer","Gyroscope","Magnitude","Body")
colnames(dfMeanStd) <- reName(colnames(dfMeanStd),abb,full)

# Creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
dfMeanStd <- dfMeanStd %>% group_by(SubjectID, Activity)
cols <- names(dfMeanStd)[-(1:2)]
dots <- sapply(cols, function(x) substitute(mean(x),list(x=as.name(x))))
dfGroup <- do.call(summarise,c(list(.data=dfMeanStd),dots))

# Output as text
write.table(dfGroup, file="projectDF.txt", row.name=FALSE) 
