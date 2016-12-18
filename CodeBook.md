# Code Book for _Getting and Cleaning Data_ peer-reviewed assignment

This code book describes the variables in the resulting data file *tidy_summary.txt*. Detail regarding the variable names can be found below.

- activity - The activity being performed when the measurement was made, valid values are described below.
- subjectcode - The integer between 1 and 30 indicating which participant the measurements relate to.
- tBodyAccmeanX - The average of the mean of tBodyAcc along the X axial direction
- tBodyAccmeanY - The average of the mean of tBodyAcc along the Y axial direction
- tBodyAccmeanZ - The average of the mean of tBodyAcc along the Z axial direction
- tBodyAccstdX - The average of the std of tBodyAcc along the X axial direction
- tBodyAccstdY - The average of the std of tBodyAcc along the Y axial direction
- tBodyAccstdZ - The average of the std of tBodyAcc along the Z axial direction
- tGravityAccmeanX - The average of the mean of tGravityAcc along the X axial direction
- tGravityAccmeanY - The average of the mean of tGravityAcc along the Y axial direction
- tGravityAccmeanZ - The average of the mean of tGravityAcc along the Z axial direction
- tGravityAccstdX - The average of the std of tGravityAcc along the X axial direction
- tGravityAccstdY - The average of the std of tGravityAcc along the Y axial direction
- tGravityAccstdZ - The average of the std of tGravityAcc along the Z axial direction
- tBodyAccJerkmeanX - The average of the mean of tBodyAccJerk along the X axial direction
- tBodyAccJerkmeanY - The average of the mean of tBodyAccJerk along the Y axial direction
- tBodyAccJerkmeanZ - The average of the mean of tBodyAccJerk along the Z axial direction
- tBodyAccJerkstdX - The average of the std of tBodyAccJerk along the X axial direction
- tBodyAccJerkstdY - The average of the std of tBodyAccJerk along the Y axial direction
- tBodyAccJerkstdZ - The average of the std of tBodyAccJerk along the Z axial direction
- tBodyGyromeanX - The average of the mean of tBodyGyro along the X axial direction
- tBodyGyromeanY - The average of the mean of tBodyGyro along the Y axial direction
- tBodyGyromeanZ - The average of the mean of tBodyGyro along the Z axial direction
- tBodyGyrostdX - The average of the std of tBodyGyro along the X axial direction
- tBodyGyrostdY - The average of the std of tBodyGyro along the Y axial direction
- tBodyGyrostdZ - The average of the std of tBodyGyro along the Z axial direction
- tBodyGyroJerkmeanX - The average of the mean of tBodyGyroJerk along the X axial direction
- tBodyGyroJerkmeanY - The average of the mean of tBodyGyroJerk along the Y axial direction
- tBodyGyroJerkmeanZ - The average of the mean of tBodyGyroJerk along the Z axial direction
- tBodyGyroJerkstdX - The average of the std of tBodyGyroJerk along the X axial direction
- tBodyGyroJerkstdY - The average of the std of tBodyGyroJerk along the Y axial direction
- tBodyGyroJerkstdZ - The average of the std of tBodyGyroJerk along the Z axial direction
- tBodyAccMagmean - The average of the mean of tBodyAccMag
- tBodyAccMagstd - The average of the std of tBodyAccMag
- tGravityAccMagmean - The average of the mean of tGravityAccMag
- tGravityAccMagstd - The average of the std of tGravityAccMag
- tBodyAccJerkMagmean - The average of the mean of tBodyAccJerkMag
- tBodyAccJerkMagstd - The average of the std of tBodyAccJerkMag
- tBodyGyroMagmean - The average of the mean of tBodyGyroMag
- tBodyGyroMagstd - The average of the std of tBodyGyroMag
- tBodyGyroJerkMagmean - The average of the mean of tBodyGyroJerkMag
- tBodyGyroJerkMagstd - The average of the std of tBodyGyroJerkMag
- fBodyAccmeanX - The average of the mean of fBodyAcc along the X axial direction
- fBodyAccmeanY - The average of the mean of fBodyAcc along the Y axial direction
- fBodyAccmeanZ - The average of the mean of fBodyAcc along the Z axial direction
- fBodyAccstdX - The average of the std of fBodyAcc along the X axial direction
- fBodyAccstdY - The average of the std of fBodyAcc along the Y axial direction
- fBodyAccstdZ - The average of the std of fBodyAcc along the Z axial direction
- fBodyAccJerkmeanX - The average of the mean of fBodyAccJerk along the X axial direction
- fBodyAccJerkmeanY - The average of the mean of fBodyAccJerk along the Y axial direction
- fBodyAccJerkmeanZ - The average of the mean of fBodyAccJerk along the Z axial direction
- fBodyAccJerkstdX - The average of the std of fBodyAccJerk along the X axial direction
- fBodyAccJerkstdY - The average of the std of fBodyAccJerk along the Y axial direction
- fBodyAccJerkstdZ - The average of the std of fBodyAccJerk along the Z axial direction
- fBodyGyromeanX - The average of the mean of fBodyGyro along the X axial direction
- fBodyGyromeanY - The average of the mean of fBodyGyro along the Y axial direction
- fBodyGyromeanZ - The average of the mean of fBodyGyro along the Z axial direction
- fBodyGyrostdX - The average of the std of fBodyGyro along the X axial direction
- fBodyGyrostdY - The average of the std of fBodyGyro along the Y axial direction
- fBodyGyrostdZ - The average of the std of fBodyGyro along the Z axial direction
- fBodyAccMagmean - The average of the mean of fBodyAccMag
- fBodyAccMagstd - The average of the std of fBodyAccMag
- fBodyBodyAccJerkMagmean - The average of the mean of fBodyBodyAccJerkMag
- fBodyBodyAccJerkMagstd - The average of the std of fBodyBodyAccJerkMag
- fBodyBodyGyroMagmean - The average of the mean of fBodyBodyGyroMag
- fBodyBodyGyroMagstd - The average of the std of fBodyBodyGyroMag
- fBodyBodyGyroJerkMagmean - The average of the mean of fBodyBodyGyroJerkMag
- fBodyBodyGyroJerkMagstd - The average of the std of fBodyBodyGyroJerkMag



## Valid values for _activity_

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING



## Detailed description of measurements

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals *and included in the summary output* are: 

- mean: Mean value
- std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean
