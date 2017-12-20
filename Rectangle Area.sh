#!/bin/sh

#  Rectangle Area.sh
#
#
#  Created by Max Nedorezov on 7/13/15.
#

function calculateArea ()
{
local area=0
area=$(($1 * $2))

echo "The area of your rectangle is $area square units."
}

echo "Enter the width of a rectangle and press enter."
read width

if (( $width < 0 ))
then
echo "Funny you. Negative width is impossible!"
width=$((0 - $width))
fi

echo "Enter the length of a rectangle and press enter."
read length

if (( $length < 0 ))
then
echo "Funny you. Negative length is impossible!"
length=$((0 - $length))
fi

calculateArea $width $length