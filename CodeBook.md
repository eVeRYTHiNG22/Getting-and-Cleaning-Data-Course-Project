The `run_analysis.R` script performs data preparation and then follows by steps described in the course project’s instructions.

## 1. Assign data to variables from data files
  - `features` <- `features.txt` : 561 rows, 2 columns
    The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
  - `activity_labels` <- `activity_labels.txt` : 6 rows, 2 columns
    List of activities performed when the corresponding measurements were taken and its labels.
  - `subject_test` <- `test/subject_test.txt` : 2947 rows, 1 column
    Contains test data of 9/30 volunteer test subjects being observed.
  - `X_test` <- `test/X_test.txt` : 2947 rows, 561 columns
    Contains recorded features of test data.
  - `y_test` <- `test/y_test.txt` : 2947 rows, 1 columns
    Contains data of activities’ labels.
  - `subject_train` <- `test/subject_train.txt` : 7352 rows, 1 column
    Contains train data of 21/30 volunteer subjects being observed.
  - `X_train` <- `test/X_train.txt` : 7352 rows, 561 columns
    Contains recorded features of train data.
  - `y_train` <- `test/y_train.txt` : 7352 rows, 1 columns
    Contains train data of activities’ labels.

## 2. Merges the training and the test sets to create one data set
  - `X` (10299 rows, 561 columns) is created by merging `X_train` and `X_test` using `rbind()` function.
  - `y` (10299 rows, 1 column) is created by merging `y_train` and `y_test` using `rbind()` function.
  - `subject` (10299 rows, 1 column) is created by merging `subject_train` and `subject_test` using `rbind()` function.
  - `merged_data` (10299 rows, 563 column) is created by merging `subject`, `y` and `X` using `cbind()` function.

## 3. Extracts only the measurements on the mean and standard deviation for each measurement
  - `tidy_data` (10299 rows, 88 columns) is created by subsetting `merged_data`, selecting only columns: `subject`, `code` and the measurements on the `mean` and standard deviation (`std`) for each measurement.

## 4. Uses descriptive activity names to name the activities in the data set
  - Values in `code` column of `tidy_data` replaced by corresponding activity name from second column of the `activity_labels` variable.

## 5. Appropriately labels the data set with descriptive variable names
  - `code` column in `tidy_data` renamed to `activity`.
  - All `Acc` in names of columns replaced by `Accelerometer`.
  - All `Gyro` in names of columns replaced by `Gyroscope`.
  - All `BodyBody` in names of columns replaced by `Body`.
  - All `Mag` in names of columns replaced by `Magnitude`.
  - All characters starting with `f` in names of columns replaced by `Frequency`.
  - All characters starting with `t` in names of columns replaced by `Time`.

## 6. From the prepared data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject
  - `final_data` (180 rows, 88 columns) is created by summarizing `tidy_data` taking the mean of each variable for each activity for each subject, after grouping by `subject` and `activity`.
Export FinalData into FinalData.txt file.