#!/bin/bash

# Check if file is provided
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 Property_Tax_Roll.csv" 1>&2
    exit 1
fi

file=$1

# Process the file (comma-separated) and find average TotalAssessedValue for MADISON SCHOOL in TaxJuris4
awk -F ',' '
BEGIN {sum = 0; count = 0}
NR > 1 && $20 ~ /MADISON SCHOOL/ {
    gsub(/[^0-9]/, "", $7) # Clean $7 in case it has weird symbols
    sum += $7
    count++
}
END {
    if (count == 0) {
        print "No matching records found."
        exit 1
    } else {
        print "Average TotalAssessedValue for MADISON SCHOOLS: " sum / count
    }
}' "$file"
