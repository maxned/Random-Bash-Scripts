#!/bin/sh

#  Insurance.sh
#
#
#  Created by Max Nedorezov on 6/22/15.
#

function calculate () #Arguments: cost and insurance amount
{
    local cost=$(bc <<< "$1 * $2")
    echo "$cost"
}

echo "Enter the cost of your house or building and then press [ENTER]:"
read cost
insuranceCost=$(calculate $cost .8)
echo "You should insure your house or building for at least $insuranceCost dollars"