# clean
Getting and Cleaning Data

INSTRUCTIONS FOR CREATING THE TIDY DATA SET from  data collected from the accelerometers from the Samsung Galaxy S smartphone.

1. The first task is to unzip the given datafile into a directory, in my case in 
   "C:\Users\Hannu\cleaning"   This will create two subdirectories, "test and train",
   where the actual test and traingin data is to be found.

2.  Then the R program "run_analysis.R" should be run with "source".  The program requires
     libraries "data.table" and "reshape2",  but they should become loaded automatically.  Also
     the program changes the working directories as needed.

3.   The purpose is to extract only the measurements on the mean and standard deviation for each measurement
     and combine the test (2947 observations) and training (7352 observations) data into one dataset. Once this
     is done there are 82 variables left, 3 of which are for identification purposes and the remaining 79 are the
     actual data measurements. 

4.  The data will also get averaged by study subject and different activities.  Hence 
    in the final tidy data set there are only 180 averages (from 30 subjects and 6 different activities) with 81
    (activity number code is redundant) variables left.

5.   These data are finally printed into a regular text file "tidy_data.txt".
