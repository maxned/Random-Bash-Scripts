#!/bin/sh

#  Records.sh
#
#
#  Created by Max Nedorezov on 7/30/15.
#

declare -a VINArray
declare -a manufacturerArray
declare -a modelArray
declare -a styleArray
declare -a costArray
declare -a priceArray

function displayVehicleInfoAtIndex ()
{
    echo "\nA vehicle matching the high and low price has been found.\n"
    price="$"${priceArray[$1]}
    echo "A ${manufacturerArray[$1]} ${modelArray[$1]} ${styleArray[$1]} with an original price of ${costArray[$1]} has been found for $price. The VIN number is: ${VINArray[$1]}."
}

function searchVehicles () #arguments: lowPrice and highPrice
{
    local atLeastOneVehicleShown="false"

    arrayLength=${#priceArray[@]}
    for ((i=0; i <= $arrayLength - 1; i++))
    do
        if (( $1 < ${priceArray[i]} )) && (( $2 > ${priceArray[i]} )); then
            atLeastOneVehicleShown="true"
            displayVehicleInfoAtIndex $i
        fi
    done

    if [ "$atLeastOneVehicleShown" == "false" ]; then
        echo "No Match Found. Please try again."
    fi
}

function loadVehiclesIntoMemory ()
{
    local collectingVinNumbers="false"
    local collectingManufacturer="false"
    local collectingModel="false"
    local collectingStyle="false"
    local collectingCost="false"

    local count=0
    while read -r line
    do
        if [ "$line" == "VINDONE" ]; then
            collectingVinNumbers=true
        elif [ "$line" == "MANUFACTURERDONE" ]; then
            collectingManufacturer=true
        elif [ "$line" == "MODELDONE" ]; then
            collectingModel=true
        elif [ "$line" == "STYLEDONE" ]; then
            collectingStyle=true
        elif [ "$line" == "COSTDONE" ]; then
            collectingCost=true
        else

            local arrayLength=${#VINArray[@]}

            if [ "$collectingVinNumbers" == "false" ]; then
                VINArray[count]=$line
            elif [ "$collectingManufacturer" == "false" ]; then
                index=$(($count - ${arrayLength}))
                manufacturerArray[index]=$line
            elif [ "$collectingModel" == "false" ]; then
                index=$(($count - ${arrayLength} * 2))
                modelArray[index]=$line
            elif [ "$collectingStyle" == "false" ]; then
                index=$(($count - ${arrayLength} * 3))
                styleArray[index]=$line
            elif [ "$collectingCost" == "false" ]; then
                index=$(($count - ${arrayLength} * 4))
                costArray[index]=$line
            else
                index=$(($count - ${arrayLength} * 5))
                priceArray[index]=$line
            fi

            count=$(( $count + 1 ))
        fi

    done < "inventory.dat"

    echo "Enter a low price and press [ENTER]:"
    read lowPrice

    echo "Enter a high price and press [ENTER]:"
    read highPrice

    searchVehicles $lowPrice $highPrice
}

loadVehiclesIntoMemory