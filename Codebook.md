# Codebook for Assignment

## Origins of Data
The data used in this assignment represents data collected from the accelerometers of the Samsung Galaxy S smartphone. 

A full description of the data is available at the site where the data was obtained: 
https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones

The link to the data used for the assignment: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Preparation for data analysis
Download the data file into Rstudio and unzip it to the current working directory

## About the R Script: run_analysis.R
### Variables

- features <- features.txt; The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ

- activities <- activity_labels.txt; List of activities performed when the corresponding measurements were taken and its codes (labels)

- #### Train data variables

    - x_train <- X_train.txt; contains the features from train dataset

    - y_train <- y_train.txt; contains the activity labels for the train dataset

    - subject_train <- subject_train.txt; contains train data of 21/30 volunteer subjects being observed

- #### Test data variables

    - x_test <- X_test.txt; contains the features from the test dataset

    - y_test <- y_test.txt; contains the activity labels for the test dataset

    - subject_test <- subject_test.txt; contains test data of 9/30 volunteer test subjects being observed

- #### Merged data variables
    - trainsets = the merging of all train datasets (x_train, y_train, subject_train)
      
    - testsets = the mergining of all test datasets (x_test, y_test, subject_test)
      
    - Merged_Data = the merging of trainsets and testsets
 
- #### Mean and Standard Deviation Variables
    - measurements = contains the extracted measurements on the mean and standard deviation 
      
    - setforMeanandStd = Contains the combined extracted measurements for each measurement of the dataset

- #### New tidy data set
    - finaltidydata = a second, independent tidy data set with the average of each variable for each activity and each subject.

### Data Methodology

- #### Step 1: Merges the training and the test sets to create one data set.
    - Create the merged train and test data variables using cbind()
    - Create the Merged_data using rbind(trainsets, testsets)

- #### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
    - extract mean and std from each measurement (measurements) = setforMeadandStd
  
- #### Step 3: Uses descriptive activity names to name the activities in the data set
    - Coded activity names to name the activities in the variable, setforMeanandStd

- #### Step 4: Appropriately labels the data set with descriptive variable names. 
    - Changed the activity labels in the variable, setforMeanandStd to make data readable
          - Acc => Accelerometer
      
          - Gyro => Gyroscope
      
          - BodyBody => Body
      
          - Mag => Magnitude
      
          - ^t => time
      
          - ^f => frequency
      
          - tBody => Timebody
      
          - -mean() => mean
      
          - -std() => STD
      
          - freq() => frequency
      
          - angle => Angle
      
          - gravity => Gravity
        
- #### Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.
    - Used the write.table function with the finaltidydata variable to create the tidydata.txt file
