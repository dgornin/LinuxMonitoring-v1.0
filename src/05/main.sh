#!/bin/bash

start=$(date +%s)
if [ $# -eq 1 ]
then
    if [[ "${1: -1}" == "/" ]]; 
    then
        if [ -d $1 ]
        then
            source ./search.sh
            search $1
            end=$(date +%s)
            dif=$(( $end - $start ))
            echo "Script execution time (in seconds) = $dif"
        else
            echo "$1 is not a directory"
        fi
    else
        echo "Path should end on '/' char"
    fi
else
    echo "There should be one parameter"
fi
