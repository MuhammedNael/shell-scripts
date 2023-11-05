#!/bin/bash

# Set the directory path
dir_path=""
if [ -z $1 ]; then
	dir_path=$(pwd)
else
	dir_path="$(pwd)/$1"
fi

oldest_file=""

# Find the oldest file by iterating over file names
for current_file in "$dir_path"/*
do
  # Check if the file exists and is a regular file
  if [ -f "$current_file" ]; then
    # Check if current file is the oldest file 
    if [ -z "$oldest_file" ] || [ "$current_file" -ot "$oldest_file" ]; then
      oldest_file="$current_file"
    fi  
  fi
done
# Delete the oldest file by asking user
if [ -n "$oldest_file" ]; then
  echo "Do you want to delete $(basename "$oldest_file")? (y/n):"
  read decision
  if [ "$decision" == "y" ]; then
    rm "$oldest_file"
    echo "1 file deleted"
  fi
else
  echo "There are no any files under the current directory."
fi
