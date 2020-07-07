# run_analysis.R
THE FUNCTIONS PERFORMED BY THE R script run_analysis.R are as follows:-
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
CODEBOOK:-

xtrain-Training set.
ytrain-Training labels.
sub_train-Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 under training
xtest-Test set.
ytest-Test labels.
sub_test-Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 under testing
features-List of all features.
act_labels-Links the class labels with their activity name.
