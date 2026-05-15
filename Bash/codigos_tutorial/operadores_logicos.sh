#! /bin/bash

age=10

#Version1
# 18 < age < 40
if [ $age -gt 18 ] && [ $age -lt 40 ]
then
    echo "edad valida"
else
    echo "edad no valida"
fi

#Version2
if [[ $age -gt 18 || $age -lt 40 ]]
then
    echo "edad valida"
else
    echo "edad no valida"
fi