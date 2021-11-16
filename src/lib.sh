#!/bin/bash

view_address_book () {
    while IFS=, read -r name surname email phone; do
        printf "%-14s %-17s %-15s %-20s\n" "$name" "$surname" "$email" "$phone"
    done < $1
}

search_contact_person () {
    sed -nr "/\<$2,$3\>/p" "$1"
}

add_contact_person () {
    echo "$2,$3,$4,$5" >> "$1"
}

remove_contact_person () {
    sed -i "/\<$2,$3\>/d" "$1"
}
