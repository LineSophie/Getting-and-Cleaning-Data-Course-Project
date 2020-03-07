# Getting-and-Cleaning-Data-Course-Project

This is the Assignment for the "Getting and Cleaning Data" Coursera course. My R script, called run_analysis.R, executes the following:

1. Downloads and unzips the source data and creates new directors if the named one doesn't exist
2. Reads all the neccessary data sets (Test, Training, Activity Labels, etc.)
3. Labels the approproiate columns for the Datasets (e.g. SubjectId to indicate the subjects)
4. Merges the Test and the Training sets to create one data set
4. Extract only the mean and standard deviation for each measurement
5. Places descriptive activity names to for the activities in the data set
6. Appropriately labels the data set with descriptive variable names
7. Creates a second, independent tidy set with the mean of each variable for each activity and each subject
8. Wirtes the second, tidy data set as a text file, labelled TidyData2.txt


