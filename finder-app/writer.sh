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

writefile=$1
writestr=$2

dir_decon=${writefile%/*}

if [[ $writefile == "/"* ]]; then
	dir_decon=${dir_decon#/}
fi

path_build=${dir_decon%%/*}

while [[ $dir_decon == [a-zA-Z]* ]];
do
	
	if [[ $writefile == "/"* ]]; then
		sudo mkdir -p /$path_build
	else
		sudo mkdir -p $path_build
	fi
	
	if ! [[ $dir_decon == *"/"* ]]; then
                 dir_decon=""
        fi

	dir_decon=${dir_decon#*/}
	path_build="${path_build}/${dir_decon%%/*}"

done

echo $2 | sudo tee $1 > /dev/null
