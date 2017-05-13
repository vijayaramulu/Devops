#! /bin/bash
###############################
# purpose: To  create user via script
# Owner  : info@mycompnay.com
# Version: 1.0
# Input  : user_list list
# Output : Create the user if does not exists
###########################



for  MYUSER in `cat user_list`
do
	sudo ./createuser.sh $MYUSER
done
