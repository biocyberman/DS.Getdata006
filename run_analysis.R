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


message("Reading subjects and count their frequencies datasets...")
fcon <- file(file.path(raw.dir, "test", "subject_test.txt"))
test.subjects <- readLines(con=fcon)
close(fcon)
message("Test subject IDs and their data frequencies in Test data set:")
table(test.subjects)
tsu <- unique(test.subjects)


fcon <- file(file.path(raw.dir, "train", "subject_train.txt"))
train.subjects <- readLines(con=fcon)
close(fcon)
message("Train subject IDs and their data frequencies in Train data set:")
#train.subjects <- as.numeric(train.subjects)
tasu <- unique(train.subjects)
table(train.subjects)

message("Reading 'features.txt' file for feature names...")
ifile <- file.path(raw.dir, "features.txt")
features <- read.table(ifile, header=F, " ", stringsAsFactors=F)
selected <- grep("mean|std", features[,2])


## take.elems: A function to extract elements from ONE line of a dataset file.
# it is called repeatedly to extract elements from all lines of a dataset( either train or test)
# param: col.ids is a vector of ids of columns to take data
take.elems <- function(line = character(), col.ids = selected) {
  elems <- unlist(strsplit(line, " +", perl = TRUE))
  elems[-1][col.ids] # First exclude the first empty element and then subset
}


## read.data
# This function allows reading each dataset separately and returns a maxtrix of selected columns
# that is specified by 'col.ids' parameter. 
# param: col.ids is a numeric vector of columns ids of features of interest.
# Input files have "  " (two spaces) for column separators, and " " for subcolumn separator.
# That made it imposible to use read.table or fread directly.
read.data <- function(dataset = "Test", col.ids = selected){ 
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



message("Reading Test dataset...")
test.set <- read.data("test")
test.set <- cbind(test.subjects, test.set)
message("Reading Train dataset...")
train.set <- read.data("train")
train.set <- cbind(train.subjects, train.set)
cnames <- features[selected,2]
cnames <- c("Subject.ID", cnames)
cnames <- matrix(cnames, ncol = length(cnames))


ofile <- file.path(dat.dir, "combined_slim_dataset.txt")
message(sprintf("Writing output to '%s'...", ofile))
# Make sequential writing of data fragments instead of merging before writing
write.table(cnames, file= ofile, append = FALSE, row.names= FALSE, col.names=FALSE, sep=",")
write.table(test.set, file= ofile, append = TRUE, row.names= FALSE, col.names=FALSE, sep=",")
write.table(train.set, file= ofile, append = TRUE, row.names= FALSE, col.names=FALSE, sep=",")
