#!/bin/bash

echo "*******************************************************************************************************"
echo "*     *      * * *   * * *   * * *   * * * *   *  *   *  *        * * *    * * *     * * *   *    *   *"
echo "*    *  *    *    *  *    *  *    *  *       *       *            *    *  *     *   *     *  *   *    *"
echo "*   *    *   *     * *     * * * *   * * * *   * *     * *        * * *  *       * *       * * *      *"
echo "*  * *  * *  *    *  *    *  *   *   *             *       *      *    *  *     *   *     *  *   *    *"
echo "* *        * * * *   * * *   *     * * * * *  * * *   * * *       * * *    * * *     * * *   *     *  *"
echo "*******************************************************************************************************"

# import other scripts
current_dir="$(dirname "$0")"
. "$current_dir/lib.sh"

# check storage file existing, if not, create it
storage_file="address_book.csv"

if ! [ -e "$storage_file" ]; then
    touch "$storage_file"
    printf "Name,Surname,Phone,Email\n" > "$storage_file"
fi

# get user input, if not provided, keep asking for
while
echo "WHAT DO YOU WNAT TO DO?"
echo "1. VIEW"
echo "2. SEARCH"
echo "3. ADD"
echo "4. REMOVE"
echo "5. EDIT"
echo -n "YOUR CHOICE (1/2/3/4/5): "
read choice
do
    if [ -n "$choice" ]; then
        # run user option
        case "$choice" in
            1)  echo
                view_address_book "$storage_file"
            ;;
            2)  echo -n "PLEASE ENTER CONTACT PERSON (NAME,SURNAME): "
                read name
                search_contact_person "$storage_file" "$name"
            ;;
            3)  echo "ADD"
            ;;
            4)  echo "REMOVE"
            ;;
            5)  echo "EDIT"
            ;;
            *)  echo
                echo "CAN NOT RECOGNIZE."
            ;;
        esac
    else
        echo "EMPTY CHOICE. PLEASE CHOOSE AGAIN."
    fi
    
    echo
done
