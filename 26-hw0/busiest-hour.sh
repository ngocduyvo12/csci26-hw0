#!/bin/bash

#command break down:
#awk -F';' -v day="$1" '$3 == "day="day { print substr($4, 4, 2) }' sched: go through the sched file and extract the hours from the TI field
#sort: Sorts the extracted hours in ascending order. Need to do this first or uniq -c just reset the count every time the hours entry changes
#uniq -c: Counts the occurrences of each unique hour.
#sort -nr: Sorts the result by the number of occurrences in descending order.
#head -n 1: Outputs the hour with the most records and the number of records for that hour.
awk -F';' -v day="$1" '$3 == "day="day { print substr($4, 4, 2) }' sched | sort | uniq -c | sort -nr | head -n 1
