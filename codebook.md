<h1> Getting and Cleaning Data Project Codebook
<h2> Data Download</h2>

For this project, R version 3.1.3 was used
Data was downloaded from this website: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

When download.file() function was used mode was switched to write binary "wb"

To unzip the files unzip() function was used with the modifier exdir = "."

<h2> Data Merge </h2>

For merging purposes, lengths and dimesions of files were inspected to figure out how to merge the files.

**Y** labeled files contained activity codes

**Subject**  labeled files contained subject ids

**X** labeled files contained measurements

**Features**  contained measurement types

**Labels**  contained activity labels that corresponded to activity codes

Data were merged and columns were appropriately labeled

<h2> Getting the mean and standard deviation of measurements </h2>

For this grep function was used which searches for a particular pattern in each element of a vector x.

Merged data was subsetted with this pattern and activity and subject columns were added back

<h2> Getting the right activity names </h2>

Factored the final data set and assigned levels and labels from the label file

<h2> Creating the tidy data </h2>

Final data was aggragated by subject and activity mean and tidy.txt was written using   write.table() using row.name=FALSE 

*Notes:* 

Features are normalized and bounded within [-1,1].
Each feature vector is a row on the text file.

<h2> Experimental details pertaining to the data used </h2>

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).

The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 

The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

