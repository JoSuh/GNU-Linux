#!/bin/bash

# Jo Suh
# Lab 8, April.6, 2019
# This is the script for lab 8
# which will calculate the final grade
# and display the letter grade for a course
# with intger inputs



# prompt the user to enter in grades
# and assigns it to variables
# assume all values entered are integers and are within the requested range of values

echo -n "Enter Assignments mark (0-40):"; read assignment
echo -n "Enter Test 1 mark (0-15):"; read test1
echo -n "Enter Test 2 mark (0-15):"; read test2
echo -n "Enter Final Exam mark (0-30):"; read exam


# calculate the final grade numeric value
# by adding the four input values
finalgrade=$(($assignment+$test1+$test2+$exam))





# convert the numeric grade to a letter grade;
# 90 - 100	A+
# 85 - 89	A
# 80 - 84	A
# 77 - 79	B+
# 73 - 76	B
# 70 - 72	B
# 67 - 69	C+
# 63 - 66	C
# 60 - 62	C
# 57 - 59	D+
# 53 - 56	D
# 50 - 52	D
# 0 - 49	F



# 'switch' the input
case $finalgrade in
	[9][0-9]|[1][0][0]) lettergrade="A+" ;;
	[8][5-9]) lettergrade="A" ;;
	[8][0-4]) lettergrade="A-" ;;
	[7][7-9]) lettergrade="B+" ;;
	[7][3-6]) lettergrade="B" ;;
	[7][0-2]) lettergrade="B-" ;;
	[6][7-9]) lettergrade="C+" ;;
	[6][3-6]) lettergrade="C" ;;
	[6][0-2]) lettergrade="C-" ;;
	[5][7-9]) lettergrade="D+" ;;
	[5][3-6]) lettergrade="S" ;;
	[5][0-2]) lettergrade="D-" ;;
	[0-9]|[0-4][0-9]) lettergrade="F" ;;
	*)	# This would be if the total grade was anything other than 0-100
esac # close case



# display the final numeric and final letter grade
echo -e "\nYour final numeric grade is "$finalgrade", and your final letter grade is "$lettergrade
