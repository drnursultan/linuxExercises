#!/bin/bash

# Initialize sum
sum=0

# Loop through numbers 1000 to 2000
for number in {1000..2000}; do
    # Check if the number only contains digits 0 or 1
    if [[ $number =~ ^[01]+$ ]]; then
        sum=$((sum + number))
    fi
done

# Output the result
echo "Sum of numbers between 1000 and 2000 with only digits {0,1}: $sum"
