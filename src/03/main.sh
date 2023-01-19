#!/bin/bash

if [ $# -eq 4 ]
then
    if [[ -f 'info.sh' && -f 'color.sh' ]]
    then
        source ./info.sh
        source ./color.sh
        flag=0
        for arg in "$@"
        do
            if [[ $arg -lt 1 || $arg -gt 6 ]]
            then
                flag=1
            fi
        done
        if [[ $flag -eq 0 && $1 != $2 && $3 != $4 ]]
        then
            IFS=$'\n'
            for line in $(info)
            do
                row1=$(echo $line | awk -F= '{print $1 "="}')
                row2=$(echo $line | awk -F= '{print "" $2}')
                printf "$(color $1 $2)%s\033[0m" "${row1}"
                printf "$(color $3 $4)%s\033[0m" "${row2}"
                printf "\n"
            done
        else
            echo "Invalid value of parameters, background cannot be the same as color of letters, rerun it with new parameters"
        fi
    else
        echo "No sorce file info.sh or color.sh"
    fi
else
    echo "There should be four parameters"
fi
