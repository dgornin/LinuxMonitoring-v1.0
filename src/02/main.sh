#!/bin/bash

if [ $# -eq 0 ]
then
    if [ -f info.sh ]
    then
        source ./info.sh
        info
        echo "Do you want to write data in file? (Y/n)"
        read answer
        if [[ $answer == "Y" || $answer == "y" ]]
        then
            info >> $(date "+%d_%m_%y_%H_%M_%S").status
        fi
    else
        echo "No sorce file info.sh"
    fi
else
    echo "There should be zero parameters"
fi
