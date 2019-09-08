#!/bin/bash
#force the use of the bash shell

# Lab 9
# Jo Suh 040943462
# CST8102 - 302
# myscript.sh
# April.7, 2019
# script that helps user manage (create, delete, change permissions...) of accounts





# This script is purposed for user and group management in Linux
# Assuming that the script is run with elevated permissions


# a menu that gives the user a choice of 5 items labeled A-F and Q
# and a prompt asking for what the user's choice is



# When it runs, choose one menu item
# A message is displayed if an invalid option is chosen
# accepts upper or lower cases
while [ "$userchoice" != "Q" ] && [ "$userchoice" != "q" ]
do

	clear # clear screen

	# NOTE: each comparing part has to be wrapped around spaces

	# contains a menu that gives the user five choices
	# print choices
	echo "Choose one of the following options:
A to Create a user account
B to Delete a user account
C to Change Supplementary Group for a user account
D to Change Initial Group for a user account
E to Change default login shell for a user account
F to Change account expiration date for a user account
Q to Quit"
	# get user choice
	echo -n "What would you like to do?: "; read userchoice




	if [ "$userchoice" = "A" ] || [ "$userchoice" = "a" ]
	then
		# prompt to enter in more info
		echo -n "Enter username to be created: "; read username
		echo -n " Enter user’s home directory (using absolute path): "; read homedirectory
		echo -n " Enter default login shell (using absolute path): "; read defaultloginshell

		# create the user account based on the information
		sudo useradd -d "$homedirectory" -m -s "$defaultloginshell" "$username"





	elif [ "$userchoice" = "B" ] || [ "$userchoice" = "b" ]
	then
		echo -n "Enter username to be deleted: "; read username
		# delete the user account as well as the user’s home directory
		sudo userdel -r "$username"





	elif [ "$userchoice" = "C" ] || [ "$userchoice" = "c" ]
	then
		# prompt for username and
		# supplementary group name for the user account

		echo -n "Enter username to add supplementary group: "; read username
		echo -n "Enter group name: "; read groupname
		sudo groupadd $gruop # add a group first
		sudo usermod -G "$group" "$username" # modify user





	elif [ "$userchoice" = "D" ] || [ "$userchoice" = "d" ] 
	then
		# prompt for username
		# and initial group for the user account
		# and change the initial group for the user account
		echo -n "Enter username: "; read username 
		echo -n "Enter initial group for the user: "; read initialgroup
		sudo usermod -g "$initialgroup" "$username"





	elif [ "$userchoice" = "E" ] || [ "$userchoice" = "e" ] 
	then
		# prompt for username
		# and shell name
		# and change the default shell for the user account
		echo -n "Enter username: "; read username 
		echo -n "Enter shell name: "; read shellname
		sudo usermod -s "$shellname" "$username"





	elif [ "$userchoice" = "F" ] || [ "$userchoice" = "f" ] 
	then
		# prompt for username
		# and expiration date
		# and change the expiration date for the user account
		# date must be entered as YYYY-MMDD
		echo -n "Enter username: "; read username 
		echo -n "Enter expiration date for the user: "; read expirationdate
		sudo usermod -e "$expirationdate" "$username"






	elif [ "$userchoice" = "Q" ] || [ "$userchoice" = "q" ] 
	then

		# end script
		break
	fi



	# sleep for 3 seconds after each menu item is selected
	# before the loop causes the menu to be redisplayed
	sleep 3

done



