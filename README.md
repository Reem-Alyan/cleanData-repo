0. reading the given files using "read.table"

1. binding the columns "X_test, Y_test, subject_test" and "X_train, Y_train, subject_train" using "cbind" and then binding all the resulted rows in one dataset using "rbind"

2. changing the first two columns names 

 reading the "features.txt" file
looking for the columns that contain "mean" or "std" using "grep"
then we select the first two columns (ids and names) and the columns resulted from grep

3. saving activity names in a variable "lookUpNames" and then replacing the columns with them

4. using "grep" again with "features.txt" with value=true to get the values not the numbers then we assign these names to the columns names in the table

5. grouping by "subject.ids" then "activity.names" and using "summarze_all" to calculate the mean for all columns
