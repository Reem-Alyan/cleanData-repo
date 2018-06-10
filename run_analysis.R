X_test <- read.table("C:/Users/ASUS/Documents/test/X_test.txt")
Y_test <- read.table("C:/Users/ASUS/Documents/test/Y_test.txt")
s_test <- read.table("C:/Users/ASUS/Documents/test/subject_test.txt")

X_train <- read.table("C:/Users/ASUS/Documents/train/X_train.txt")
Y_train <- read.table("C:/Users/ASUS/Documents/train/Y_train.txt")
s_train <- read.table("C:/Users/ASUS/Documents/train/subject_train.txt")




test <- cbind(s_test, Y_test, X_test)
train <- cbind(s_train, Y_train, X_train)
dset <- rbind(test, train)




names(dset)[1] <- "subject.ids"
names(dset)[2] <- "activity.names"

feat <- read.table("C:/Users/ASUS/Documents/features.txt")
m <- grep("mean", feat$V2)
s <- grep("std", feat$V2)
mn <- m+2
st <- s+2
ms <- c(mn, st)
extracted <- select(dset, c(subject.ids, activity.names, ms))




lookUpNames <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING",
                 "STANDING", "LAYING")
extracted$activity.names <- lookUpNames[extracted$activity.names]




m1 <- grep("mean", feat$V2, value = TRUE)
s1 <- grep("std", feat$V2, value = TRUE)
ms1 <- c(m1,s1)

sub_act <- select(extracted, subject.ids:activity.names)
subt <- select(extracted, -(subject.ids:activity.names))
colnames(subt) <- ms1
ltable <- cbind(sub_act, subt)



grouped <- group_by(ltable, subject.ids, activity.names)
summ <- summarise_all(grouped, mean)




write.table(summ, "C:/Users/ASUS/Documents/tidydata.txt")
