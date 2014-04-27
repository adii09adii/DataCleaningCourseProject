###Read all files

##I have kept all files at same location
## Reading all files

subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
Y_test <- read.table("Y_test.txt")

subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
Y_train <- read.table("Y_train.txt")

activity_labels <- read.table("activity_labels.txt")
featuresData <- read.table("features.txt")

####converted from factor to character
X <- activity_labels$V2
Xcharacter <- as.character(X)
activity_labels$V2 <- Xcharacter
class(activity_labels$V2)

######Colnames assigning from feature.txt file
colnames(X_test) <- featuresData$V2
colnames(X_train) <- featuresData$V2
########

####### Merging test data
testsubset <- join(Y_test,activity_labels,by="V1")
newtestsubset <- cbind(subject_test,testsubset)
newdatatest <- cbind(newtestsubset,X_test)
#####

####### Merging train data
trainsubset <- join(Y_train,activity_labels,by="V1")
newtrainsubset <- cbind(subject_train,trainsubset)
newdatatrain <- cbind(newtrainsubset,X_train)

###### Resultant Data 
newdataresult <- rbind (newdatatest,newdatatrain)
#######
##dim(newdataresult)

#### Assigning Coloumn Names
colnames(newdataresult)[1] <- "Subject"
colnames(newdataresult)[2] <- "ActivityCode"
colnames(newdataresult)[3] <- "ActivityLabels"

##### sorted final result by Subject
finalresult <- arrange(newdataresult,newdataresult$Subject)
#head(finalresult, n=3)

###### Finding column by mean and std
toMatch1 <-c(".*mean\\(\\).*",".*std\\(\\).*")
matches <- unique (grep(paste(toMatch1,collapse="|"), names(X_test), value=TRUE))
###########
##matches

##adding Remaining column - total cloumn needed in final result 
##removed Activity Code column
 newmatches <- c("Subject","ActivityLabels",matches)
# newmatches

###Required final data including every step from 1-4
finalresultdata <- finalresult[,newmatches]

#####Performing tidy data 5th step on resulted data frame in last step
##Calculating required tidy data based on Subject and Activity Labels

datamelt <- melt(finalresultdata, id = c("Subject","ActivityLabels"))
resultedfinaltidydata <- dcast(datamelt, Subject + ActivityLabels~variable,mean)

resultedfinaltidydata
#newtidydatafinal <- resultedfinalset3[,3:68]
#dim(newtidydatafinal)
#head(newtidydatafinal, n=3)

#Resulted tidy data
#newtidydatafinal

