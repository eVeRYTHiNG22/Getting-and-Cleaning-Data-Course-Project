## Getting-and-Cleaning-Data-Course-Project
This is a submission for Getting and Cleaning Data Course Project. It has the instructions on how to run analysis on Human Activity recognition dataset.

### Dataset
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Files
* `CodeBook.md` a code book that describes variables, data, and any transformations or work that is performed to clean the data.
* `run_analysis.R` performs data preparation and then follows by executing steps as described in the course project’s instructions:
  - Merges training and test datasets to create one data set.
  - Extracts only the measurements on the mean and standard deviation for each measurement.
  - Uses descriptive activity names to name the activities in the data set.
  - Appropriately labels the data set with descriptive variable names.
  - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* `final_data.txt` is the exported final data after going through all the sequences described above.
