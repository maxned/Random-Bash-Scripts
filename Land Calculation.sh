#!/bin/bash

#  Land Calculation.sh
#
#
#  Created by Max Nedorezov on 6/19/15.
#

# this function div I found here: http://stackoverflow.com/questions/12147040/division-in-script-and-floating-point/24431665#24431665
# the rest of the program I wrote by myself

div ()  # Arguments: dividend and divisor
{
if [ $2 -eq 0 ]; then echo division by 0; exit; fi
local p=12                            # precision
local c=${c:-0}                       # precision counter
local d=.                             # decimal separator
local r=$(($1/$2)); echo -n $r        # result of division
local m=$(($r*$2))
[ $c -eq 0 ] && [ $m -ne $1 ] && echo -n $d
[ $1 -eq $m ] || [ $c -eq $p ] && return
local e=$(($1-$m))
let c=c+1
div $(($e*10)) $2
}

echo "Enter the total square feet of land and press [ENTER]:"
read squareFeet
numberOfAcres=$(div $squareFeet 43560)
echo "Your land is $numberOfAcres acres"