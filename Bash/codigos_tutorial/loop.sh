#! /bin/bash

number=0

##WHILE
##Esta condicion empieza ciendo verdad y termina falsa
#while [ $number -lt 10 ]
#do
#    echo $number
#    number=$((number + 1))  ##$((number  sumale 1
#done

##UNTIL
##Esta condicion empieza ciendo falsa y termina verdad
#until [ $number -ge 10 ]
#do
#    echo $number
#    number=$((number + 1))
#done

##FOR
##NO es practico
for i in 1 2 3 4 5
do
    echo $i
done

#Le damos un rango 0 a 100 - y los saltos de 10 (incremento)
for j in {0..100..10}  
do
    echo $j
done

#For con sintaxis similar a lenguajes comunes
#El incremento puede ser h+=20 o h=h+20
for (( h=0; h<10; h++ ))
do
    echo $h
done