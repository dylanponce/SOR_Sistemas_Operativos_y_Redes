#! /bin/bash

while read line   ##Mientras vas escribiendo
do
    echo $line
done < "${1:-/dev/stdin}"