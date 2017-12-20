#!/bin/sh

#  Pennies for Pay.sh
#
#
#  Created by Max Nedorezov on 7/4/15.
#

declare salary=0
function calculateSalary ()
{
    for ((i=0; i <= $1 - 1; i++))
    do
        local pay=$(bc <<< "scale=2; 2^$i/100")
        salary=$(bc <<< "scale=2; $salary + $pay")
        pay="$"$pay
        echo "Your pay for day $(($i + 1)) was $pay."
    done

    salary="$"$salary
    echo "Your total salary was $salary."
}

echo "Enter the number of days you worked and then press [ENTER]:"
read days
calculateSalary $days