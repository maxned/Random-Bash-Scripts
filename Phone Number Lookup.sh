#!/bin/sh

#  Phone Number Lookup.sh
#
#
#  Created by Max Nedorezov on 7/27/15.
#

declare people=( "Anton" "David" "Pavel" "Oleg" "Denis" "Diana" "Vlad" )
declare phoneNumbers=( "(916) 012-3456" "(916) 123-4567" "(916) 234-5678" "(916) 345-6789" "(916) 456-7890" "(916) 567-8901" "(916) 678-9012" )

function searchForNumberWithName () # is passed a name
{
    local count=0
    for i in "${people[@]}"
    do
        if [[ "$i" == *$1* ]]; then
            echo "The phone number for $i is ${phoneNumbers[count]}"
            exit 0
        fi
    count=$(( $count + 1 ))
    done

    echo "No phone number for $1 was found. Please try again."
}

echo "Enter the name of one of my friends to get their fake phone number and press [ENTER]:"
read name
searchForNumberWithName $name