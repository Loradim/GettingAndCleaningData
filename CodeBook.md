#
# This CodeBook describes how the tidying of data works
#

Usage:
------
Extract the zip-file for this assignment to some directory on your computer.
Put the "run_analysis.R" file into the same directory as "activity_labels.txt"
Set your working directory to the directory where "run_analysis.R" resided.
Within R, type
> source("run_analysis.R")

After a few seconds two output files will be generated:
-------------------------------------------------------
output.csv - contains all observations including the subjectid, activity, source and all mean and standard deviations
output_avg_per_subjecvt_and_per_activity.csv - contains the mean for each mean and std column for each unique
                                               combination of subjectid and activity. In this file, the source column
                                               is removed and the means are calculated together for both training and
                                               test sets. If this is not the required behavior, you can simple not
                                               remove the source column and instead add source to the group_by command

Tidying data for "output.txt":
------------------------------
(For simplicity I will only describe the steps for the train data, but the steps are the same for test data)

l. X_train.txt is read. This file contains all observations, but is missing descriptive labels aswell as
     the subject ID the observation is for and the activity that was done to get this observation
l. y_train.txt is read. Each row in this file contains an activity number that corresponds to the row ob
     observations in X_train.txt. These numbers are added and translated with "activity_labels.txt" to not
     give a numeric representation of the activity, but instead a meaningful description.
     This textual description is added to a new column called activity
l. subject_train.txt is read. Each row in this file corresponds to a row in X_train.txt and contains the
     subjectid for which this observation is for. This information is added to a new column called subjectid
l. Another column called source is added and filled with "train" for the training set directory and "test" for
     the test directory.
l. Data for training and test directory is combined and saved to "output.txt"

Tidying data for "output_avg_per_subject_and_per_activity.csv":
---------------------------------------------------------------
l. Data from output.txt is used
l. Column "source" is removed, so we can get avg on all variables regardless of source
l. Data is grouped by activity and subjectid, so we can avg per subject and per activity
l. All columns are summarized with mean()
l. Data is saved to "output_avg_per_subject_and_per_activity.csv"

Description of columns:
-----------------------
* Columns 1 - 79 are all taken from the X_train.txt and X_test.txt dataset. They are labeled by the orginal names
               found in features.txt.
* Column 80 "subjectid" - information on the subjectID is coming from subject_train.txt, which contains the subject
                        ID for each observation in X_train.txt (and X_test.txt respectivly)
* Column 81 "activity" - textual description of the observed activity. Activity as a numeric value comes from y_train.txt
                       (again each row in y_train.txt corresponds to a row in X_train.txt). The numeric value is
                       translated into a descriptive activity by matching first column of "activity_labels.txt" and taking
                       the second column in "activity_labels.txt" for the matched row
* Column 82 "source" - is prefilled with "test" or "train" to indicate whether this observation came from the training
                     or test set. This is based on the directory, the data came from

