#Coursera Getting and Cleaning Data - Project 
##Links:
Source Dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.                   
Code for Data Cleaning: https://github.com/Xinxinzuihao/ProjectCleanData/blob/master/run_analysis.R                          
Code Book for Tidy Data: https://github.com/Xinxinzuihao/ProjectCleanData/blob/master/CodeBook.md                            

##Goal
-Merges the training and the test sets to create one data set.                                                              
-Extracts only the measurements on the mean and standard deviation for each measurement.                              
-Uses descriptive activity names to name the activities in the data set                                                    
-Appropriately labels the data set with descriptive activity names.                                                  
-Creates a second, independent tidy data set with the average of each variable for each activity and each subject.       

##
Instruction to run run_analysis.R:                                                                                       
-download zip file and save into work directory                                                                           
-the read.table(choose.files()) function pops up a "select" window, which allows you to choose the txt file you want to read in.(Please refer to the notes in run_analysis.R for which txt file to read)                                                
-run_analysis.R completes the tasks listed under the Goal section and writes a "tidydata.txt" file into your work directory  

##R version:
platform       x86_64-w64-mingw32          
arch           x86_64                      
os             mingw32                     
system         x86_64, mingw32             
status                                     
major          3                           
minor          1.1                         
year           2014                        
month          07                          
day            10                          
svn rev        66115                       
language       R                           
version.string R version 3.1.1 (2014-07-10)
nickname       Sock it to Me       
