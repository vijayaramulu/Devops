#!/bin/bash
############################
# Purpose: To learn until loop
# Owner  : info@mycompnay.com
# Version: 1.0
# Input  : Not needed
# Output : Not needed
###########################


COUNT=1  # Initialize condition

until [ $COUNT -gt 10 ] # False logic
do
   echo "The value of COUNT is $COUNT"
   COUNT=`expr $COUNT + 1`	# Condition Modifier
done

