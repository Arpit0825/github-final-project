#!/usr/bin/env bash

echo "Simple Interest Calculator"

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the annual rate of interest (%): " rate
read -r -p "Enter the time period (in years): " time

# Validate that each input is a non-negative integer or decimal.
number_re='^[0-9]+([.][0-9]+)?$'
if ! [[ "$principal" =~ $number_re ]] ||
   ! [[ "$rate" =~ $number_re ]] ||
   ! [[ "$time" =~ $number_re ]]; then
    echo "Error: Please enter valid non-negative numbers."
    exit 1
fi

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time"     'BEGIN { printf "%.2f", (p * r * t) / 100 }')

echo "Principal Amount: $principal"
echo "Rate of Interest: $rate%"
echo "Time Period: $time years"
echo "Simple Interest: $interest"
