#!/bin/bash

view_address_book () {
    while IFS=, read -r name surname email phone; do
        printf "%-14s %-17s %-15s %-20s\n" "$name" "$surname" "$email" "$phone"
    done < $1
}

search_contact_person () {
    res=$( sed -nr "/^$2/p" "$1" )
    
    if [[ -n "$res" ]]; then
        echo -e "\n$res"
    else
        echo -e "\nDO NOT FIND"
    fi
}

add_contact_person () {
    echo "$2,$3,$4,$5" >> "$1"
    
    if [[ "$?" == 0 ]]; then
        echo -e "\nADD CONTACT PERSON SUCCEEDS"
    else
        echo -e "\nADD CONTACT PERSON FAILS"
    fi
}

remove_contact_person () {
    res=$( sed -nr "/\<$2\>/p" "$1" )
    
    if [[ -n "$res" ]]; then
        echo -e "\nREMOVE $res"
        sed -i "/\<$2\>/d" "$1"
    else
        echo -e "\nNO RECORD IS REMOVED"
    fi
}