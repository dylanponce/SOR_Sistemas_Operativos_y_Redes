#! /bin/bash

args=("$@")
echo "Resultado: ${args[0]} - ${args[1]}" ##Es una cadena

##Por cantidad
echo $1 $2 $3

##Todos
echo $@

##Cuento los elementos
echo $#
