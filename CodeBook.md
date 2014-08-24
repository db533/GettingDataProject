---
title: "CodeBook"
output: html_document
---

## Tidy data set 1 features:
The file tidyData1.txt is a comma-separated file with headers in the first row. 

The first column ("subjectid") contains the identifier for the person that provided the data. Width 2. It has integer values from 1 to 30, each corresponding to a subject in the trials.

The last column ("activity") indicates what activity the person was performing when the data was capture. Column width: up to 18 characters. The values used are as follows:
"Walking"            
"Walking upstairs"   
"Walking downstairs"
"Sitting"            
"Standing"           
"Laying"

Aside from the first and last column, all others are 11 characters wide if negative (with a leading minus) or 10 characters wide if positive.

The meaning of the remaining 79 features is identified by text that appears between consequetive dots. (Following guidance in the forums, I felt this would make these long feature names more readable:
https://class.coursera.org/getdata-006/forum/thread?thread_id=132#post-533

The meaning of each variable can be determined as follows:

1. Features that begin with "timeDomain" are measurements in the time domain.
Features that begin with "frequencyDomain" are measurements in the frequency domain.

2. The string between the first and 2nd dots indicates the sensor that was used to capture the data:
"accelerometer" means the data was collected from an accelerometer.
"gyroscope" means the data was collected from a gyroscope.

3. The string between the 2nd and 3rd dots indicates the measurement that was being taken:
"body-acceleration" means the acceleration of the body was being measured.
"jerk" means movements interpreted to be sharp changes of position.

4. The string between the 3rd and 4th dots indicates the type of transformation that was applied to the data:
"mean" means that the mean of the raw values was calculated.
"std" means that the standard deviations of the raw values was calculated.

5. If a further x, y or z is appended, then this indicates the direction of the moment i.e. along the x axis, the y axis or the z axis.

No units were detailed in the original data. Thus it is not possible to know the units of these variables.  

The features that it contains are as follows:
"subject.id"
"timeDomain.accelerometer.body-acceleration.signal.mean.x"
"timeDomain.accelerometer.body-acceleration.signal.mean.y"
"timeDomain.accelerometer.body-acceleration.signal.mean.z"
"timeDomain.accelerometer.body-acceleration.signal.std.x"
"timeDomain.accelerometer.body-acceleration.signal.std.y"
"timeDomain.accelerometer.body-acceleration.signal.std.z"
"timeDomain.accelerometer.gravity.acceleration.signal.mean.x"
"timeDomain.accelerometer.gravity.acceleration.signal.mean.y"
"timeDomain.accelerometer.gravity.acceleration.signal.mean.z"
"timeDomain.accelerometer.gravity.acceleration.signal.std.x"
"timeDomain.accelerometer.gravity.acceleration.signal.std.y"
"timeDomain.accelerometer.gravity.acceleration.signal.std.z"
"timeDomain.accelerometer.jerk.signal.mean.x"
"timeDomain.accelerometer.jerk.signal.mean.y"
"timeDomain.accelerometer.jerk.signal.mean.z"
"timeDomain.accelerometer.jerk.signal.std.x"
"timeDomain.accelerometer.jerk.signal.std.y"
"timeDomain.accelerometer.jerk.signal.std.z"
"timeDomain.gyroscope.body-acceleration.signal.mean.x"
"timeDomain.gyroscope.body-acceleration.signal.mean.y"
"timeDomain.gyroscope.body-acceleration.signal.mean.z"
"timeDomain.gyroscope.body-acceleration.signal.std.x"
"timeDomain.gyroscope.body-acceleration.signal.std.y"
"timeDomain.gyroscope.body-acceleration.signal.std.z"
"timeDomain.gyroscope.jerk.signal.mean.x"
"timeDomain.gyroscope.jerk.signal.mean.y"
"timeDomain.gyroscope.jerk.signal.mean.z"
"timeDomain.gyroscope.jerk.signal.std.x"
"timeDomain.gyroscope.jerk.signal.std.y"
"timeDomain.gyroscope.jerk.signal.std.z"
"timeDomain.accelerometer.body-acceleration.magnitude.mean"
"timeDomain.accelerometer.body-acceleration.magnitude.std"
"timeDomain.accelerometer.gravity.acceleration.magnitude.mean"
"timeDomain.accelerometer.gravity.acceleration.magnitude.std"
"timeDomain.accelerometer.jerk.magnitude.mean"
"timeDomain.accelerometer.jerk.magnitude.std"
"timeDomain.gyroscope.body-acceleration.magnitude.mean"
"timeDomain.gyroscope.body-acceleration.magnitude.std"
"timeDomain.gyroscope.jerk.magnitude.mean"
"timeDomain.gyroscope.jerk.magnitude.std"
"frequencyDomain.accelerometer.body-acceleration.signal.mean.x"
"frequencyDomain.accelerometer.body-acceleration.signal.mean.y"
"frequencyDomain.accelerometer.body-acceleration.signal.mean.z"
"frequencyDomain.accelerometer.body-acceleration.signal.std.x"
"frequencyDomain.accelerometer.body-acceleration.signal.std.y"
"frequencyDomain.accelerometer.body-acceleration.signal.std.z"
"frequencyDomain.accelerometer.body-acceleration.signal.mean.x"
"frequencyDomain.accelerometer.body-acceleration.signal.mean.y"
"frequencyDomain.accelerometer.body-acceleration.signal.mean.z"
"frequencyDomain.accelerometer.jerk.signal.mean.x"
"frequencyDomain.accelerometer.jerk.signal.mean.y"
"frequencyDomain.accelerometer.jerk.signal.mean.z"
"frequencyDomain.accelerometer.jerk.signal.std.x"
"frequencyDomain.accelerometer.jerk.signal.std.y"
"frequencyDomain.accelerometer.jerk.signal.std.z"
"frequencyDomain.accelerometer.jerk.signal.mean.x"
"frequencyDomain.accelerometer.jerk.signal.mean.y"
"frequencyDomain.accelerometer.jerk.signal.mean.z"
"frequencyDomain.gyroscope.body-acceleration.signal.mean.x"
"frequencyDomain.gyroscope.body-acceleration.signal.mean.y"
"frequencyDomain.gyroscope.body-acceleration.signal.mean.z"
"frequencyDomain.gyroscope.body-acceleration.signal.std.x"
"frequencyDomain.gyroscope.body-acceleration.signal.std.y"
"frequencyDomain.gyroscope.body-acceleration.signal.std.z"
"frequencyDomain.gyroscope.body-acceleration.signal.mean.x"
"frequencyDomain.gyroscope.body-acceleration.signal.mean.y"
"frequencyDomain.gyroscope.body-acceleration.signal.mean.z"
"frequencyDomain.accelerometer.body-acceleration.magnitude.mean"
"frequencyDomain.accelerometer.body-acceleration.magnitude.std"
"frequencyDomain.accelerometer.body-acceleration.magnitude.mean"
"frequencyDomain.accelerometer.body-acceleration.signal.mean"
"frequencyDomain.accelerometer.body-acceleration.signal.std"
"frequencyDomain.accelerometer.body-acceleration.signal.mean"
"frequencyDomain.accelerometer.jerk.signal.mean"
"frequencyDomain.accelerometer.jerk.signal.std"
"frequencyDomain.accelerometer.jerk.signal.mean"
"frequencyDomain.gyroscope.body-acceleration.signal.mean"
"frequencyDomain.gyroscope.body-acceleration.signal.std"
"frequencyDomain.gyroscope.body-acceleration.signal.mean"
"activity"


## Tidy data set 2 features:
The file tidyData2.txt is a comma-separated file with headers in the first row. 

The first column ("subjectid") contains the identifier for the person that provided the data. Width 2. It has integer values from 1 to 30, each corresponding to a subject in the trials.

The 2nd column ("activity") indicates what activity the person was performing when the data was capture. Column width: up to 18 characters. The values used are as follows:
"Walking"            
"Walking upstairs"   
"Walking downstairs"
"Sitting"            
"Standing"           
"Laying"

The remaining 79 columns were by taking the mean of all the readings in the above tidy data set where the subject and activity matched the values in columns 1 and 2.

Aside from the first and second column, all others are 11 characters wide if negative (with a leading minus) or 10 characters wide if positive.

The meaning of the remaining 79 features is identified by text that appears between consequetive dots: 

Features that begin with "timeDomain" are measurements in the time domain.
Features that begin with "fequencyDomain" are measurements in the frequency domain.

The string between the first and 2nd dots indicates the sensor that was used to capture the data:
"accelerometer" means the data was collected from an accelerometer.
"gyroscope" means the data was collected from a gyroscope.

The string between the 2nd and 3rd dots indicates the measurement that was being taken:
"body-acceleration" means the acceleration of the body was being measured.
"jerk" means movements interpreted to be sharp changes of position.

The string between the 3rd and 4th dots indicates the type of transformation that was applied to the data:
"mean" means that the mean of the raw values was calculated.
"std" means that the standard deviations of the raw values was calculated.

If a further x, y or z is appended, then this indicates the direction of the moment i.e. along the x axis, the y axis or the z axis.

No units were detailed in the original data. Thus it is not possible to know the units of these variables.  

The features that tidyData2.txt contains are as follows:
"subject.id"
"activity"
"timeDomain.accelerometer.body-acceleration.signal.mean.x"
"timeDomain.accelerometer.body-acceleration.signal.mean.y"
"timeDomain.accelerometer.body-acceleration.signal.mean.z"
"timeDomain.accelerometer.body-acceleration.signal.std.x"
"timeDomain.accelerometer.body-acceleration.signal.std.y"
"timeDomain.accelerometer.body-acceleration.signal.std.z"
"timeDomain.accelerometer.gravity.acceleration.signal.mean.x"
"timeDomain.accelerometer.gravity.acceleration.signal.mean.y"
"timeDomain.accelerometer.gravity.acceleration.signal.mean.z"
"timeDomain.accelerometer.gravity.acceleration.signal.std.x"
"timeDomain.accelerometer.gravity.acceleration.signal.std.y"
"timeDomain.accelerometer.gravity.acceleration.signal.std.z"
"timeDomain.accelerometer.jerk.signal.mean.x"
"timeDomain.accelerometer.jerk.signal.mean.y"
"timeDomain.accelerometer.jerk.signal.mean.z"
"timeDomain.accelerometer.jerk.signal.std.x"
"timeDomain.accelerometer.jerk.signal.std.y"
"timeDomain.accelerometer.jerk.signal.std.z"
"timeDomain.gyroscope.body-acceleration.signal.mean.x"
"timeDomain.gyroscope.body-acceleration.signal.mean.y"
"timeDomain.gyroscope.body-acceleration.signal.mean.z"
"timeDomain.gyroscope.body-acceleration.signal.std.x"
"timeDomain.gyroscope.body-acceleration.signal.std.y"
"timeDomain.gyroscope.body-acceleration.signal.std.z"
"timeDomain.gyroscope.jerk.signal.mean.x"
"timeDomain.gyroscope.jerk.signal.mean.y"
"timeDomain.gyroscope.jerk.signal.mean.z"
"timeDomain.gyroscope.jerk.signal.std.x"
"timeDomain.gyroscope.jerk.signal.std.y"
"timeDomain.gyroscope.jerk.signal.std.z"
"timeDomain.accelerometer.body-acceleration.magnitude.mean"
"timeDomain.accelerometer.body-acceleration.magnitude.std"
"timeDomain.accelerometer.gravity.acceleration.magnitude.mean"
"timeDomain.accelerometer.gravity.acceleration.magnitude.std"
"timeDomain.accelerometer.jerk.magnitude.mean"
"timeDomain.accelerometer.jerk.magnitude.std"
"timeDomain.gyroscope.body-acceleration.magnitude.mean"
"timeDomain.gyroscope.body-acceleration.magnitude.std"
"timeDomain.gyroscope.jerk.magnitude.mean"
"timeDomain.gyroscope.jerk.magnitude.std"
"frequencyDomain.accelerometer.body-acceleration.signal.mean.x"
"frequencyDomain.accelerometer.body-acceleration.signal.mean.y"
"frequencyDomain.accelerometer.body-acceleration.signal.mean.z"
"frequencyDomain.accelerometer.body-acceleration.signal.std.x"
"frequencyDomain.accelerometer.body-acceleration.signal.std.y"
"frequencyDomain.accelerometer.body-acceleration.signal.std.z"
"frequencyDomain.accelerometer.body-acceleration.signal.mean.x"
"frequencyDomain.accelerometer.body-acceleration.signal.mean.y"
"frequencyDomain.accelerometer.body-acceleration.signal.mean.z"
"frequencyDomain.accelerometer.jerk.signal.mean.x"
"frequencyDomain.accelerometer.jerk.signal.mean.y"
"frequencyDomain.accelerometer.jerk.signal.mean.z"
"frequencyDomain.accelerometer.jerk.signal.std.x"
"frequencyDomain.accelerometer.jerk.signal.std.y"
"frequencyDomain.accelerometer.jerk.signal.std.z"
"frequencyDomain.accelerometer.jerk.signal.mean.x"
"frequencyDomain.accelerometer.jerk.signal.mean.y"
"frequencyDomain.accelerometer.jerk.signal.mean.z"
"frequencyDomain.gyroscope.body-acceleration.signal.mean.x"
"frequencyDomain.gyroscope.body-acceleration.signal.mean.y"
"frequencyDomain.gyroscope.body-acceleration.signal.mean.z"
"frequencyDomain.gyroscope.body-acceleration.signal.std.x"
"frequencyDomain.gyroscope.body-acceleration.signal.std.y"
"frequencyDomain.gyroscope.body-acceleration.signal.std.z"
"frequencyDomain.gyroscope.body-acceleration.signal.mean.x"
"frequencyDomain.gyroscope.body-acceleration.signal.mean.y"
"frequencyDomain.gyroscope.body-acceleration.signal.mean.z"
"frequencyDomain.accelerometer.body-acceleration.magnitude.mean"
"frequencyDomain.accelerometer.body-acceleration.magnitude.std"
"frequencyDomain.accelerometer.body-acceleration.magnitude.mean"
"frequencyDomain.accelerometer.body-acceleration.signal.mean"
"frequencyDomain.accelerometer.body-acceleration.signal.std"
"frequencyDomain.accelerometer.body-acceleration.signal.mean"
"frequencyDomain.accelerometer.jerk.signal.mean"
"frequencyDomain.accelerometer.jerk.signal.std"
"frequencyDomain.accelerometer.jerk.signal.mean"
"frequencyDomain.gyroscope.body-acceleration.signal.mean"
"frequencyDomain.gyroscope.body-acceleration.signal.std"
"frequencyDomain.gyroscope.body-acceleration.signal.mean"




