#!/bin/bash
############################
# Purpose: To learn backup script
# Owner  : info@mycompnay.com
# Version: 1.0
# Input  : dir name
# Output : etc-date-tar.gz
###########################

BACKLOC="/backup"

echo "This is backup script to take backup of desired folder"
echo "Please enter the folder name ( full path ) :"
read TARGET

if [ ! -d $TARGET ]; then
  echo "The specified directory $TARGET is not available"
  exit
fi

WHOAMI=`/usr/bin/whoami`

if [ $WHOAMI != "root" ]; then
  echo "You MUST be a root user"
  exit
fi

MYDATE=`date +%d-%b-%Y`


if [ ! -d "$BACKLOC" ]; then
  mkdir "$BACKLOC"
fi


OFILE="etc-$MYDATE.tar.gz"

if [ -f "$BACKLOC/$OFILE" ]; then
  echo "The backup file $BAKLOC/$OFILE already exits"
  exit
fi

/bin/tar -cf "$BACKLOC/etc-$MYDATE.tar" "$TARGET"

cd "$BACKLOC"

/bin/gzip "$BACKLOC/etc-$MYDATE.tar"

cd -

echo "Backup of $TARGET completed .."

