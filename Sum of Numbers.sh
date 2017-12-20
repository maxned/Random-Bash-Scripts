#!/bin/sh

#  Sum of Numbers.sh
#
#
#  Created by Max Nedorezov on 7/4/15.
#

declare sum=0

function sumOfNumbers ()
{
    if (( $1 < 0 ))
    then
        echo "Your sum is $sum."
    exit 0
    fi

    sum=$(($sum + $1))

    echo
    read enteredNumber
    sumOfNumbers $enteredNumber
}

echo "Enter a positive number and then press [ENTER]: To quit adding numbers enter a negative number."
read enteredNumber
sumOfNumbers $enteredNumber