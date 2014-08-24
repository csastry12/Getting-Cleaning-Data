Getting-Cleaning-Data
=====================

Getting and cleaning data coursera course project

Human Activity Recognition Based on Accelerometer Data from Smartphone

============================================================
Chellury Ram Sastry
==============================================================
The purpose of this project is to demonstrate the ability to generate clean and tidy data set. The goal is to prepare tidy data that can be used for later analysis.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The run_analysis.R script reads data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" and produces a new - tidy - dataset which may be used for further analysis.

The following data files were downloaded from the above link
=======================================================
- 'features.txt': Predictor variables (column names).

- 'activity_labels.txt': Human readable descritions of various subject activities.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': outcome variables.

- 'train/subject_train.txt': ID's of subjects in the training data

- 'test/X_test.txt': Test set.

- 'test/y_test.txt':outcome variables.

- 'test/subject_test.txt': ID's of subjects in the test data


Code Highlights
==================================
The entire code for this project is presented in run_analysis.R.

Due to lack of time, I am not presenting all the highlights, but run_analysis.R has all the 
comments explaining almost every line of the code.


Acknowledgements:
=================
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


License:
========
Use of the Run_Analysis.R script is free for all users as they see fit.

