#!/bin/bash
#
#########
# Ben Lewis 12/02/2019
# searchNstuff - search for files and do stuff!
#########
#
script=$0
# print out script usage
usage() {
        echo "usage: ${script} filename -o"
        echo "
                -o OPTION: valid options delete or backup.
             
                filename: a filename or wildcard search for example *.txt, finds all files and any matches are either
                backed up or delete depending on the option selected.
       " 
}
# check if correct amount of args passed to script
if [ $# -lt 3 ]
then
        usage
        exit
fi

if [ $# -gt 3 ]
then
        usage
        exit
fi

# set vars
operation=$3
filename=$1

if [ $operation == "delete" ]
then
        echo "Deleting files that match ${filename}"
        $(find . -type f -name "${filename}" -exec rm -fr {} \;)
elif [ $operation == "backup" ]
then
        echo "Backing up files that match ${filename}"
        $(find . -type f -name "${filename}" -exec cp {} {}.bak \;)
else
        echo "Invalid option"
        usage
fi
