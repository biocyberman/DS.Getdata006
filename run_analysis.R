## run_annalysis.R
#'
#' A script to do analysis according to requirements in 'getting and cleaning 
#' data project'
#' 
## Preparation of directory and raw data file
fs <- .Platform$file.sep # Another way is 'file.path' function
raw.dir <- "raw"
dat.dir <- "data"
dir.create(raw.dir, showWarnings=FALSE)
dir.create(dat.dir, showWarnings=FALSE)
raw.data <- paste0(raw.dir, fs, "getdata.Fprojectfiles.FUCI_HAR_Dataset.zip")
if (!file.exists(raw.data)) {
  message("Downloading raw data from internet...")
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url=fileUrl, destfile= raw.data, quiet= TRUE, method= "wget")
  unzip(zipfile=raw.data, exdir= raw.dir, overwrite= TRUE)
}

## Read various small things
#'
#' This reads columns of subjects, activities for test and train datasets.
#' @param what can be either "subjects" or "activities"
#' @param set is a charecter string of either "test" or "train"
#'   
read.misc <- function(what = c("subjects", "activities")[1],
                      set = c("test", "train")[1]){
  if (what == "subjects"){
    fcon <- file(file.path(raw.dir, set, paste0("subject_", set, ".txt")))
  } else {
    fcon <- file(file.path(raw.dir, set, paste0("y_", set, ".txt")))
  }

  dat <- readLines(con=fcon)
  close(fcon)
  #print(table(dat))
  dat
}

#' Read list of features.
#' 
message("Reading 'features.txt' file for feature names...")
ifile <- file.path(raw.dir, "features.txt")
features <- read.table(ifile, header=F, " ", stringsAsFactors=F)
selected <- grep("mean|std", features[,2])


#' Read activity labels
#' 
activity.lables <- read.table(file.path(raw.dir, "activity_labels.txt"), header = FALSE, colClasses=c("numeric", "character"))
activity.lables <- activity.lables[,2]

#' A function to extract elements from ONE line of a dataset file
#'
#' it is called repeatedly to extract elements from all lines of a dataset( either train or test)
#' @param line A character string
#' @param col.ids A vector of ids of columns to take data
take.elems <- function(line = character(), col.ids = selected) {
  elems <- unlist(strsplit(line, " |  "))
  elems[-1][col.ids] # First exclude the first empty element and then subset
}


#' Read raw data and return columns of interest.
#' 
#' This function allows reading each dataset separately and returns a maxtrix of selected columns
#' that is specified by 'col.ids' parameter. 
#' @param dataset is either 'test' or 'train'
#' @param col.ids is a numeric vector of columns ids of features of interest.
#' Input files have "  " (two spaces) for column separators, and " " for subcolumn separator.
#' That made it imposible to use read.table or fread directly.
read.data <- function(dataset = "test", col.ids = selected){ 
  ifile <- file.path(raw.dir, tolower(dataset), paste0("X_", tolower(dataset), ".txt"))
  if (!file.exists(ifile)) {
    stop("Could not find dataset file: ", ifile)
  }
  #test <- fread(ifile, sep = "\n")
  fcon <- file(ifile, open="rt")
  dat <- readLines(con = fcon) # Use ReadLines for portability, one can also preprocess input files with 'gawk', 'sed', etc 
  close(fcon)
  dat <- do.call(rbind,
                 lapply(dat, FUN= function(line) take.elems(line, col.ids)
                 ))
  
}


message("Reading subjects list...")
# This is not unique list, but a list subjects indexes that tell who does this
# activity for each row of data.
test.subjects <- read.misc(what="subjects", set= "test")
train.subjects <- read.misc("subects", "train")

message("Reading activities list ...")
# Activity indexes for each row of data
test.activities <- read.misc(what="activities", set= "test")
train.activities <- read.misc("activities", "train")


#' Task 1 & 2:
#' Merges the training and the test sets to create one data set.
#' Extracts only the measurements on the mean and standard deviation 
#' for each measurement (this is done when calling `read.data` function.
#' 
message("Reading Test dataset...")
test.set <- read.data("test")
#test.set <- as.numeric(test.set)
message("Reading Train dataset...")
train.set <- read.data("train")
#train.set <- as.numeric(train.set)



test.set <- cbind(test.subjects,test.activities, test.set)
train.set <- cbind(train.subjects, train.activities, train.set)
slim.data <- rbind(test.set, train.set)

#rm(list=c("train.set", "test.set"))

#' Task 4: Appropriately labels the data set with descriptive variable names. 
cnames <- features[selected,2]
# Replace prefix 't' with 'time'
cnames <- gsub(pattern="^t", replacement="time.", x=cnames)
# Replace prefix 'f' with 'frequency'
cnames <- gsub(pattern="^f", replacement="frequency.", x=cnames)
# Replace hyphens with '.' dots, and remove parenthesises 
cnames <- gsub(pattern="-", replacement=".", x=cnames)
cnames <- gsub(pattern="\\(\\)", replacement="", x=cnames)
cnames <- c("Subject.ID","Activities", cnames)
#cnames <- matrix(cnames, ncol = length(cnames))
colnames(slim.data) <- cnames

#' Task 3: Uses descriptive activity names to name the activities in the data set
#' 
slim.data[, "Activities"] <- activity.lables[as.numeric(slim.data[, "Activities"])]
#' Write out combined slim-down dataset for later use
#' 
ofile <- file.path(dat.dir, "combined_slim_dataset.txt")
message(sprintf("Writing output to '%s'...", ofile))
write.table(slim.data, file= ofile, append = FALSE, row.names= FALSE, col.names=TRUE, sep=",")

#' Task 5: Creates a second, independent tidy data set 
#' with the average of each variable for each activity and each subject.
library(data.table)
slim.data <- data.frame(slim.data, stringsAsFactors = FALSE) # avoid a bug 
slim.data <- data.table(slim.data)
setkey(slim.data, Subject.ID, Activities) 

dt.out <- slim.data[, lapply(.SD, function(x) mean(as.numeric(x))),
                     by = list(Subject.ID, Activities)]
ofile <- file.path(dat.dir, "combined_tidy_dataset.txt")
message(sprintf("Writing output to '%s'...", ofile))
write.table(dt.out, file= ofile, append = FALSE, row.names= FALSE, col.names=TRUE, sep=",")
