# This program will print a histogram distribution of numerical 
# data of a file that contains numbers in between 0-9.

#!/bin/bash

# checks number of arguments variable
if [ $# -ne 1 ]
then
        echo "You must pass a filename as an argument!"
        echo "Example: ./myprog1.sh file.txt"
        exit 1
fi

# declaring and initializing an array. Each element represents
# the number of occurences of each number (0-9)
numbers=(0 0 0 0 0 0 0 0 0 0)

# reading the number at each line
while read line
do
	# case statements to update the occurence of the number read by incrementing it
        case $line in
                "0") numbers[0]=$((numbers[0] + 1));;
                "1") numbers[1]=$((numbers[1] + 1));;
                "2") numbers[2]=$((numbers[2] + 1));;
                "3") numbers[3]=$((numbers[3] + 1));;
                "4") numbers[4]=$((numbers[4] + 1));;
                "5") numbers[5]=$((numbers[5] + 1));;
                "6") numbers[6]=$((numbers[6] + 1));;
                "7") numbers[7]=$((numbers[7] + 1));;
                "8") numbers[8]=$((numbers[8] + 1));;
                "9") numbers[9]=$((numbers[9] + 1));;
                *) echo "Each line must contain a number (0-9)!"
                   exit 1;;
        esac
# using input redirection to get the input from the file (that is the first argument $1)
done < $1

# a nested for loop to iterate through the numbers array and print asterisks according to the number of occurences stored
for (( number = 0; number <= 9; number++ ))
do
	# -n option does not add a newline character
        echo -n $number " "
        for (( i = 0; i < numbers[number]; i++))
        do
            echo -n "*"
        done
	# adds a new line at the end of the line
        echo
done
