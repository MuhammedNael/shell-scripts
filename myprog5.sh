#!/bin/bash

# This shell script takes a wildcard argument and may take a -R option
# to run the program recursively. The program finds all the files that
# obeys the wildcard and copy them into a directory named 'copied'.

# the recursive function
recursive_copy() {
    
    # set boolean for not making a directory if no file obeys the wildcard
    obeys_wildcard=0
    for file in $wildcard
    do
        if [ -e "$file" ] 
        then
            obeys_wildcard=1
            break
        fi
    done

    # make directory when obeying file exists
    if [ $obeys_wildcard -eq 1 ]
    then
        if [ ! -d "copied" ]; then
            mkdir copied
        fi
    fi
    
    # copy that obeys the wildcard in the current directory into the new directory 'copied'
    for file in $wildcard
    do
        if [ -f "$file" ] 
        then
            cp "$file" copied
        fi
    done
    
    if [ "$option" != "-R" ]
    then 
        return
    fi
    
    directories=()
    # store all files into this array for later to check each directory
    files_in_directory=(*)
    num_of_files=${#files_in_directory[@]}
    
    j=0 # index of elements inside directories()
    for (( i = 0; i < num_of_files; i++ ))
    do
        # get ith file element. Double quotes ensure file with spaces are handled
        file="${files_in_directory[i]}"
        # check if it is a directory, if it is then store into directories()
        if [ -d "${file}" ] && [ "${file}" != "copied" ]
        then
            directories[j]="${file}"
            j=`expr $j + 1`
        fi
    done
    
    # base case
    num_of_dir=${#directories[@]}
    if [ $num_of_dir -eq 0 ]
    then 
        return
    fi
    
    # recursively calling each directory in current directory
    for dir in ${directories[@]}
    do
        (cd "$dir" && recursive_copy)
    done
    
}

# terminate if number of arguments is less than 1 or greater than 2
if [ $# -lt 1 ] || [ $# -gt 2 ]
then
        echo "You must pass a valid wildcard argument, and you may pass -R option argument before the wildcard."
        echo "Examples: "
        echo "./myprog5.sh -R \"c*.txt\""
        echo "./myprog5.sh \"c*.txt\""
        exit 1
fi

wildcard=""
option=""
if [ $# -eq 1 ]
then
    wildcard=$1
    option=""
else
    wildcard=$2
    option=$1
fi

recursive_copy

