#!/bin/bash

if [ "$#" -eq 1 ]; then
    re='^[+-]?[0-9]+([.][0-9]+)?$'
    if [[ $1 =~ $re ]]; then
        echo "Argument should be string not an integer"
    else
        echo "$1"
    fi
else
    echo "To many or no arguments, program expect only one"
fi
