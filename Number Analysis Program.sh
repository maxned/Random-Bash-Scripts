#!/bin/sh

#  Number Analysis Program.sh
#
#
#  Created by Max Nedorezov on 7/27/15.
#

function doStuffWithNumbers ()
{
    local -a numberArray
    for ((i=0; i <= 19; i++))
    do
        echo "Enter number $(($i + 1))."
        read number
        numberArray[i]=$number
    done

# code for the max and min borrowed from http://stackoverflow.com/a/13634471/1565875
    max=${numberArray[0]}
    min=${numberArray[0]}

    for i in "${numberArray[@]}"
    do
        # Update max if applicable
        if [[ "$i" -gt "$max" ]]; then
        max="$i"
        fi

        # Update min if applicable
        if [[ "$i" -lt "$min" ]]; then
        min="$i"
        fi
    done

    local sum=0

    for ((i=0; i <= 19; i++))
    do
        sum=$(($sum + numberArray[i]))
    done

    echo "The lowest number in the array is $min."
    echo "The highest number in the array is $max."
    echo "The sum of the numbers in the array is $sum."

    average=$(bc <<< "scale=2; $sum / 20")
    echo "The average of the numbers in the array is $average."
}

doStuffWithNumbers