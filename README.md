---
title: "README"
output: html_document
---

This ReadMe explains how the run_analysis() script works.

## Starting conditions

The run_analysis.R script must be in the same working directory as the unzipped data files.

## Output of the script

The script generates 2 comma delimited text files, names tidyData1.txt and tidyData2.txt.

tidyData1.txt contains the tidy data set at the completion of the 4th step.

tidyData2.txt contains the tidy data set at the completion of the 5th step.

The script also returns the 2nd tidy data set.

## Calling the script

The script should be run as follows:
```{r, eval=FALSE}
source("run_analysis.R")
tidyData2<-run_analysis()
```

## Script structure

The script operates as follows:

### Finds the columns that contain mean or standard deviation data

1. loads the features from "features.txt".

2. finds the features that contain the text "mean" or "std"

3. creates a logical vector "features_to_retain" that indicates whether a feature column is to be retained or not.

### Loads the raw data files

4. loads the subject data from both the test and training files, merging them into a single data frame.

5. loads the X data from both the test and training files, merging them into a single data frame.

6. loads the y data from both the test and training files, merging them into a single data frame.

### Clean features and feature names (including Steps 1 and 2)

7. converts the numeric y feature to be a factor with the clean activity labels in place of digits. 

8. creates a data frame that combines the subject, the selected features and the activity, dropping the unneeded columns. The "features_to_retain" vector is used to subset the columns that include mean and standard deviation values.

## Step 3: create descriptive feature names

9. The column titles from the X data are subset with "features_to_retain" to create a string vector with the raw feature titles (b efore cleaning)

10. The strsplit() function is used to split the names according to the hyphens. The subsequent cleaning then transforms each segment in turn as described below:
  a. a string vector "titles.new" is used into which to gradually buid up the new feature names by pasting on text that better describes the respective column. Each descriptive text is separated with a period to improve readability. (See https://class.coursera.org/getdata-006/forum/thread?thread_id=132#post-533)

  b. substr() is used to determine if the first character in the feature title is a "t"", starting "titles.new" with "TimeDomain". Otherwise the feature data is from the frequency domain and labelled as "FrequencyDomain".

  c. the second element identifies whether the data is the mean or the standard deviation. The script adds ".mean" or ".std" to "titles.second".
  
  d. the third element identifies whether the data is for a specific axis (x, y or z). The script adds ".x", ".y" or ".z" to "titles.third".
  
  e. the first element is then processed. A unique list of the values in the first element is extracted. A replacement string vector, "descr.first", is defined in the same sequence as the values in the unique list of first elements. The first element of the 79 feature titles is subset in turn to select all the elements with the same first element and replaced by the corresponding clean title.
  
  f. the different parts of the new feature titles are all pasted together into "titles.new". This is then used to label the feature columns.
  
11. With this the 1st tidy data set, and step 4, are complete. The data set is saved to a csv file called "tidyData1.txt"

### Step 5: create a second tidy data set.

12. A new matrix, "tidyData.2", is created with 180 rows and 79 columns to hold the mean of each variable for each combination of "subjectid" and "activity".

13. The columns for subjectid and activity are created.

14. 2 nested loops are used to subset data for a specific subjectid and activity, computing the mean of all the 79 columns and saving the result in the matrix. It would be more elegant to use the aggregate() function, but this simple approach to this step executes in 4 secs on my machine. Fast enough! :) 

15. The subjectid and activity columns are added to the matrix to form the tidy data data frame, called "tidyData.2" 

16. Column titles are relabled to the clean titles from step 4 and the data frame is saved to a csv file called "tidyData2.txt"

17. The 2nd data set is returned as the result of the run_analysis() script.

