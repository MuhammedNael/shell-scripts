#!/bin/bash

# Check if there are any arguments
if [ $# -eq 0 ]; then
	echo "Please give an argument and run again!"
fi

# Check whether the input format is correct or not
if [ ${#2} -eq 1 ] || [ ${#1} -eq ${#2} ]; then
	# Take the inputs as an argument from the user
	string="$1"
	number="$2"
	# Alphabet array to keep the indexes of the corresponding letters
	alphabet=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")
	
	resulting_string=""

 
	index=-1	# Index of the current char that is being ciphered
	num=-1		# Number that cipheres
	
	# Ciphere the string iteratively
	for (( i=0; i<${#string}; i++ )); do
		current_char="${string:$i:1}"	# Current char of the string
		# Find the index in the alphabet of the current char
		for j in "${!alphabet[@]}"; do
	  		if [ "${alphabet[$j]}" == "$current_char" ]; then
	    			index=$j
	    			break
	  		fi
	  	done
	  	# If the number is one digit
	  	if [ ${#number} -eq 1 ]; then
	  		num=$number
	  	else
	  		num="${number:$i:1}"
	  	fi
	  	index=$((index+num))
	  	# If the resulting string is over the alphabet
	  	if [ $index -gt 25 ]; then
	  		index=$((index-26))
	  	fi
	  	resulting_string+="${alphabet[$index]}"
	done 

	echo $resulting_string
else
	echo "Incorrect input format! Check and run it again!"
fi
