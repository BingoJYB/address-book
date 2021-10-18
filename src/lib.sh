#!/bin/bash

view_address_book () {
    while IFS=, read -r name surname email phone; do
        printf "%-14s %-17s %-15s %-20s\n" "$name" "$surname" "$email" "$phone"
    done < $1
}

search_contact_person () {
    fullname=(${2//,/ })
    
    if (( ${#fullname[@]} == 2 )); then
        count=0
        
        while IFS=, read -r name surname email phone; do
            count=$((count+1))
            
            if [[ "${fullname[0],,}" == "${name,,}" && "${fullname[1],,}" == "${surname,,}" || $count == 1 ]]; then
                printf "%-14s %-17s %-15s %-20s\n" "$name" "$surname" "$email" "$phone"
                
                if [[ $count != 1 ]]; then
                    break
                fi
            fi
        done < $1
    else
        echo "INVALID NAME LENGTH!!!"
    fi
}