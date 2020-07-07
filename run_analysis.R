run_analysis<- function(){
  xtrain<-read.table("./train/X_train.txt",header=FALSE)
  ytrain<-read.table("./train/y_train.txt",header=FALSE)
  sub_train<-read.table("./train/subject_train.txt",header=FALSE)
  #test data set
  xtest<-read.table("./test/X_test.txt",header=FALSE)
   ytest<-read.table("./test/y_test.txt",header=FALSE)
   sub_test<-read.table("./test/subject_test.txt",header=FALSE)
   features<-read.table("./features.txt",header=FALSE)
   act_labels<-read.table("./activity_labels.txt",header=FALSE) 
   #giving colnames to all data sets
   colnames(xtrain) = features[,2]
    colnames(ytrain) = "activityId"
   colnames(sub_train) = "subjectId"
    colnames(xtest) = features[,2]
    colnames(ytest) = "activityId"
    colnames(sub_test) = "subjectId"
   colnames(act_labels) <- c('activityId','activityType')
   
   mrg_train = cbind(ytrain, sub_train, xtrain)
   mrg_test = cbind(ytest, sub_test, xtest)
   #merging both training and test data sets
   setAllInOne = rbind(mrg_train, mrg_test)
   
   colNames = colnames(setAllInOne)
   
   mean_and_std = (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
 
   setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]
   setWithActivityNames = merge(setForMeanAndStd, act_labels, by='activityId', all.x=TRUE)
   secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
   secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]
   write.table(secTidySet, "secTidySet.txt", row.name=FALSE)
   c<-read.table("./secTidySet.txt")
   c
   
}
 