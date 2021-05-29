#!/bin/bash

printf "What do you want: \n1. Launch an Apk \n2. List Packages\n\nchoise :"
read choice

if [ $choice == 1 ]; then

    printf "Enter package name :"
    read package

    adb shell monkey -p ${package} -c android.intent.category.LAUNCHER 1 

elif [ $choice == 2 ]; then
    
    printf "filter by name :"
    read filter

    printf "\t\tHere are your List of Packages\n----------------------------------------------------------------------------------------------------\n"
    for i in $(adb shell pm list packages | cut -d= -f 1 | cut -d ":" -f 2 | grep ''$filter); do
    
        echo $i 
        
    done
fi
