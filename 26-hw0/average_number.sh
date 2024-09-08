#!/bin/bash

#Initialize variables
sum=0
count=0
max_value=None
min_value=None

#update max and min
update_min_max() {
    if [ "$max_value" = "None" ] || [ "$1" -gt "$max_value" ]; then
        max_value=$1
    fi

    if [ "$min_value" = "None" ] || [ "$1" -lt "$min_value" ]; then
        min_value=$1
    fi
}

echo "Enter non-zero integers (Enter 0 to stop):"

while true; do
    read -r number
    if [ "$number" -eq 0 ]; then
        break
    fi

    sum=$((sum + number))
    count=$((count + 1))

    update_min_max "$number"
done

if [ "$count" -eq 0 ]; then
    echo "No numbers entered."
else
    # Output sum and number counts
    echo "Sum: $sum"
    echo "Number's count: $count"

    # Calculate the average
    average=$(echo "scale=2; $sum / $count" | bc)

    # Output max value and min value to console
    echo "Max Value: $max_value"
    echo "Min Value: $min_value"
    # Calculate the difference between max and min
    diff=$((max_value - min_value))

    # Output the results
    echo "Average: $average"
    echo "Difference between largest and smallest number: $diff"
fi