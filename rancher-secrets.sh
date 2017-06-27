#!/usr/bin/env bash

for e in `env | grep _secret=`
do
    name=`echo $e | cut -f1 -d= | sed s/_secret//`
    secret_name=`echo $e | cut -f2 -d=`
    file_name=/run/secrets/$secret_name
    if [ -f "$file_name" ]
    then
        value=`cat $file_name`
        export $name="$value"
        echo Setting \$$name from Rancher\'s secret $secret_name
    else
    	echo File $file_name does not exists while setting variable \$$name 2> /dev/stderr
    	exit 1
    fi
done
