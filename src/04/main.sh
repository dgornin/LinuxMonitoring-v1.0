#!/bin/bash

if [ $# -eq 0 ]
then
    if [[ -f 'info.sh' && -f 'color.sh' ]]
    then
        c1=-2
        c2=-6
        c3=-3
        c4=-6
        if [ -f 'color.conf' ]
        then
            tmp1=$(grep "column1_font_color=" color.conf | awk -F"=" '{ print $2 }' | tail -n1)
            if [[ $tmp1 -gt 0 && $tmp1 -lt 7 ]]; then c1=${tmp1}; fi
            tmp2=$(grep "column1_background=" color.conf | awk -F"=" '{ print $2 }' | tail -n1)
            if [[ $tmp2 -gt 0 && $tmp2 -lt 7 ]]; then c2=${tmp2}; fi
            tmp3=$(grep "column2_font_color=" color.conf | awk -F"=" '{ print $2 }' | tail -n1)
            if [[ $tmp3 -gt 0 && $tmp3 -lt 7 ]]; then c3=${tmp3}; fi
            tmp4=$(grep "column2_background=" color.conf | awk -F"=" '{ print $2 }' | tail -n1)
            if [[ $tmp4 -gt 0 && $tmp4 -lt 7 ]]; then c4=${tmp4}; fi
        fi
        source ./info.sh
        source ./color.sh
        flag=0
        IFS=$'\n'
        for line in $(info)
        do
            row1=$(echo $line | awk -F= '{print $1 "="}')
            row2=$(echo $line | awk -F= '{print "" $2}')
            printf "$(color $c1 $c2)%s\033[0m" "${row1}"
            printf "$(color $c3 $c4)%s\033[0m" "${row2}"
            printf "\n"
        done
        printf "\n"
        if [[ $c2 -lt 0 ]]; then printf "Column 1 background = default (%s)\n" $(color_text ${c2}); else printf "Column 1 background = %s (%s)\n" ${c2} $(color_text ${c2}); fi
        if [[ $c1 -lt 0 ]]; then printf "Column 1 font color = default (%s)\n" $(color_text ${c1}); else printf "Column 1 font color = %s (%s)\n" ${c1} $(color_text ${c1}); fi
        if [[ $c4 -lt 0 ]]; then printf "Column 2 background = default (%s)\n" $(color_text ${c4}); else printf "Column 2 background = %s (%s)\n" ${c4} $(color_text ${c4}); fi
        if [[ $c3 -lt 0 ]]; then printf "Column 2 font color = default (%s)\n" $(color_text ${c3}); else printf "Column 2 font color = %s (%s)\n" ${c3} $(color_text ${c3}); fi
    else
        echo "No sorce file info.sh or color.sh"
    fi
else
    echo "There should be zero parameters"
fi
