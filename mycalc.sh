#! /bin/bash

# mycalc.sh
# April 9, 2019
# This script file performs basic calculations (+ and -)
# This script does not check if the user inputs are integers



# The parameters are accesible as $1, $2 ...
# counts from 1, not 0




# each function accepts two integer numbers as parameters

add(){
	# adds 2 values together
	echo "The sum of "$1" plus "$2" equals "+$(($1+$2))
}

subtract(){
	# subtracts 2 values (value1-value2)
	echo "The value of "$1" minus "$2" equals "+$(($1-$2))
}



# change echo output:
# referenced from https://stackoverflow.com/questions/2924697/how-does-one-output-bold-text-in-bash/2924755

bold=$(tput bold)
normal=$(tput sgr0)


checkexit(){
        # clears screen and checks if the program should exit or not
        clear
        if [ "$1" = "X" ] || [ "$1" = "x" ]
        then
                clear
                echo "Exitting program..."
                exit 
        fi
}



calculate(){	
	# if the first and last values (the numbers) are not empty
	# perform different operations based on the second value (operator)
	if [ "$2" = "+" ]
	then
		add $1 $3
	elif [ "$2" = "-"]
	then
		subtract $1 $3
	else
		# default, error has occured
		# print error and exit
		echo "Error: invalid operation" >&2; exit 1
	fi

}


program(){

	# if no parameters provided

	# the console:
	# clear screen and display menu 1
	clear
	# --------------------------------
	echo "${bold}Menu 1"
	echo -e "${normal}C) Calculation\nX)Exit"; read userresponse

	checkexit $userresponse
	# --------------------------------
	echo "${bold}Menu 2"
	echo "${normal}Please enter an integer number or ${bold}X${normal} to exit:"; read firstinput

	checkexit $firstinput
	# --------------------------------
	echo "${bold}Menu 3"
	echo -e "${normal}+) Add\n-) Subtract\nX) Exit"; read userresponse

	checkexit $userresponse
	if [ "$userresponse" != "+" ] && [ "$userresponse" != "-" ]
	then
		clear
		# If invalid choice, user should be presented the menu item again
		echo "ERROR: Invalid operation"
		sleep 2
		clear
		continue # go back to the start of while
	else
		# user is prompted to enter a second number
		# --------------------------------
		echo "${bold}Menu 4"
		echo "${normal}Please enter a second integer number or ${bold}X${normal} to exit:"; read secondinput
	
		checkexit $secondinput
		# calculate
		calculate $firstinput $userresponse $secondinput
	fi
	 # wait three seconds
        sleep 3

}


while(true)
do
	# The $# gets the total number of parameters in the call
	if [ $# = 3 ]
	then
		calculate $1 $2 $3
                exit 1
	elif [ $# = 0 ]
	then
		program
	else
		echo "Error: invalid call" >&2; exit
        fi
done




