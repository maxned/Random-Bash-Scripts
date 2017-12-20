#!/bin/sh

#  Sales Report.sh
#
#
#  Created by Max Nedorezov on 7/30/15.
#

declare -a IDArray
declare -a amountArray

function printFileData ()
{
    local differentIDIndex=0
    local totalSales=0
    arrayLength=${#IDArray[@]}
    for ((i=0; i <= $arrayLength - 1; i++))
    do
        amount=${amountArray[i]}
        amount="$"$amount
        echo "${IDArray[i]} - $amount"

        if (( $i != 0 )); then
            local nextIndex=$(($i + 1))
            if [[ "${IDArray[i]}" != "${IDArray[nextIndex]}" ]]; then
                local sales=0
                for ((j=$differentIDIndex; j <= $i; j++))
                do
                    sales=$(($sales + ${amountArray[j]}))
                done
                differentIDIndex=$(($i + 1))
                sales="$"$sales
                echo "Total sales for this salesperson: $sales"
            fi
        fi

        totalSales=$(($totalSales + ${amountArray[i]}))
    done

    totalSales="$"$totalSales
    echo "Total of all sales: $totalSales"
}

function collectFileData ()
{
    local collectingIDArray="false"

    local count=0
    while read -r line
    do
        if [[ "$line" -eq "IDNUMBERSDONE" ]]; then
            collectingIDArray=true
        else

            if [ "$collectingIDArray" == "false" ]
            then
                IDArray[count]=$line
            else
                local arrayLength=${#IDArray[@]}
                index=$(($count - ${arrayLength}))
                amountArray[index]=$line
            fi

            count=$(( $count + 1 ))
        fi
    done < "salesreport.txt"

    printFileData
}

echo "Brewster's Used Cars, Inc."
echo "Sales Report"
echo "\n"
echo "Salesperson ID - Sale Amount"
collectFileData