#Setting up new directory for assignment
dir.create("assignment4")
setwd("assignment4")
getwd()   #confirms working directory changed to "assignment 4"

#Unzipping file
"C:/Users/micha/OneDrive/Desktop/week4data.zip"   #copied path name of compressed zip file

uzp <- "C:/Users/micha/OneDrive/Desktop/week4data.zip"  #assigned path to variable, "uzp"

unzip(uzp, exdir = "C:/Users/micha/OneDrive/Desktop/John Hopkins Data Course/Module 3/assignment4")  #unzipped variable, "uzp" in the specdata directory, aka the current working directory

#Reading feature vector
features <- read.table("UCI HAR Dataset/features.txt")

#Reading Training datasets
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Reading Testing datasets
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Reading the Activities
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activities) <- c("ActivityID", "ActivityType")

#Assigning variable names
colnames(x_train) <- features[, 2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features[, 2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"


#Step 1: merging datasets
trainsets <- cbind(x_train, subject_train, y_train)
testsets <- cbind(x_test, subject_test, y_test)
Merged_Data <- rbind(trainsets, testsets)


#Step 2: extracting measurements on Mean and Standard Deviation for each measurement
measurements <- grepl("subjectID|activityID|mean\\(\\)|std\\(\\)", colnames(Merged_Data))
setforMeanandStd <- Merged_Data[, measurements]

#Step 3: Use descriptive activity names to name the activities in the data set
setforMeanandStd$code <- activities[setforMeanandStd$code, 2]

#Step 4: Label the data set with descriptive variable names
names(setforMeanandStd)[2] = "activity"
names(setforMeanandStd)<-gsub("Acc", "Accelerometer", names(setforMeanandStd))
names(setforMeanandStd)<-gsub("Gyro", "Gyroscope", names(setforMeanandStd))
names(setforMeanandStd)<-gsub("BodyBody", "Body", names(setforMeanandStd))
names(setforMeanandStd)<-gsub("Mag", "Magnitude", names(setforMeanandStd))
names(setforMeanandStd)<-gsub("^t", "Time", names(setforMeanandStd))
names(setforMeanandStd)<-gsub("^f", "Frequency", names(setforMeanandStd))
names(setforMeanandStd)<-gsub("tBody", "TimeBody", names(setforMeanandStd))
names(setforMeanandStd)<-gsub("-mean()", "Mean", names(setforMeanandStd), ignore.case = TRUE)
names(setforMeanandStd)<-gsub("-std()", "STD", names(setforMeanandStd), ignore.case = TRUE)
names(setforMeanandStd)<-gsub("-freq()", "Frequency", names(setforMeanandStd), ignore.case = TRUE)
names(setforMeanandStd)<-gsub("angle", "Angle", names(setforMeanandStd))
names(setforMeanandStd)<-gsub("gravity", "Gravity", names(setforMeanandStd))

Step #5: Creating a second, independent tidy data set with the avg of each variable for each activity and subject
finaltidydata <- setforMeanandStd %>%
  group_by(subjectID, activityID, setforMeanandStd$code) %>%
  summarise_all(mean)

write.table(finaltidydata, "tidydata.txt", row.name=FALSE)







