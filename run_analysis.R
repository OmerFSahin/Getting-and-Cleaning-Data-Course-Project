#reading activity and features labels
activity_labels<-read.table("activity_labels.txt")
colnames(activity_labels)<-c("activity_code", "activity_name")
features<-read.table("features.txt")
#transforming features into character vector
featuresdf<-features[,2]
#setting work directory
setwd("test")
#reading test data
X_test<-read.table("X_test.txt")
subject_test<-read.table("subject_test.txt")
y_test<-read.table("y_test.txt")
#columnwise binding 
testdf<-cbind(subject_test, X_test, y_test)
#go back in work directory
setwd("..")
#setting work directory
setwd("train")
#reading train data
X_train<-read.table("X_train.txt")
y_train<-read.table("y_train.txt")
subject_train<-read.table("subject_train.txt")
setwd("..")
#columnwise binding 
traindf<-cbind(subject_train, X_train, y_train)
#rowwise binding of test and train data
df1<-rbind(traindf,testdf)
#adding colnames to dataset
namecol<-c("subject", featuresdf, "label")
colnames(df1)<-namecol
#adding descriptive column for labels; walking, running etc.
library(dplyr)
df2 <- df1 %>%
        select(label) %>%
        left_join(activity_labels, by=c("label"="activity_code"))
#giving names for columns in dataframe that contain descriptive labels
colnames(df2)<-c("activity_code","activity_name")
#subsetting only  activity_name
activity_name<-df2[,2]
#adding it into dataset
df3<-cbind(df1,activity_name)
#subsetting dataset by columns that include mean and standard deviation only (and subject, label and activity_name of course)
subset_df<- df3 %>%
        select(subject,label, activity_name, matches("mean|std"))
print(subset_df)
#group_by subject and activity_name and summary mean for all feature
df_final<- subset_df %>%
        group_by(subject, activity_name) %>%
        summarise(across(everything(), mean, na.rm = TRUE))

