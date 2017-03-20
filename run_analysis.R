library(readr)
library(dplyr)

#
# this function will read the data from either the training or test set
# as a prerequisite the script expects that the directory (setwd) is set to the directory
# where file "features.txt" is located
#

read_cases <- function (label) {
    # load all data we need to process one directory
    datafile <- read_fwf(file = file.path(".", label, paste0(c("X_", label, ".txt"), collapse = "")), col_positions = fwf_widths(rep(16, 561)), col_types = paste0(rep("d", 561), collapse = ""))
    activities <- readLines(con = file.path(".", label, paste0(c("y_", label, ".txt"), collapse = "")))
    subjectid <- readLines(con = file.path(".", label, paste0(c("subject_", label, ".txt"), collapse = "")))
    labels <- read.csv(file = "./activity_labels.txt", sep = " ", header = FALSE)
    names(labels) <- c("activityNbr", "activity")
    headlines <- read.csv(file = "./features.txt", sep = " ", header = FALSE)
    
    # add descriptive labels to data
    names(datafile) <- headlines[,2]
    
    # add columns with subject, activity as text and the source (test or train)
    datafile$subjectid <- subjectid
    datafile$activityNbr <- activities
    datafile <- merge(datafile, labels, by = "activityNbr")
    datafile$activityNbr <- NULL
    datafile$source <- rep(label, dim(datafile)[1])
    
    # only return columns with means, standard deviation, subjectid, activity and source
    invisible(datafile[,grepl("-mean|-std|subjectid|activity|source", names(datafile))])
}

# load both test and train data and combine them
data1 <- read_cases("test")
data2 <- read_cases("train")
data <- rbind(data1, data2)

# save combined data as output.csv
write.csv(file = "output.csv", data)

# create a subset of average of each variable for each activity and each subject
shortdata <- data %>% select(-source) %>% group_by(activity, subjectid) %>% summarize_each(funs(mean))
write.csv(file = "output_avg_per_subject_and_per_activity.csv", shortdata)
