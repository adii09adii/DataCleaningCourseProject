DataCleaningCourseProject
=========================

1.Path is set to Currentfolder and all files (X_test,Y_test,Subject_test,X_train,Y_train,Subject_train,features.txt,activity_labels.txt) are kept here.
2.All text files are kept in same single folder so read it directly, instead of providing path to sub folder

3.run_analysis.R are is executed at path set to above folder.

4.File Used:X_test,Y_test,Subject_test,X_train,Y_train,Subject_train,features.txt,activity_labels.txt)

5.newtestdata : result of "Merging all test data"

6.newtestdata : result of "Merging all train data"

7.finalresult :  Merged data set (1,3,4 steps) sorted and arranged done
					1.Merges the training and the test sets to create one data set.
					3.Uses descriptive activity names to name the activities in the data set
					4.Appropriately labels the data set with descriptive activity names. 
					
8.toMatch1 : match according to mean() and std()

9.finalresultdata :Extracts only the measurements on the mean and standard deviation for each measurement. 
					completed and result of (1-4) steps
					
10.Taking previous merged data : Assuming output of previous step (1-4)steps calculating 5th step of tidy data on resulted data frame									

11.On basis of "Subject" and "ActivityLabels", I have grouped table and took mean by using melt and dcast

12.resultedfinaltidydata :Independent tidy data set with the average of each variable for each activity and each subject. 

13.resultedfinaltidydata.txt is txt format of output

14.Projectfinaltidydata2.pdf is pdf file of output

15.Projectfinaltidydata.csv is csv format of output 