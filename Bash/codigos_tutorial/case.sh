#! /bin/bash

echo "Elige opcion 1 o 2:"
read valor

##Case funciona cuando son valores no aritmeticos
##Es para textos
case $valor in
    1)
        echo "Es el numero 1"
    ;;         #break
    2)
        echo "Es el numero 2"
    ;;
    *)
        echo "Valor incorrecto"
    ;;
esac