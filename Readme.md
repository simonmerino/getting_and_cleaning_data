# getting_and_cleaning_data
This repo contains code for the exercise requested in the Getting and Cleaning Data final exam. This code is in the file run_analysis.R

The code does the following:

- Load files into data structures, both Test and Train files.
- Row merges them
- Removes some unwanted numbers from Activity and Feature data frames
- Removes all measurements that are not mean or std.
- Replaces activity number by activity strings
- Combines all datasets
- Summarizes datasets based on subject and activity.


The codebook is placed under file CodeBook.md. It is a modification  of the codebook originally delivered with the exam data.
