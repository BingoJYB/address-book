#!/bin/bash

view_address_book () {
    while IFS=, read -r name surname email phone; do
        printf "%-14s %-17s %-15s %-20s\n" "$name" "$surname" "$email" "$phone"
    done < $1
}

search_contact_person () {
    name=($1//,/ )
    
    if (( ${#name[@]} != 2 )); then
        return 1
    fi
}