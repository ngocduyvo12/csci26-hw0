#!/bin/bash

#Read input from the user
echo "Enter text: "
read -r input

#Convert input to lowercase
input=$(echo "$input" | tr '[:upper:]' '[:lower:]')

#use associative array to store counts of each letter
declare -A letter_count

#Initialize counts for each letter a-z
for char in {a..z}; do
    letter_count[$char]=0
done

#Count occurrences of each letter in the input
for (( i=0; i<${#input}; i++ )); do
    #extract character at index i
    char="${input:i:1}"
    if [[ $char =~ [a-z] ]]; then
        letter_count[$char]=$((letter_count[$char] + 1))
    fi
done

#Save letter counts to temp file
temp_file="./letter_count_temp.txt"
touch "$temp_file"

#save the results with count greater than 0
for letter in {a..z}; do
    if [[ ${letter_count[$letter]} -gt 0 ]]; then
        echo "${letter_count[$letter]} $letter" >> "$temp_file"
    fi
done

#user numeric reverse to sort
sort -nr "$temp_file" | while read -r count letter; do
    echo "$letter: $count"
done

#cleanup
rm "$temp_file"
