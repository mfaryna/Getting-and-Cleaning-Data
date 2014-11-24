library(reshape2)

## ---------- 1. Loading data ---------- ##

X_train <- read.csv("X_train.txt", header = FALSE)
X_test <- read.csv("X_test.txt", header = FALSE)

y_train <- read.csv("y_train.txt", header = FALSE)
y_test <- read.csv("y_test.txt", header = FALSE)

subject_train <- read.csv("subject_train.txt", header = FALSE)
subject_test <- read.csv("subject_test.txt", header = FALSE)


## ---------- 2. Merging data ---------- ##
vals <- rbind(X_train, X_test)
labels <- rbind(y_train, y_test)
subjects <- rbind(subject_train, subject_test)

## ---------- 3. Labeling data ---------- ##
labels[labels==1] <- "WALKiNG"
labels[labels==2] <- "WALKING_UPSTAIRS"
labels[labels==3] <- "WALKING_DOWNSTAIRS"
labels[labels==4] <- "SITTING"
labels[labels==5] <- "STANDING"
labels[labels==6] <- "LAYING"

## ---------- 4. removing unneccessary variables ---------- ##
rm(X_train)
rm(X_test)
rm(y_train)
rm(y_test)
rm(subject_train)
rm(subject_test)

## ---------- 5. Computing mean and sd for each measurment ---------- ##
char <- lapply(vals, as.character)
spl <- lapply(char, strsplit, " ")
num <- lapply(spl[[1]], as.numeric)

avg <- lapply(num, mean, na.rm = TRUE)
sd <- lapply(num, sd, na.rm = TRUE)

rm(char) 
rm(spl) 
rm(num)

avg <- unlist(avg)
sd <- unlist(sd)
measure <- data.frame("mean" = avg, "sd" = sd)

## ---------- 6. Final merging data ---------- ##
full <- cbind(subjects, labels, measure)
names(full) <- c("subjects", "labels", "mean", "sd")

## ---------- 7. Summarizing data ---------- ##
molten <- melt(full, id=c("subjects", "labels"), measure.vars=c("mean", "sd"))
tidy_data <- dcast(molten, subjects + labels ~ variable, mean)

## ---------- 8. Creating text file to submit ---------- ##
write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)
