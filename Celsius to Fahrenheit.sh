#!/bin/bash

#  Celsius to Fahrenheit.sh
#
#
#  Created by Max Nedorezov on 6/19/15.
#

echo "Enter a temperature in Celsius and then press [ENTER]:"
read celsius
fahrenheit=$[(9 * $celsius) / 5 + 32]
echo "$celsius degrees celsius is $fahrenheit degrees fahrenheit"