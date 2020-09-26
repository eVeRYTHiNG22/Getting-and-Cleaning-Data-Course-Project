# Extracting data to data frames
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


# MERGING TRAINING AND TEST DATA SETS
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, y, X)


# EXTRACTING MEAN AND STANDARD DEVIATIONS FOR EACH MEASUREMENT
tidy_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))


# RENAMING ACTIVITY NAMES OF DATA SET TO BE DESCRIPTIVE
tidy_data$code <- activity_labels[tidy_data$code, 2]


# LABELLING THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
names(tidy_data)[2] = "activity"
names(tidy_data)<-gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data)<-gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data)<-gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data)<-gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data)<-gsub("^t", "Time", names(tidy_data))
names(tidy_data)<-gsub("^f", "Frequency", names(tidy_data))
names(tidy_data)<-gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data)<-gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-std()", "STD", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("angle", "Angle", names(tidy_data))
names(tidy_data)<-gsub("gravity", "Gravity", names(tidy_data))


# CREATING DATA SET WITH AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
final_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(final_data, "final_data.txt", row.name = FALSE)