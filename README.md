# Repository of STAT547 Homework 09
This repostory contains scripts that allow users to plot a number of plots and tables by running "make" in terminal or clicking "build" button in RStudio. The plots show the relationship between the first and the last letter of English words, i.e. whether they are same or not.

## Changes that were made
I added two files: a letter.R and a report_yd.Rmd. The R script generates two tables that contain data relavant to the first and the last letter of English words. One table shows the number of English words that have the first letter same as/different from the last letter. The other table shows the interval between the first and last letter if they are differnt. E.g the interval between "a" and "c" is 2. The Rmd file communicate with the Makefile and is rendered as .pdf. Further, I used dir.create() to create folders automatically and stores the words.txt in "data", tables as .tsv files in "src", and the plots in "output". 

Original files are stored in the folder named "jennybc_original" in this repository. It can also be accessed [here](https://github.com/STAT545-UBC-students/hw09-liuyadong08/tree/master/jennybc_original). 