#!/bin/sh

#  Color Mixer.sh
#
#
#  Created by Max Nedorezov on 7/3/15.
#

declare color1
declare color2
declare color1IsValid=false
declare color2IsValid=false

function getFirstColor ()
{
    echo "Enter a primary color of red, yellow, or blue and then press [ENTER]:"
    read color
    color1=$color

    checkIfFirstColorIsCorrect
}

function checkIfFirstColorIsCorrect ()
{
    if ([ "$color1" == "red" ] || [ "$color1" == "yellow" ] || [ "$color1" == "blue" ]) && [ $color1IsValid == false ]
    then
        color1IsValid=true
        getSecondColor
    else
        getFirstColor
    fi

    if ([ "$color2" == "red" ] || [ "$color2" == "yellow" ] || [ "$color2" == "blue" ]) && [ $color2IsValid == false ]
    then
        color2IsValid=true
        showSecondaryColor
    else
        getSecondColor
    fi
}

function getSecondColor ()
{
    echo "Enter another primary color of red, yellow, or blue and then press [ENTER]:"
    read color
    color2=$color
}

function showSecondaryColor ()
{
    if [ "$color1" == "$color2" ]
    then

        color1+="s"
        echo "\nTwo $color1 make $color2, DUH!!!\n"

        color1=""
        color2=""

        color1IsValid=false
        color2IsValid=false

        echo "Try again!\n"
        getFirstColor

    else

        if [ "$color1" == "red" ] || [ "$color2" == "red" ]
        then
            if [ "$color1" == "blue" ] || [ "$color2" == "blue" ]
            then
                echo "Your secondary color is purple!"
            else
                echo "Your secondary color is orange!"
            fi
        else
            echo "Your secondary color is green!"
        fi
    fi
}

getFirstColor
