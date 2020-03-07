# Code Book
The Code Book describes the variables, the data, and transformations that have been performed to clean up the data 

## Modifications

The original data sets was modified by:

1. Merging the training and the test sets to create one data set 
2. Extracting only the measurements on the mean and standard deviation for each measurement
3. Using descriptive activity names to label the activities in the data set
4. Constructing appropriate labels for the data set with descriptive variable names
5. Creating a second, independent tidy data set (from step 4) with the average of each variable for each activity and each subject


## Identifiers

* SubjectId: The Id of the Subject
* ActivityId: The corresponding number to the activity undertaken (e.g. 1 = Walking)
* ActivityType: The Type of Activity undertaken

## Activity Labels 
* WALKING (1): subject was walking during the test
* WALKING_UPSTAIRS (2): subject was walking up a staircase during the test
* WALKING_DOWNSTAIRS (3): subject was walking down a staircase during the test
* SITTING (4): subject was sitting during the test
* STANDING (5): subject was standing during the test
* LAYING (6): subject was laying down during the test

## Variables 
* x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files
* Merge_Train: merges the training data sets using rbind()
* Merge_Test: merges the test data sets using rbind()
* MergeTrainTest: merges Merge_Train and Merge_Test
* New_mean_std: extracts only the Mean and the Standard Deviation from the MergeTrainTest dataset 
* WithActivityNames: labels the activities in the New_mean_std 
* TidyData2: contains the relevant averages for the Mean and Standard Deviation for each subject and activity which will be later output in TidyData2.txt 

