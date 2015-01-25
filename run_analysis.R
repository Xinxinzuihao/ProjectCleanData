################################ Goal ########################################
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
###############################################################################


################################ Read in data sets
#features.txt
features=read.table(choose.files(),header=F)
#activity_labels.txt
activities=read.table(choose.files(),header=F)

####train data
#subject: subject_train.txt
trainsub=read.table(choose.files(), header=F)
#feature:X_train.txt
trainfea=read.table(choose.files(), header=F)
#activity: y_train.txt
trainact=read.table(choose.files(), header=F)

####test data
#subject: subject_test.txt
testsub=read.table(choose.files(), header=F)
#feature:X_test.txt
testfea=read.table(choose.files(), header=F)
#activity: y_test.txt
testact=read.table(choose.files(), header=F)


################################## 1 Merges the training and the test sets to create one data set.
########Combine the Test and Train data sets together
#For subject
totalsub=rbind(trainsub,testsub)
#For feature
totalfea=rbind(trainfea,testfea)
#For activity
totalact=rbind(trainact,testact)

######## Assign columns names to totalsub, totalfea, totalact
colnames(totalsub)=c("subjects")
colnames(totalfea)=features[,2]
colnames(totalact)=c("activities")

######### Combine the subject, feature and activity data
totaldata=cbind(totalsub, totalact, totalfea)

################################## 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
#get the feature column names that contain mean or std
MeanStdFeaNames=features[,2][grep("mean\\(\\)|std\\(\\)", features[,2])]
#from 'totaldata', subset the columns with the names as in "MeanStdFeaNames"
#and also the activity and subject column
MeanStdData=cbind(totaldata[,c(1,2)],  totaldata[,colnames(totaldata) %in% MeanStdFeaNames])

################################### 3 Uses descriptive activity names to name the activities in the data set
MeanStdData$activities[MeanStdData$activities==1]="WALKING"
MeanStdData$activities[MeanStdData$activities==2]="WALKING_UPSTAIRS"
MeanStdData$activities[MeanStdData$activities==3]="WALKING_DOWNSTAIRS"
MeanStdData$activities[MeanStdData$activities==4]="SITTING"
MeanStdData$activities[MeanStdData$activities==5]="STANDING"
MeanStdData$activities[MeanStdData$activities==6]="LAYING"


################################### 4 Appropriately labels the data set with descriptive variable names. 
names(MeanStdData)<-gsub("^t", "time", names(MeanStdData))
names(MeanStdData)<-gsub("^f", "frequency", names(MeanStdData))
names(MeanStdData)<-gsub("Acc", "Accelerometer", names(MeanStdData))
names(MeanStdData)<-gsub("Gyro", "Gyroscope", names(MeanStdData))
names(MeanStdData)<-gsub("Mag", "Magnitude", names(MeanStdData))
names(MeanStdData)<-gsub("BodyBody", "Body", names(MeanStdData))


#################################### 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
TidyData<-aggregate(. ~activities+subjects, MeanStdData, mean)
write.table(TidyData, file = "tidydata.txt",row.name=FALSE)
