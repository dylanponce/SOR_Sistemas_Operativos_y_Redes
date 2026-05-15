#! /bin/bash

x=10
y=20

echo $(( x + y ))
echo $(( x - y ))
echo $(( x * y ))
echo $(( x / y ))
echo $(( x % y ))
echo "---"
echo $(( 10 + 20 ))   #$((...)) Interpretar codigo
echo $(( 10 - 5 ))

#Otra forma
echo $(expr $x + $y)

#Ojo
echo $(expr $x \* $y)
#Nos da un error -> * es un operador de bash debemos agregar \

#Bash no siempre permite valores flotantes
#Hay que instalar comando bc para que nos de valores flotantes
