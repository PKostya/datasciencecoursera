test_data<- read.table("c:\\temp\\UCI HAR Dataset\\test\\x_test.txt")
train_data<- read.table("c:\\temp\\UCI HAR Dataset\\train\\x_train.txt")

test_subjects<-read.table("c:\\temp\\UCI HAR Dataset\\test\\subject_test.txt")
train_subjects<-read.table("c:\\temp\\UCI HAR Dataset\\train\\subject_train.txt")

test_y <- read.table("c:\\temp\\UCI HAR Dataset\\test\\y_test.txt")
train_y <- read.table("c:\\temp\\UCI HAR Dataset\\train\\y_train.txt")

all_data<- rbind(test_data, train_data)
all_subjects<-rbind(test_subjects, train_subjects)
all_y<- rbind(test_y, train_y)


features <- read.table("c:\\temp\\UCI HAR Dataset\\features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
all_data <- all_data[, indices_of_good_features]
names(all_data) <- features[indices_of_good_features, 2]
names(all_data) <- gsub("\\(|\\)", "", names(all_data))
names(all_data) <- tolower(names(all_data))

activities <- read.table("C:\\temp\\UCI HAR Dataset\\activity_labels.txt")

activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
all_y[,1] = activities[all_y[,1], 2]
names(all_y) <- "activity"

names(all_subjects) <- "subject"
cleaned <- cbind(all_subjects, all_y, all_data)
write.table(cleaned, "c:\\temp\\merged_clean_data.txt")


uniqueSubjects = unique(all_subjects)[,1]
numSubjects = length(unique(all_subjects)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "c:\\temp\\data_set_with_the_averages.txt", row.name=FALSE)
