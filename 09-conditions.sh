#!/bin/bash

NUMBER=25

# -gt -> greater than
# -lt -> less than
# -eq -> equal to
# -ne -> not equal to
if [ $NUMBER -gt 20 ]; then
    echo "Given number: $NUMBER is greater than 20"
fi    