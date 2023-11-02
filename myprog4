#!/bin/bash

# Check if a filename is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 1
fi

# Store the filename from the command-line argument
filename="$1"

# Function to replace numbers with text
replace_numbers_with_text() {
    # Read the content of the specified file into the 'text' variable
    text=$(cat "$filename")

    # Replace all occurrences of the digit '0' with the word 'zero'
    text=${text//0/zero}
    # Replace all occurrences of the digit '1' with the word 'one'
    text=${text//1/one}
    # Replace all occurrences of the digit '2' with the word 'two'
    text=${text//2/two}
    # Replace all occurrences of the digit '3' with the word 'three'
    text=${text//3/three}
    # Replace all occurrences of the digit '4' with the word 'four'
    text=${text//4/four}
    # Replace all occurrences of the digit '5' with the word 'five'
    text=${text//5/five}
    # Replace all occurrences of the digit '6' with the word 'six'
    text=${text//6/six}
    # Replace all occurrences of the digit '7' with the word 'seven'
    text=${text//7/seven}
    # Replace all occurrences of the digit '8' with the word 'eight'
    text=${text//8/eight}
    # Replace all occurrences of the digit '9' with the word 'nine'
    text=${text//9/nine}

    # Overwrite the original file with the modified text
    echo "$text" > "$filename"
}

# Call the function to perform the number-to-text replacement
replace_numbers_with_text

# Display a message indicating that the numbers have been replaced
echo "Numbers in $filename have been replaced with text."
