#!/bin/sh

#  Speeding Violation Calculator.sh
#
#
#  Created by Max Nedorezov on 7/25/15.
#

function driverSpeed () # arguments(driverSpeed, speedLimit)
{
if (( $1 > $2 ))
then
    echo "You were speeding $(($1 - $2)) miles over the speed limit. Good job for breaking the law."
    exit 0
else
    echo "How would you be speeding if you were going at the speed limit or below it? Please use common sense and try again."
    read enteredNumber
    driverSpeed $enteredNumber $2
fi
}

function speedLimit ()
{
if (( $1 >= 20 )) && (( $1 <= 70 ))
then
    echo "Enter the speed that you were going and press [ENTER]:"
    read enteredNumber
    driverSpeed $enteredNumber $1
else
    echo "Enter a value between 20 and 70 to try again."
    read enteredNumber
    speedLimit $enteredNumber
fi
}

echo "Enter the speed limit and press [ENTER]:"
read enteredNumber
speedLimit $enteredNumber