#!/bin/bash

color () {
    local output='\033['
    if [ $1 -eq 1 ]; then output='\033[1;97m'; fi
    if [ $1 -eq 2 ]; then output='\033[1;91m'; fi
    if [ $1 -eq 3 ]; then output='\033[1;92m'; fi
    if [ $1 -eq 4 ]; then output='\033[1;94m'; fi
    if [ $1 -eq 5 ]; then output='\033[0;35m'; fi
    if [ $1 -eq 6 ]; then output='\033[0;30m'; fi

    if [ $2 -eq 1 ]; then output="${output}\033[107m"; fi
    if [ $2 -eq 2 ]; then output="${output}\033[101m"; fi
    if [ $2 -eq 3 ]; then output="${output}\033[102m"; fi
    if [ $2 -eq 4 ]; then output="${output}\033[104m"; fi
    if [ $2 -eq 5 ]; then output="${output}\033[45m"; fi
    if [ $2 -eq 6 ]; then output="${output}\033[40m"; fi

    echo "${output}"
}
