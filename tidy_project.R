# R script run_analysis.R
# refer to README.md for documentation
# Franco Zanini - 2017

# Installation of the dplyr library
library(dplyr)

# Step 1.1 - Merges the training and the test sets (x), labels (y)
#           and subject identifiers (subject)

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Step 1.2 - Create single x, y and subject data set

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Step 2.1 - Reads the list of all features and selects only the
#            measurements on the mean and standard deviationstat_data

features <- read.table("features.txt")
stat_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, stat_features]

# Step 2.2 - Changes the name of the columns

names(x_data) <- features[stat_features, 2]

# Step 4 - Use descriptive activity names to name the activities 
#          in the data set and updates the values with their names

activities <- read.table("activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"

# Step 4 - Labels the data set with descriptive variable names and
#          merges the data in the same data set

names(subject_data) <- "subject"
full_data <- cbind(x_data, y_data, subject_data)

# Step 5 - Creates a tidy data set with the average of each variables by
#          activity and subject

full_data_stat <- full_data %>% 
  group_by(subject, activity) %>%
  summarise_each(funs(mean))
write.table(full_data_stat, "clean_data.txt", row.names = FALSE, 
            quote = FALSE)