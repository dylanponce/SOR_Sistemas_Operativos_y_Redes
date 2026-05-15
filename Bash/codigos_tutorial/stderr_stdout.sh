#! /bin/bash

#Guardo en un archivo el ls
ls 1> file.txt
#Otra forma
ls > archivo.txt

#Guardo en un archivo el ls error
ls -123 1> file.txt 2> errors.txt   #Error

##Para guardar error concatenar (guardar en mismo archivo)
ls > archivo.txt 2>archivo.txt
#Otra forma (guardar en el primer parametro)
ls > archivo.txt 2>&1

#Guardar ambos (otra forma del anterior)
ls -123 >& file2.txt 