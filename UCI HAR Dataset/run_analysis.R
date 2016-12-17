library(dplyr)
library(tidyr)

## Set the working directory to the downloaded and unzipped 'UCI HAR Dataset'.

## First we combine the subject code listed in subject_test.txt with the 
## measurement data in X_test.txt and the activity code in y_test.txt.

## Read subject_test.txt
## The file has no header, so we remember to changed the value for header
## from the default TRUE to FALSE.
subtst <- read.delim("test/subject_test.txt",header = FALSE)

## Give the variable a meaningful name.
names(subtst) <- c("subjectcode")

## Read X_test.txt
## We want the messy data to come in as a string so it can be split to
## separate columns later using tidyr's separate function.
xtst <- read.delim("./test/X_test.txt"
                   ,header = FALSE
                   ,stringsAsFactors = FALSE)

## Give the variable a meaningful name.
names(xtst) <- c("features")

## Read y_test.txt
## This is the activity code for each observation.
ytst <- read.delim("test/y_test.txt",header = FALSE)

## Give the variable a meaningful name.
names(ytst) = c("activitycode")

## Combine the three test data frames. 
tst <- cbind(subtst,xtst,ytst)

## At this stage, we have a data frame of 2947 obs. of 3 variables.
## Next, we follow the same steps for the training data.

## Remove unwanted variables.
rm(xtst,ytst,subtst)

## Read subject_train.txt
subtrn <- read.delim("train/subject_train.txt",header = FALSE)

## Give the variable a meaningful name.
names(subtrn) <- c("subjectcode")

## Read X_train.txt
xtrn <- read.delim(".\\train\\X_train.txt"
                   ,header = FALSE
                   ,stringsAsFactors = FALSE)

## Give the variable a meaningful name.
names(xtrn) <- c("features")

## Read y_train.txt.
ytrn <- read.delim(".\\train\\y_train.txt",header = FALSE)

## Give the variable a meaningful name.
names(ytrn) = c("activitycode")

## Combine the three training data frames.
trn <- cbind(subtrn,xtrn,ytrn)

## Remove unwanted variables.
rm(xtrn,ytrn,subtrn)

## Now we can bind the rows of tst and trn together.
dat <- rbind(trn,tst)

## Remove unwanted variables.
rm(trn,tst)

## At this stage we have a single data frame containing both the test and
## training data. 

## Next we need to extract only the mean and standard deviations for each 
## measurement.  Each row in the features column contains a vector of length
## 561. Those 561 values are described in features.txt 

## The problem here is that the features column breaks one of the clean data
## rules (i.e. that each column contains only one variable).

## we can do that using separate in the tidyr package, but we'll need a vector
## of column names. We can use the features.txt file for that vector

## Read in the features.
ft <- read.delim("features.txt",header = FALSE)

## Each row in ft contains an integer indicating ordinal position and the 
## descriptive name of the feature. These are initially in a single column
## called V1. We can use separate to put them in separate columns in the 
## data frame.
ft <- separate(ft,V1,c("featurecode","featurename"),sep = " ")

## Before separating the columns using space as a delimiter, 
## we should remove any leading whitespace to avoid extra columns being created.
dat$features <- trimws(dat$features)

## Now we can separate the character vector in the main data frame to one
## column per variable.
## We do this with tidyr's separate function, using the featurename above as the 
## 'into' argument. We separate on one or more space and tell the function to 
## drop additional values of the separator if they exist. 'drop' is the default
## behavior for the 'extra' argument, but it's more readable if we specfiy it
## explicitly.
dat <- separate(dat,features,ft$featurename,sep = "\\s+",extra="drop")

## Now there's a single variable for each feature, we can select only the 
## mean and standard deviation measures using column subsetting and grepl.
## We specify 'mean(' (properly escaped) to avoid returning meanFreq() columns.
## The search terms can be separated by the pipe character to imply 'OR'.
dat2 <- dat[,grepl("subjectcode|mean\\(|std|activitycode"
                   ,colnames(dat))]

## Remove unwanted variables.
rm(dat,ft)

## To assign descriptive labels to the activities, we can read in the file:
actlab <- read.delim("activity_labels.txt",header = FALSE)

## It reads in as a single-column called 'V1'. We can separate to two columns
## and rename them appropriately using tidyr's separate function. 
actlab <- separate(actlab,V1,c("activitycode","activity"),sep = "\\s")

## Make sure the activitycode is an integer.
actlab$activitycode <- as.integer(actlab$activitycode)

## Now we can add the labels to the main data frame.
## Both data frames have a column called 'activitycode', so this join
## will happen on activitycode and add the 'activity' column to dat2.
dat2 <- inner_join(dat2,actlab)

## Remove unwanted variables.
rm(actlab)

## To correctly summarize the variables, we must make sure they're the correct
## data type. This is easier to with dplyr:
dat2 <- tbl_df(dat2)

## mutate_each allows us to apply a function to an array of columns:
dat2 <- mutate_each(dat2,"as.numeric",2:67)

## we can also remove messy characters from all variable names
names(dat2) <- gsub("-","",names(dat2))
names(dat2) <- gsub("\\(\\)","",names(dat2))

## We want to take the average of the measures by subjectcode and activity, so
## we group the tbl_df by those variables.
dat2 <- group_by(dat2,activity,subjectcode)

## Finally, the output data frame is created using summarize_each.
datout <- summarize_each(dat2,"mean",2:67)

## We can then write the summary table to the current working directory:
write.table(datout,"tidy_summary.txt")

## And the whole tidy file:
write.table(dat2,"tidy.txt")