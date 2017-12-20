#!/bin/sh

#  Golf Scores.sh
#
#
#  Created by Max Nedorezov on 7/29/15.
#

declare -a playerNamesArray
declare -a playerScoresArray

function saveGolfInfo ()
{
    arrayLength=${#playerNamesArray[@]}
    for ((i=0; i <= ${arrayLength} - 1; i++))
    do
        echo "${playerNamesArray[$i]}'s score is ${playerScoresArray[$i]}" >> golf.dat
    done
}

function enterGolfScores ()
{
    local count=0
    local currentName

    while [ "$currentName" != "quit" ]
    do
        echo "Enter player name and press [ENTER]:"
        read name
        currentName=$name

        if [ "$name" == "quit" ]
        then
            saveGolfInfo
        else
            playerNamesArray[count]=$name

            echo "Enter ${playerNamesArray[$count]}'s golf score."
            read score
            playerScoresArray[count]=$score

            count=$(($count + 1))
        fi
    done
}

function printSavedGolfScores ()
{
    echo "\nSaved Golf Scores\n"
    filename="$1"
    while read -r line
    do
        name=$line
        echo "$name"
    done < "$filename"

    echo "\n"
}

read -p "Do you want to load saved golf scores? <y/N> " prompt
if [[ $prompt =~ [yY](es)* ]]
then
    printSavedGolfScores golf.dat
else
    echo "Enter the names and scores of the players. To quit adding names type \"quit\" without the quotes and press [ENTER]:"
    enterGolfScores
fi