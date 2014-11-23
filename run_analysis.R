## read train and test data

train<-read.table("./UCI HAR Dataset/train/X_train.txt")
test<-read.table("./UCI HAR Dataset/test/X_test.txt")

## merge train and test data

mergedData<-rbind(train,test)

## extract features names

featuresNames<-read.table("./UCI HAR Dataset/features.txt")

## rename columns with variables in mergedData to featuresNames

colnames(mergedData)<-featuresNames$V2

#extract mean() and std() based on features names

mergedData<-mergedData[grep("mean()|std()", names(mergedData))]

## read activity data for train and test groups

activityTrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
activityTest<-read.table("./UCI HAR Dataset/test/y_test.txt")

## merge activity data for train and test groups

activityMerge<-rbind(activityTrain, activityTest)

# rename activity names

activityMerge$V1 <-factor(activityMerge$V1, labels = c("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying"))

## read subject data for train and test groups

subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")

## merge subject data for train and test groups

subjectMerge<-rbind(subjectTrain, subjectTest)

## combine all merged data (activity, subject, train&test set)

mergedData<-cbind(activityMerge, subjectMerge, mergedData)

## properly name columns 1 and 2 (instead of V1, etc.)

names(mergedData)[1]<-"activity"
names(mergedData)[2]<-"subject"

## produce final dataset of averages

library(data.table)
mergedData<-data.table(mergedData)
finalData<-mergedData[,lapply(.SD,mean), by = list(subject,activity)]
write.table(finalData, file = "./finalProject.txt")
