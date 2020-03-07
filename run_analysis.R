## Step 0: Preparing Data (download, unzip)
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

## Step 1: Merging the Training and the Test sets to create one data set
## Step 1.1: Reading Files: train
activity_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
features_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

## Step 1.2: Reading Files: test
activity_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
features_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

## Step 1.3 Reading Features Vector
Features <- read.table("./data/UCI HAR Dataset/features.txt")

## Step 1.4 Reading Activity Labels
ActivityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", as.is= FALSE)

## Naming Columns
colnames(activity_train) <- Features[,2]
colnames(features_train) <- "ActivityId"
colnames(subject_train) <- "SubjectId"

colnames(activity_test) <- Features[,2] 
colnames(features_test) <- "ActivityId"
colnames(subject_test) <- "SubjectId"

colnames(ActivityLabels) <- c('ActivityId','ActivityType')

## Step 1.6: Merging Data
Merge_Train <- cbind(activity_train, features_train, subject_train)
Merge_Test <- cbind(activity_test, features_test, subject_test)
MergeTrainTest <- rbind(Merge_Test, Merge_Train)

## Step 2: Extract the Measurements on Mean and Standard Deviation for each Measurement
## Step 2.1: reading Column names
ColNames <- colnames(MergeTrainTest)

## Step 2.1:  Create Vector for identifying ID, mean and std
ColumnsWithMeanStd <- grepl("mean|std|ActivityId|SubjectId", ColNames) 

## Step 2.2: Create Subset 
New_mean_std <- MergeTrainTest[ ,ColumnsWithMeanStd ==TRUE]
                         
## Step 3: Adding Descriptive Activity Names

WithActivityNames <- merge(New_mean_std, ActivityLabels,
                              by= 'ActivityId',
                              all.x=TRUE)


## Step 4: Appropriately labelling the data set with descriptive variable names
names(WithActivityNames) <-gsub("Acc", "Accelerometer", names(WithActivityNames) )
names(WithActivityNames)<-gsub("Gyro", "Gyroscope", names(WithActivityNames) )
names(WithActivityNames)<-gsub("BodyBody", "Body", names(WithActivityNames) )
names(WithActivityNames)<-gsub("Mag", "Magnitude", names(WithActivityNames) )
names(WithActivityNames)<-gsub("^t", "Time", names(WithActivityNames) )
names(WithActivityNames)<-gsub("^f", "Frequency", names(WithActivityNames) )
names(WithActivityNames)<-gsub("tBody", "TimeBody", names(WithActivityNames) )
names(WithActivityNames)<-gsub("-mean()", "Mean", names(WithActivityNames), ignore.case = TRUE)
names(WithActivityNames)<-gsub("std()", "STD", names(WithActivityNames), ignore.case = TRUE)
names(WithActivityNames)<-gsub("-freq()", "Frequency", names(WithActivityNames), ignore.case = TRUE)
names(WithActivityNames)<-gsub("Freq()", "Frequency", names(WithActivityNames), ignore.case = TRUE)
names(WithActivityNames)<-gsub("angle", "Angle", names(WithActivityNames) )
names(WithActivityNames)<-gsub("gravity", "Gravity", names(WithActivityNames) )


##Step 5: Second, independent tidy data set with the average of each variable for each activity and each subject
##Step 5.1: 
TidyData2<- WithActivityNames %>%
  group_by(SubjectId, ActivityId) %>%
  summarise_all()



##Step 5.2: Write data as Textfile 
write.table(TidyData2, "TidyData2.txt", row.name=FALSE)

