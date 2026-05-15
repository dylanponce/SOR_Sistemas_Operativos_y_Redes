#! /bin/bash

##Supongmaos que tenemos una logica para recorrer elementos
##Pero si necesitamos acabar con el bucle en un punto
##O queremos que no se recorran ciertos elementos

#Sintaxis especial BREAK (corta al llegar)
for (( h=0; h<10; h++ ))
do
    if [ $h -gt 5 ]
    then
        break
    fi
    echo $h
done

#Sintaxis especial CONTINUE (esquivo esos valores)
for (( f=0; f<10; f++ ))
do
    if [ $f -eq 5 ] || [ $f -eq 6 ]
    then
        continue
    fi
    echo $f
done