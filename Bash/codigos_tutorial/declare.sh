#! /bin/bash

#funcion declare
#diferencia entre variable y declare
#declare tiene mas propiedades, de solo lectura, tipo de dato,etc
#tenemos mas control
#programas que no deben ser modificados
declare -r variable=/ect/passwd   #-r solo lectura
echo $variable

variable=/ect/passwd.txt  #da error porque solo es lectura