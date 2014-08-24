run_analysis <- function() {
    ## Getting and Cleaning data. 
    ## Script to load and create the clean data for the course project.
    
    ## Tasks:
    ## 1. Merges the training and the test sets to create one data set.
    ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    ## 3. Uses descriptive activity names to name the activities in the data set
    ## 4. Appropriately labels the data set with descriptive variable names. 
    ## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    
    library(stringr)
    
    ## First find which features refer to mean or standard deviations, so as 
    ## to know which columns to retain.
    writeLines("Loading features...")
    features_text<-read.table("features.txt", sep=" ")
    
    ## Create 2 logical vectors, selecting feature names that contain 
    ## "mean" or "std".
    features_mean<-str_detect(features_text[,2],"mean")
    features_std<-str_detect(features_text[,2],"std")
    ## Merge these into a single logical vector. These are the columns
    ## of data that are to be retained for the tidy data.
    features_to_retain<-features_mean | features_std

    ## Load the subject data from test and training files:
    writeLines("Loading subjects...")
    subject_test<-read.table("subject_test.txt")
    subject_train<-read.table("subject_train.txt")
    ## Combine the 2 subject vectors into a single subject vector.
    subject<-rbind(subject_train,subject_test)
    ## Clear the individual subject vectors to free memory:
    rm(subject_test,subject_train)
    colnames(subject)<-"subjectid"
    
    ## Load the X data from test and training files:
    writeLines("Loading X data...")
    X_test<-read.table("X_test.txt")
    X_train<-read.table("X_train.txt")
    ## Combine the X datasets into a single X dataset:
    X<-rbind(X_train,X_test)
    ## Clear the individual X datasets to free memory:
    rm(X_test,X_train)
    
    ## Read in the column names for X from the features.txt file:
    X_names<-read.table("features.txt", col.names=c("number","title"))
    
    ## Load the y data from test and training files:
    writeLines("Loading y data...")
    y_test<-read.table("y_test.txt")
    y_train<-read.table("y_train.txt")
    ## Combine the y datasets into a single y dataset:
    y<-rbind(y_train,y_test)
    ## Clear the individual y datasets to free memory:
    rm(y_test,y_train)
    writeLines("Loaded all data. Processing...")
    
    ## Define a vector containing the mapping from y values to activity 
    ## labels:
    activity_labels<-c("Walking", "Walking upstairs", "Walking downstairs", 
                       "Sitting", "Standing","Laying")
    ## Create a new factor vector that uses these labels instead of the 
    ## digits 1 to 6:
    y_labels<-factor(y[,1], labels=activity_labels)
    
    ## Merge the columns into a single data table, retaining only the 
    ## feature vector columns that have means or standard deviations. 
    tidyData<-cbind(subject,X[features_to_retain],y_labels)
    
    ## Create a vector with the column names.
    titles<-as.character(X_names[features_to_retain,2])
    
    ## Process the titles to make them descriptive.
    ## Given the long names, I have chosen to use period.separated naming 
    ## convention as, for me, the names are more readable. See here:
    ## https://class.coursera.org/getdata-006/forum/thread?thread_id=132#post-533
    
    writeLines("Creating clean titles...")
    ## Split the titles by hyphen to split into components:
    titles.parts<-strsplit(titles,"-")
    
    ## Create a new vector with just the first element of the resulting lists:
    firstElement<-function(x){x[1]}
    titles.first<-sapply(titles.parts,firstElement)
    
    ## Replace the "t" with "TimeDomain" and "f" with "FrequencyDomain":
    ## Find the column titles that start with "t"
    firstChar<-substr(titles.first,1,1)=="t"
    ## Create a new vector of titles
    titles.new<-titles.first
    ## Replace all the titles that start with a "t" with "timeDomain."
    titles.new[firstChar]<-"timeDomain"
    ## Replace remaining titles with "frequencyDomain."
    titles.new[!firstChar]<-"frequencyDomain"
    ## Now remove the first character
    titles.first<-substr(titles.first,2,999)
    
    ## Create a new vector with just the 2nd element of the resulting lists:
    secondElement<-function(x){x[2]}
    titles.second<-sapply(titles.parts,secondElement)
    ## Create logical vector for the titles that have std in them:
    title.std<-titles.second=="std()"
    ## Rename this segment for the clean title:
    titles.second[title.std]<-".std"
    ## Rename the rest with mean:
    titles.second[!title.std]<-".mean"
    
    ## Create a new vector with just the first element of the resulting lists:
    thirdElement<-function(x){x[3]}
    titles.third<-sapply(titles.parts,thirdElement)
    ## Replace the X's with ".x" etc to be ready to append to titles.
    titles.third[titles.third=="X"]<-".x"
    titles.third[titles.third=="Y"]<-".y"
    titles.third[titles.third=="Z"]<-".z"
    titles.third[is.na(titles.third)]<-""
    
    ## Find all the unique non-descriptive first elements that need
    ## replacing
    non.descr.first<-unique(titles.first)
    ## Create a vector with the descriptive names that match the unique
    ## first element of the column names
    descr.first<-c("accelerometer.body-acceleration.signal",
                   "accelerometer.gravity.acceleration.signal",
                   "accelerometer.jerk.signal",
                   "gyroscope.body-acceleration.signal",
                   "gyroscope.jerk.signal",
                   "accelerometer.body-acceleration.magnitude",
                   "accelerometer.gravity.acceleration.magnitude",
                   "accelerometer.jerk.magnitude",
                   "gyroscope.body-acceleration.magnitude",
                   "gyroscope.jerk.magnitude",
                   "accelerometer.body-acceleration.signal",
                   "accelerometer.jerk.signal",
                   "gyroscope.body-acceleration.signal",
                   "accelerometer.body-acceleration.magnitude",
                   "accelerometer.jerk.magnitude",
                   "gyroscope.body-acceleration.magnitude",
                   "gyroscope.jerk.magnitude")
    
    ## Now select each type of data and rename to a descriptive name:
    for (i in 1:length(non.descr.first)) {
        ## Create a logical vector for which titles match this non-
        ## descriptive name
        titles.match<-titles.first==non.descr.first[i]
        ## Create a vector of the current descriptive name to allow it to
        ## be pasted with the current start of the new names:
        titles.new[titles.match]<-paste0(titles.new[titles.match],descr.first[i])
    }
    
    
    ## Now add the second and third elements (x, y and z):
    titles.new<-paste0(titles.new,titles.second, titles.third)
    
    names(tidyData)[1]<-"subject.id"
    names(tidyData)[2:80]<-titles.new
    names(tidyData)[81]<-"activity"
    
    ## Output the first tidy data set:
    writeLines("Created TidyData. Outputting file...")
    write.table(tidyData,file="tidyData1.txt",sep=",",row.name=FALSE)
    writeLines("File saved. Creating second tidy data set...")
    
    ## Now create the second tidy data set with the average of each 
    ## variable for each activity and each subject. 
    
    ## Define a matrix to hold the 2nd tidy data set.
    ## 180 rows, one for each subject / activity combination
    ## 79 columns for variables
    tidyData.2<-matrix(nrow=(30*6),ncol=79)
    ## Also create the 2 columns for subject and activity that represent the 
    ## data for each row:
    subjectid.2<-factor(rep(1:30,each=6))
    activity.2<-factor(rep(1:6,30),labels=activity_labels)
    
    ## Loop through each subject
    for (a in 1:30) {
        ## Loop through each activity for this subject
        for (b in 1:6) {
            ## Compute the row number for the now of data.
            new.row<-(((a-1)*6)+b)
            ## Compute the column means on tidayData, subsetting for 
            ## subject "a" and activity "b":
            tidyData.2[new.row,1:79]<-colMeans(tidyData[tidyData$subject==a & tidyData$activity==activity_labels[b],2:80])
        }
    }
    ## Now bind the columns into a single data frame.
    tidyData.2<-cbind(subjectid.2, activity.2, tidyData.2)
    
    ## Give column titles for the data
    dimnames(tidyData.2)[[2]][1]<-"subject.id"
    dimnames(tidyData.2)[[2]][2]<-"activity"
    dimnames(tidyData.2)[[2]][3:81]<-titles.new
    
    ## Write the data to a file:
    writeLines("Saving 2nd tidy data set...")
    write.table(tidyData.2,file="tidyData2.txt",sep=",",row.name=FALSE)
    writeLines("Done!")
    ## return the second tidy data set:
    tidyData.2
}

