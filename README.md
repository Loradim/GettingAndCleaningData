#
# README - Coursera Course "Getting and Cleaning Data" - Peer Review Assignment
#

Programming Task:
-----------------
The data from the study found at "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
is found in different datafiles across the zip file. We are supposed to bring the training and test data together into
a tidy dataset and remove unnecessary information.

Files in the main directory include:
------------------------------------
* "activity_labels.txt" - a file that matches an activity number to an activity description
* "features.txt" - a file that describes the variable names for variables found in "X_*.txt" files

There are 2 subdirectories:
---------------------------
* "train" - contains training data
* "test" - contains test data to test the modell

Each subdirectory consists of 3 files and another subdirectory with raw data.
We are only looking at the processed data in the first subdirectory.

Files in ./train/ and ./test/:
------------------------------
* "X_[train|test].txt" - contains all measurements for each observation.
                       Labels for each variable is found in "../features.txt"
                       Each observation is from one of 30 test subjects. Per row you find the id
                       of the subject in "subject_[train|test].txt
                       The recorded activity per row is found in "y_[train|test].txt" encoded as a number per row.
                       This number can be translated to a describtive activity with the file "../activity_labels.txt"
* "y_[train|test].txt" - Contains the activities (as numeric) per row in "X_[train|test].txt"
                       Can be translated in descriptive activity using the file "../activity_labels.txt"
* "subject_[train|test].txt" - Contains the subject ID per row for observations in "X_[train|test].txt"

More information on how the process of tidying data can be found in "CodeBook.md"

