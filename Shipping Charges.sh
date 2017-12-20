#!/bin/sh

#  Shipping Charges.sh
#
#
#  Created by Max Nedorezov on 7/3/15.
#

function calculateCharge () #Arguments: weight and charge per pound
{
    local cost=$(bc <<< "$1 * $2")
    cost="$"$cost
    echo "The shipping charge is $cost."
}

echo "Enter the weight of your package in pounds and then press [ENTER]:"
read weight

if (( $(bc <<< "$weight <= 2") == 1 ))
then
    calculateCharge $weight 1.10
elif (( $(bc <<< "$weight > 2") == 1 )) && (( $(bc <<< "$weight <= 6") == 1 ))
then
    calculateCharge $weight 2.20
elif (( $(bc <<< "$weight > 6") == 1 )) && (( $(bc <<< "$weight <= 10") == 1 ))
then
    calculateCharge $weight 3.70
else
    calculateCharge $weight 3.80
fi

