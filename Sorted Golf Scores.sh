#!/bin/sh

#  Sorted Golf Scores.sh
#
#
#  Created by Max Nedorezov on 7/27/15.
#

function enterGolfScores ()
{
    local -a numberArray
    for ((i=0; i <= 9; i++))
    do
        echo "Enter golf score $(($i + 1))."
        read number
        numberArray[i]=$number
    done

#code for sort taken from here http://www.java-samples.com/showtutorial.php?tutorialid=1374
    for (( i = 0; i <= 9 ; i++ ))
    do
        for (( j = $i; j <= 9; j++ ))
        do
            if [ ${numberArray[$i]} -gt ${numberArray[$j]}  ]; then
                t=${numberArray[$i]}
                numberArray[$i]=${numberArray[$j]}
                numberArray[$j]=$t
            fi
        done
    done

    echo -e "\nSorted Numbers in Ascending Order:"
    for (( i=0; i <= 9; i++ ))
    do
        echo ${numberArray[$i]}
    done
}

enterGolfScores