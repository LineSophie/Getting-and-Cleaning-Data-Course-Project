# Getting-and-Cleaning-Data-Course-Project

This is the Assignment for the "Getting and Cleaning Data" Coursera course. My R script, called run_analysis.R, executes the following:

1. Downloads and unzips the source data and creates a new directory if the named one doesn't exist
2. Reads all the neccessary data sets (Test, Training, Activity Labels, etc.)
3. Labels some of the missing columns in the Datasets prior to merging (e.g. SubjectId to indicate the subjects)
4. Merges the Test and the Training sets to create one data set
5. Extracts only the mean and standard deviation for each measurement
6. Places descriptive activity names for the activities in the data set
7. Appropriately labels the data set with descriptive variable names
8. Creates a second, independent tidy set with the mean of each variable for each activity and each subject
9. Wirtes the second, tidy data set as a text file, labelled TidyData2.txt


