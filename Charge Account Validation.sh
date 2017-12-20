#!/bin/sh

#  Charge Account Validation.sh
#
#
#  Created by Max Nedorezov on 7/27/15.
#

declare accounts=( 5658845 4520125 7895122 8777541 8451277 1302850 8080152 4562555 5552012 5050552 7825877 1250255 1005231 6545231 3852085 7576651 7881200 4581002 )

function checkAccountNumber ()
{
    for i in "${accounts[@]}"
    do
        if [[ "$i" == $1 ]]; then
            echo "The number you entered is valid. Good job."
            exit 0
        fi
    done

    echo "The number you entered is invalid. Try again."
}

echo "Enter a charge account number and press [ENTER]:"
read number
checkAccountNumber $number