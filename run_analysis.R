library(downloader)
library(reshape2)

# Downloading the data, will need to adjust file directory paths if you have previously saved the data
# under a different name and directory
if (!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")){
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, dest = "data.zip", mode = "wb")
unzip("data.zip")}

# Import test data, column names, activity labels, and subject numbers 
x_test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
column_names <- read.table("UCI HAR Dataset/features.txt")
activity_labels_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_labels_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Name the columns for each data frame and vector
colnames(x_test_data) <- column_names[,2]
names(activity_labels_test)[1] <- "ActivityLabel"
names(subject_labels_test)[1] <- "SubjectLabel"

# Bind vectors to the data frame
complete_x_test <- cbind(subject_labels_test, activity_labels_test, x_test_data)

#repeat previous steps for training data
x_train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
activity_labels_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_labels_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

colnames(x_train_data) <- column_names[,2]
names(activity_labels_train)[1] <- "ActivityLabel"
names(subject_labels_train)[1] <- "SubjectLabel"

# Bind vectors to the data frame and merge the two sets of data
complete_x_train <- cbind(subject_labels_train, activity_labels_train, x_train_data)
complete_data <- rbind(complete_x_test, complete_x_train)

# Find columns that contain mean/std measurements and assign to vectors
# Subset the data frame to include ID columns and mean/std measurement columns
std_cols <- grep(pattern = "-std()", names(complete_data), fixed = TRUE)
mean_cols <- grep(pattern = "-mean()", names(complete_data), fixed = TRUE)
reduced <- subset(complete_data, select = c(1,2, std_cols, mean_cols))

# Change ActivityLabel column from int to named factors
activity_names <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_names <- activity_names[,2]
reduced$ActivityLabel <- factor(reduced$ActivityLabel, labels = activity_names, ordered = TRUE)

# Melt data frame into narrow form, then recast along with mean aggregator
melted <- melt(reduced, id = c("SubjectLabel", "ActivityLabel"))
averaged_complete <- dcast(melted, SubjectLabel + ActivityLabel ~ variable, mean)

#write file to txt format 
write.table(averaged_complete, file = "merged_and_averaged_data.txt", row.names = FALSE, col.names = TRUE)

