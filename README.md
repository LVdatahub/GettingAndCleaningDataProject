GettingAndCleaningDataProject
=============================

repository for a project for a Getting And Cleaning Data class

Training data set: train/X_train.txt
Test data set: test/X_test.txt
Features/columns names: features.txt
Activity data for the training group: train/y_train.txt
Activity data for the test group: test/y_test.txt
Subject identifieres for the training group: train/subject_train.txt
Subject identifiers for the test group: test/subject_test.txt

The code 
1.Reads training and test data
2.Merges training and test data
3.Extracts only mean and std from the combined data set 
4.Renames the columns in the merged data set to appropriate names
5.Reads activity and subject data and combines it with the merged training and test data set
6.Renames activity names for clarity purposes
7.Calculates averages for each subject and activity

