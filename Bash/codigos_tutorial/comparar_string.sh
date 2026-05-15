#! /bin/bash

echo "Ingresar la contraseña:"
read input1
echo "Repetir la contraseña:"
read input2

##Comparaciones de Strings
if [ $input1 == $input2 ]
then 
    echo "Contraseña aceptada"
else
    echo "Error,Contraseñas distintas"
fi

echo "$input1 $input2"
