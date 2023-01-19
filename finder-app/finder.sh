#!/bin/bash

if ! [ -z "$1" ];
then
	if ! [ -z "$2" ];
	then
		if ! [ -z "$3" ];
		then
			echo "Too Many Parameters"
			exit 1
			
		fi
	else
		echo "Not enough parameters"
		exit 1
	fi
else
	echo "Not enough parameters"
	exit 1

fi


if ! [ -d $1 ];
then

	echo "No valid path provided"
	exit 1
fi

cd $1

file_count=0
str_count=0

for i in $(grep -hcr $2 *); do
	file_count=$((file_count+1))
	#str_count=+ grep -c -r $2 $i
	str_count=$((str_count+i))
done

echo "The number of files are $file_count and the number of matching lines are $str_count"
