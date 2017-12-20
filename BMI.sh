#!/bin/sh

#  BMI.sh
#
#
#  Created by Max Nedorezov on 6/22/15.
#

function calculate () #Arguments: weight and height
{
local bmi=$(bc <<< "$1 * 703/($2^2)")
echo "$bmi"
}

echo "Enter your weight in lbs and then press [ENTER]:"
read weight

echo "Enter your height in inches and then press [ENTER]:"
read height

bmi=$(calculate $weight $height)
echo "Your BMI is $bmi."