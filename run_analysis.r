#Load files into data structures

#Test Files
subject_test<-read.csv("./test/subject_test.txt", header=FALSE)

x_test<-read.csv("./test/x_test.txt", header=FALSE, sep="")

y_test<-read.csv("./test/y_test.txt", header=FALSE)

#Train Files
subject_train<-read.csv("./train/subject_train.txt", header=FALSE)

x_train<-read.csv("./train/x_train.txt", header=FALSE, sep="")

y_train<-read.csv("./train/y_train.txt", header=FALSE)


#Row merge train and test files
x<-rbind(x_test,x_train)
y<-rbind(y_test,y_train)
subject<-rbind(subject_test,subject_train)


#Treating Activity Labels
activity_labels<-read.csv("activity_labels.txt", header=FALSE, sep=" ")
#discard the number id and let only the label
activity_labels<-activity_labels[,2]

#Treating Features
features<-read.csv("features.txt", header=FALSE, sep=" ")
#discard the number id and let only the label
features<-features[,2]

#naming variables
names(x)<-features
names(y)<-"activity"
names(subject)<-"subject"


# Kill all measurements that are not mean or standard deviation.
x<-x[,grep("std|mean",features)]


#Change activity number by activity names
# #Loop on activity names and assign as label
i=1
while(i<=nrow(y)){
  y[i,]<-as.character(activity_labels[as.numeric(y[i,])])
  i<-i+1
}

#combining all datasets
whole_data<-cbind(subject,y,x)

#extract summarized data
summarized_data<-aggregate(whole_data,by=list(whole_data$subject,whole_data$activity),FUN=mean)

#removing messy columns
drops <- c("subject","activity")
summarized_data<-summarized_data[ , !(names(summarized_data) %in% drops)]
