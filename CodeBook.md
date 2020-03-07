# Code Book
The Code Book describes the variables, the data, and transformations that have been performed to clean up the data 

## Modifications

The original data sets was modified by:

1. Merging the training and the test sets to create one data set 
2. Extracting only the measurements on the mean and standard deviation for each measurement
3. Using descriptive activity names to label the activities in the data set
4. Constructing appropriate labels for the data set with descriptive variable names
5. Creating a second, independent tidy data set (from step 4) with the average of each variable for each activity and each subject


## Information on used Files

These files were used from the initial dataset and contain the folling information:

1. features.txt - descriptions for features measured
2. train/X_train.txt - measurements of the features in train set
3. test/X_test.txt - measurements of the features in test set
4. train/subject_train.txt - the subject for each measurement from the train set
5. test/subject_test.txt - the subject for each measurement from the test set
6. train/y_train.txt - activity for each measurement from the train set - from 1 - 6
7. test/y_test.txt - activity for each measurement from the test set - from 1 - 6


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
* Merge_Train: merges the training data sets using rbind()
* Merge_Test: merges the test data sets using rbind()
* MergeTrainTest: merges Merge_Train and Merge_Test
* New_mean_std: extracts only the Mean and the Standard Deviation from the MergeTrainTest dataset 
* WithActivityNames: labels the activities in the New_mean_std 
* TidyData2: contains the relevant averages for the Mean and Standard Deviation for each subject and activity which will be later output in TidyData2.txt 

## Modifcations to the Descriptive Variable Names

Some of the original varibale names have been modified to be more descriptive. 

* Acc, Gyro, Mag, Freq, f, mean, std, t, tBody, gravity, BodyBody and angle were replaced with Accelerometer, Gyroscope, Magnitude, Frequency, Frequency, Mean, STD, Time, TimeBody Gravity, Body and Angle respectively.
