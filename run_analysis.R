setwd("C:\\Ram\\Coursera\\Data Cleaning\\Project")

# First read in features and find out names of columns, the types, and first few observations 

features = read.table('UCI HAR Dataset\\features.txt')
dim(features)
names(features)
str(features)
head(features)

# Question 1 (and Question 5: see below). Merge train and test data sets 
# To merge test and training sets, read the test and train data and examine their preliminary
# attributes

trainX = read.table('UCI HAR Dataset\\train\\X_train.txt')
str(trainX)
dim(trainX)
head(trainX)

trainY = read.table('UCI HAR Dataset\\train\\Y_train.txt')
str(trainY)
head(trainY)
dim(trainY)

# Examine subject_train.txt

subjectsTrain = read.table('UCI HAR Dataset\\train\\subject_train.txt')
names(subjectsTrain)
str(subjectsTrain)
head(subjectsTrain)
dim(subjectsTrain)
    
# From the above exploration, we note that the row length of TrainX, TrainY, and 
# subjectsT equal 7352 and match. Furthermore, trainX has 561 features which is the 
# same as row length of features (names of features)

# We repeat the above exploration for the test data set

testX = read.table('UCI HAR Dataset\\test\\X_test.txt')
str(testX)
dim(testX)
head(testX)

testY = read.table('UCI HAR Dataset\\test\\Y_test.txt')
str(testY)
head(testY)
dim(testY)

subjectsTest = read.table('UCI HAR Dataset\\test\\subject_test.txt')
names(subjectsTest)
str(subjectsTest)
head(subjectsTest)
dim(subjectsTest)

# From the above exploration, we note that the row length of testX, testY, and 
# subjectsTest equal 2947 and match. Furthermore, testX has 561 features which is the 
# same as row length of features (names of features)

# Now to merge train and test data sets, we first set the column names (predictor variables) 
# in both trainX and testX to those in features. This effectively answers part of 
# question 5 (Appropriately labels the data set with descriptive variable names)

names(trainX) <- features$V2
names(testX) <- features$V2

# Now both trainX and testX data sets do not contain the outcome variables. Include them

trainX$outcome <- trainY$V1
testX$outcome <- testY$V1

# Introduce subject variable in both train and test data sets

trainX$subject <- subjectsTrain$V1
testX$subject <- subjectsTest$V1

# Now all that needs to be done is bind the rows of testX with those of trainX

ActivityRecognitionDataSet <- rbind(trainX, testX)

# Question 2. 

# Need R's regular expression and pattern matching functions 
# "grep" to extract which columns contain strings of the form "-mean()" and "-std()"

meanColIdx <- grep("-mean",names(ActivityRecognitionDataSet),ignore.case=TRUE)
stdColIdx <- grep("-std",names(ActivityRecognitionDataSet),ignore.case=TRUE)

# Keep outcome and subject

outcomeColIdx <- grep("outcome",names(ActivityRecognitionDataSet),ignore.case=TRUE)
subjectColIdx <- grep("subject",names(ActivityRecognitionDataSet),ignore.case=TRUE)
  
Mean_STD_Measurements <- ActivityRecognitionDataSet[, c(meanColIdx, stdColIdx, 
                                                        outcomeColIdx, subjectColIdx)]

# Question 3

# Need to extract activity names, and re-name the outcome variables (which are integers
# from 1 through 6) 

activityNames <- read.table('UCI HAR Dataset\\activity_labels.txt')

Mean_STD_Measurements <- transform(Mean_STD_Measurements, outcome = 
                                          factor(outcome, levels=c(1,2,3,4,5,6),
                                                 labels = activityNames$V2))

# Question 4: Appropriately labels the data set with descriptive variable names. 

# In question #1, we set column names to descriptive values from features. In question 3 
# above, we also re-named outcome. I am not sure what else to do in this question

# Question 5: Creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject. 

# Load the reshape2 library to use dcast (from class lectures, week 3). Ran out of time
# but could not get this dcast to work. I  get the error: Using subject as value column: 
# use value.var to override. Error in eval(expr, envir, enclos) : object 'variable' 
# not found

library(reshape2)

Independent_Tidy_Data_Set <- dcast(Mean_STD_Measurements, subject + outcome ~ variable, mean)

write.table(Independent_Tidy_Data_Set,"./Independent_Tidy_Data_Set.txt")
