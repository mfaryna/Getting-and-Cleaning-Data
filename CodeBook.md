Getting-and-Cleaning-Data
=========================

To obtain the tidy data set the following steps were taken:

1. Loading data 
Data sets were loaded into R (they must be in your working directory!).
All .txt files from folders "train" and "test" must be copied to wd in order for script to work.

2. Merging data
Merging train and test sets into one data set (for now as three different variables).

3. Labeling data
Naming activities in a human way (had no time to do it prettier...).

4. Removing unneccessary variables
Making some memory free.

5. Computing mean and sd for each measurment
For each measurement mean and standard deviation were computed. Each of them as a separate list.
Then they were unlisted and binded to one variable called "measure".

6. Final merging data
Data about subjects, activities and their mean and sd were bined into one variable "full".

7. Summarizing data
Computing mean and sd of the measurments for each subject and each activity.

8. Creating text file to submit.



As a result we obtained:
=======================

A data frame with 4 variables and 30 observations.

Variables are:
---------------
- "subjects" - id of a person examined,
- "labels" - activity measured,
- "mean" - mean of all measurements for particular activity and particular subject
- "sd" - standard deviation of all measurements for particular activity and particular subject

Each row represents one observation.