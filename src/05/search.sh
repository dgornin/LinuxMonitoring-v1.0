#!/bin/bash

search () {
    printf "Total number of folders (including all nested ones) = $(sudo find $1 -type d 2> /dev/null | wc -l)\n"
    printf "TOP 5 folders of maximum size arranged in descending order (path and size):\n"
    printf "$(sudo du $1 -h 2>/dev/null | sort -hr | head -5 | awk '{print "-",$2",", $1"b"}' | nl)\n"
    printf "Total number of files = $(sudo find $1 -type f 2> /dev/null | wc -l)\n"
    printf "Number of:\n"
    printf "Configuration files (with the .conf extension) = $(sudo find $1 -name "*.conf" | wc -l)\n"
    printf "Text files = $(sudo find $1 -name "*.txt"  2> /dev/null | wc -l)\n"
    printf "Executable files = $(sudo find $1 -type f -executable  2> /dev/null | wc -l)\n"
    printf "Log files (with the extension .log) = $(sudo find $1 -name "*.log"  2> /dev/null | wc -l)\n"
    printf "Archive files = $(sudo find $1 -name '*.tar' -o -name '*.zip' -o -name '*.7z' -o -name '*.rar' 2> /dev/null | wc -l)\n"
    printf "Symbolic links = $(sudo find $1 -type l  2> /dev/null | wc -l)\n"
    printf "TOP 10 files of maximum size arranged in descending order (path, size and type):\n"
    # printf "$(sudo find $1 -type f -exec du -h {} \; | sort -rh | head -10 | cat -n | awk '{print $1 " - " $3 ", " $2}')\n"
    out="$(find "$1" -type f -not -path '*/\.*' -exec du -h {} + 2>/dev/null | sort -hr | head -n 10 )"
    IFS=$'\n'
    count=0
    for var in $out
    do
        ((count += 1))
        file=$(echo "$var" | awk '{print $2}')
        size=$(echo "$var" | awk '{print $1}' | sed -e 's:K: Kb:g' | sed 's:M: Mb:g' | sed 's:G: Gb:g' )
        type=$(echo "$var" | awk '{ tp=split($2,type,".") ; print type[tp] }' )
        printf "%d - %s, %s, %s\n" $count "$file" "$size" "$type"
    done
    printf "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):\n"
    out="$(sudo find $1 -type f -executable -exec du -h {} + 2> /dev/null | sort -hr | head -n 10)"
    IFS=$'\n'
    count=0
    for var in $out
    do
        ((count += 1))
        file=$(echo "$var" | awk '{print $2}')
        size=$(echo "$var" | awk '{print $1}' | sed -e 's:K: Kb:g' | sed 's:M: Mb:g' | sed 's:G: Gb:g')
        hex=$(md5sum "$file"|  awk '{print $1}')
        printf "%d - %s, %s, %s\n" $count "$file" "$size" "$hex"
    done
}
