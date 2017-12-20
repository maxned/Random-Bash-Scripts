#!/bin/sh

#  Maximum of Two Values.sh
#
#
#  Created by Max Nedorezov on 7/13/15.
#

function max ()
{
    if (( $1 > $2 ))
    then
        echo $1
    else
        echo $2
    fi
}

echo "Enter the first number and press enter."
read numberOne

echo "Enter the second number and press enter."
read numberTwo

max $numberOne $numberTwo