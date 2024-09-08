#!/bin/bash

#Array of numbers of days for each month
days_in_month=(31 28 31 30 31 30 31 31 30 31 30 31)

#convert month name to month number
month_to_number() {
  month_lower=$(echo "$1" | tr '[:upper:]' '[:lower:]')
  case "$month_lower" in
    jan) echo 1 ;;
    feb) echo 2 ;;
    mar) echo 3 ;;
    apr) echo 4 ;;
    may) echo 5 ;;
    jun) echo 6 ;;
    jul) echo 7 ;;
    aug) echo 8 ;;
    sep) echo 9 ;;
    oct) echo 10 ;;
    nov) echo 11 ;;
    dec) echo 12 ;;
    *) echo "Invalid month"; exit 1 ;;
  esac
}

#validate that the day entered is valid: eg. oct 32 is not valid
validate_day() {
  month=$1
  day=$2

  max_day=${days_in_month[$((month-1))]}

  if (( day < 1 || day > max_day )); then
    echo "Invalid day for the given month. $day exceeds the maximum of $max_day for this month."
    exit 1
  fi
}

#calculate the day of the year from month and day
day_of_year() {
  month=$1
  day=$2
  total_days=0

  #Loop through the months and get total number of days leading to the given month
  for (( i=0; i<$((month-1)); i++ )); do
    total_days=$((total_days + days_in_month[i]))
  done

  #Add the days of the given month to the total number of days leading to this month
  total_days=$((total_days + day))
  echo $total_days
}

#Read first date
read -p "Enter the first date (Format: Jul 4): " month1 day1
month_num1=$(month_to_number $month1)
validate_day $month_num1 $day1

#Read second date
read -p "Enter the second date (Format: Oct 31): " month2 day2
month_num2=$(month_to_number $month2)
validate_day $month_num2 $day2

#Calculate the day of the year for both dates
day1_of_year=$(day_of_year $month_num1 $day1)
day2_of_year=$(day_of_year $month_num2 $day2)

#Calculate the difference between the two dates
difference=$((day2_of_year - day1_of_year))

#Output the result
echo "Number of days between $month1 $day1 and $month2 $day2: $difference days"
