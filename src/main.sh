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
    echo "Name,Surname,Email,Phone(Home),Phone(Mobile),Address" > "$storage_file"
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
echo
do
    if [ -n "$choice" ]; then
        # run user option
        case "$choice" in
            1)  view_address_book
            ;;
            2)  echo "SEARCH"
            ;;
            3)  echo "ADD"
            ;;
            4)  echo "REMOVE"
            ;;
            5)  echo "EDIT"
            ;;
            *)  echo "CAN NOT RECOGNIZE."
            ;;
        esac
    else
        echo "EMPTY CHOICE. PLEASE CHOOSE AGAIN."
    fi
    
    echo
done
