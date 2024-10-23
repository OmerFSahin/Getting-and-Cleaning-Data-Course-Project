# Getting-and-Cleaning-Data-Course-Project

This project uses the Human Activity Recognition Using Smartphones Dataset provided by Jorge L. Reyes-Ortiz and colleagues from the Smartlab, Università degli Studi di Genova. The dataset contains sensor signals from a group of volunteers performing six activities (e.g., walking, standing, laying) while wearing a smartphone. The goal of this project is to merge, clean, and organize the raw data into tidy formats, making it suitable for analysis.

The final outcome includes two datasets:
1.A merged dataset containing only the mean and standard deviation measurements.
2.A second tidy dataset that reports the average of each measurement, grouped by activity and subject.


Dataset Information:
Source:
Original Dataset: Human Activity Recognition Using Smartphones Version 1.0
Authors: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto
License: Publicly available for academic research; commercial use is prohibited.


Data Overview:
The dataset consists of two parts: training data (70% of volunteers) and test data (30% of volunteers). Each part contains multiple measurements collected from sensors, including accelerometers and gyroscopes. Key components include:
-561 Features: Capturing measurements in both time and frequency domains.
-6 Activities:
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING
-30 Volunteers: Each volunteer is identified with a unique subject ID (1-30).
Accelerometer and Gyroscope Data: Capturing 3D motion information from the smartphone placed on each volunteer’s waist.

##################################################################################################

1.Step: Merging Training and Test Sets to Create a Single Data Set
The data set is initially divided into two parts: train and test. We read the following files:

Training Data:
X_train.txt: Training feature data (561 columns).
y_train.txt: Training activity labels.
subject_train.txt: Identifies the subject who performed the activity.

Test Data:
X_test.txt: Test feature data (561 columns).
y_test.txt: Test activity labels.
subject_test.txt: Identifies the subject who performed the activity.

After reading the files, we merge the train and test datasets into a single dataset using rbind() to combine rows. Each row corresponds to a single observation, including the subject, activity label, and feature values.


2.Step: Extracting Measurements on Mean and Standard Deviation
We focus only on the mean and standard deviation measurements, as these are most relevant for further analysis. Using the features.txt file, we extract the appropriate columns with names matching “mean” or “std” (standard deviation).

3.Step: Adding Descriptive Activity Names
The activity_labels.txt file maps activity codes to descriptive names (e.g., 1 = WALKING, 2 = WALKING_UPSTAIRS). We join this information with the main dataset using left_join() from the dplyr package.

4.Step: Creating a Second, Independent Tidy Dataset
Finally, we create a tidy dataset that reports the average of each variable for each activity and subject. We use the group_by() and summarise() functions from dplyr to achieve this.

##################################################################################################

Dependencies:
R version >= 4.0

Packages Used:
dplyr: For data manipulation (select(), left_join(), group_by(), summarise())

File Descriptions:
features.txt: Lists the names of all 561 features
activity_labels.txt: Maps activity codes (1-6) to descriptive names
X_train.txt / X_test.txt: Contains feature data for training and test sets
y_train.txt / y_test.txt: Contains activity labels
subject_train.txt / subject_test.txt: Identifies the subject for each observation

How to Run the Code:
1. Download the dataset from UCI Machine Learning Repository via https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Extract the files and place them in the working directory
3. Run the R script provided to reproduce the results

Output:
1. Merged Dataset(subset_df) contains only the mean and standard deviation measurements.
2. Tidy Dataset(df_final) reports the average of each variable for each activity and subject.

Reference:
Anguita, D., Ghio, A., Oneto, L., Parra, X., & Reyes-Ortiz, J. L. (2012). Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012).

