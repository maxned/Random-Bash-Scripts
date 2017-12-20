#!/bin/sh

#  Payroll Program with Input Validation.sh
#
#
#  Created by Max Nedorezov on 7/25/15.
#

function hoursWorked () # arguments(hoursWorked, payRate)
{
if (( $1 >= 0 )) && (( $1 <= 40 ))
then
    local pay=$(bc <<< "$1 * $2")
    pay="$"$pay
    echo "You should have got paid $pay without taxes and other fees..."
    exit 0
else
    echo "Enter a value between 0 and 40 to try again."
    read enteredNumber
    hoursWorked $enteredNumber $2
fi

}

function payRate ()
{
if (( $(bc <<< "$1 >= 7.5") == 1 )) && (( $(bc <<< "$1 <= 18.25") == 1 ))
then
    echo "Enter the number of hours you worked and press [ENTER]:"
    read enteredNumber
    hoursWorked $enteredNumber $1
else
    echo 'Enter a value between $7.50 and $18.25 to try again.'
    read enteredNumber
    payRate $enteredNumber
fi
}

echo "Enter your hourly pay rate and press [ENTER]:"
read enteredNumber
payRate $enteredNumber