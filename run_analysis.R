library("data.table", lib.loc="~/R/win-library/3.1")
library("reshape2", lib.loc="~/R/win-library/3.1")
activity <- read.table("C:/Users/Hannu/cleaning/activity_labels.txt")[,2]
all_features <- read.table("C:/Users/Hannu/cleaning/features.txt")[,2]
ft_of_int <- grepl("mean|std",all_features)
feature<-all_features[ft_of_int]

setwd("C:/Users/Hannu/cleaning/train")   # Training data
X_train <-read.table("X_train.txt")
Y_train <-read.table("Y_train.txt")
subj_train <- read.table("subject_train.txt")
names(X_train) <- all_features
Y_train[,2] = activity[Y_train[,1]]
names(Y_train) <- c("Activity_ID","Activity_Label") 
names(subj_train) <- c("subject")
X_train_data <- X_train[,ft_of_int]
data_train <- cbind(as.data.table(subj_train),Y_train,X_train_data)
# training data: 7352 obs. 82 variables


setwd("C:/Users/Hannu/cleaning/test")     # Test data     
X_test <-read.table("X_test.txt")
Y_test <-read.table("Y_test.txt") 
subj_test <- read.table("subject_test.txt")
names(X_test) <- all_features
Y_test[,2] = activity[Y_test[,1]]
names(Y_test) <- c("Activity_ID","Activity_Label") 
names(subj_test) <- c("subject")
X_test_data <- X_test[,ft_of_int]
data_test <- cbind(as.data.table(subj_test),Y_test,X_test_data)
# test data: 2947 obs. 82 variables

data <- rbind(data_test,data_train)

setwd("C:/Users/Hannu/cleaning/")
id_vars = colnames(data)[1:3]
ms_vars = colnames(data)[-(1:3)]

data_mlt = melt(data, id.vars=id_vars, measure.vars=ms_vars)

tidy = dcast.data.table(data_mlt, subject + Activity_Label ~ variable, 
                        fun=mean)  # Averaging by subject and activity

write.table(tidy, file = "./tidy_data.txt", row.names=FALSE)
