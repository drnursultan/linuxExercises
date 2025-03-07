#!/bin/bash

# Check if column number is provided (at least 1 argument is required)
if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "Usage: $0 <column> [file.csv]" 1>&2
    exit 1
fi

column=$1

# If file.csv is provided, use it; otherwise, read from stdin
if [[ -n $2 ]]; then
    file="$2"
else
    file="/dev/stdin"
fi

# Extract the required column (ignoring the header), then compute the mean
cut -d ',' -f $column "$file" | tail -n +2 | {
    sum=0
    count=0
    while read value; do
        sum=$(echo "$sum + $value" | bc)
        count=$((count + 1))
    done
    if [[ $count -eq 0 ]]; then
        echo "No numeric data found in column $column."
        exit 1
    fi
    mean=$(echo "scale=2; $sum / $count" | bc)
    echo "Mean of column $column: $mean"
}
