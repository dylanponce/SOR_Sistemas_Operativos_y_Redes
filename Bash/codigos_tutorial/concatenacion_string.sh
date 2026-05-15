#! /bin/bash

echo "Ingresar la nombre"
read name
echo "Escribe un adjetivo que defina a la persona"
read adjetive

# result="$name es $adjetive"
# echo $result

echo ${name,,} #,, convierto todo a minuscula
echo ${name^^} #,, convierto todo a mayuscula

echo ${name,, [AEIOU]} #,, convierto vocales a minuscula