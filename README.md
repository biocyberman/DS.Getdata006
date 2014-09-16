DS.Getdata006
=============

A temporary repo for course project of `getting and cleaning data` class. The project is an excercise on how to collect and tidy data. This git repo is a demonstration (or try to be) of how to do the job in a well documentated way. What you could really learn after doing this projects:

* Know how to write documents in `markdown` format and apply it to the write CodeBook.md file (except README.md file). 
* Know how to use `git` for version controlling of your code
* Know how to read `fixed-width-format` data with `read.fwf` or `readLines` function.
* Get to know something about Ambient Intelligence (AmI) and Activity Recognition (AR) and what can be done with smartphones.
* For myself, I start checking out how to develope R packages following rules of package and code documentations. 

Raw data
-----------------

Raw data was collected by downloading a zip file from [project's description page](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). It can also be downloaded from [the original source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The zip file aslo contains documentation about how the raw data was originally collected, what in the data.

Naming conventions
-----------------

**Variabiles** are named with words separated by dots, for example: `my.variable.names`. **R scripts** are named with words separated by underscores (`_`), i.e. `run_analysis.R`. Whereas, **documentation** files are named with `CammelCase`, for example: `CodeBook.md`, or `ReadMe.md` 

Analysis workflow and implementation of run_analysis.R
----------------

**Quick note:** Remaining parts of this README.md file explains how I thought about, chose, implemented the solution. The [run_analysis.html](./run_analysis.html) is also a good suplement for to understand the solution because it is `literate` programming document where code and documentation are weaved together to create a continous flow of information. 

From course project description and discussions in the project forum, it appears to be an `open-ended project in a controlled environment` (i.e. by opinions of instructors and peer-reviewers), where students are to decide what they want to come up with. While this is a good opportunity to practice a real-world situtation, it (the project) created a lot of confusion for students. It really makes them spends a lot of time in figuring out what to do to **satisfy the fictional requirements** of the project, not the part of **making sense of the data and communicate the analysis**. I consider the later is more important. All in all, this project gave students a opportunity to experience what it means when **you have data but not clear scientific questions in mind**: _you are confused and the data is useless!!!_ Did you experience the same thing? I am just curious. 

With that said, following is my rendition of what to do and implement it in the `run_analysis.R` script. Comments in `run_analysis.R` follow `roxygen2` style so the file is both annotated and ready for function documentation with `roxygen2` or `knitr::spin`. Therefore, it may look a bit longer than you would expect.   

### Task 1 and 2: Done together:

1. Task 1: Merges the training and the test sets to create one data set.
2. Task 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

Because we are not going to use the merged data set for anything else, the second task is done in parallel with first task. That is, while reading each dataset (either `test` or `train`) only columns of interest are picked up and carried further in downstream work. Columns of interest according to description of **task 2** are:

  1. the columns with mean() and std() at the end of their names
  2. a column of subject indexes from subject_train.txt or subject_test.txt files. 
  3. a column of activities indexes from two file: y_train.txt and y_test.txt. This will be used to convert to activity labels in **task 3**. 

As has been discussed a lot in the [course project forum](https://class.coursera.org/getdata-006/forum/list?forum_id=10009), selections of columns are rather upto personal decision, I choose the aforementioned columns because they make most sense to me for downstream tasks.

### Task 4: Appropriately labels the data set with descriptive variable names.

This is done before Task 3 to achieve more reable code in the `run_analysis.R` itself. 
```{r}
# cnames are names of columns ends with 'mean' or 'std' from 'features.txt' file. 
# Where, `selected` is a logical vector of the rows in 'features.txt' that satisfy 
# this pattern.
cnames <- features[selected,2]
# Replace prefix 't' with 'time'
cnames <- gsub(pattern="^t", replacement="time.", x=cnames)
# Replace prefix 'f' with 'frequency'
cnames <- gsub(pattern="^f", replacement="frequency.", x=cnames)
# Replace hyphens with '.' dots, and remove parenthesises 
```
### Task 3 Uses descriptive activity names to name the activities in the data set

Task 3 is done by retrieving activity labels from `activity_labels.txt` and replacing activity indexes with equivalent labels.  

### Task 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This is done by using `data.table`package. The output is written to 'data/combined_tidy_dataset.txt'

  
