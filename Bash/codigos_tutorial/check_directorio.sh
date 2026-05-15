#! /bin/bash

#Busqueda de una carpeta
echo "Crea el nombre para la directorio:"
read folder
if [ -d $folder ]    #SI FOLDER EXISTE
then
    echo "El directorio $folder ya existe"
else
    echo "El directorio $folder no existe"
fi

#-d para directorios
#-f para files o archivos

echo "Nombre del archivo:"
read file

if [ -f $file ]
then
    echo "Escribe el contenido de texto:"
    read text
    echo $text >> $file #concatenar/ para reemplzar es >
else
    echo "El archivo $file no existe"
fi

#Podemos leer el contenido del archivo
echo "Nombre del archivo:"
read file

if [ -f $file ]    #SI FOLDER EXISTE
then
    #mientras - IFS lectura del archivo - -r(modo lectura) - line (linea por linea)
    while IFS= read -r line
    do
        echo $line #lo que lee de cada archivo
    done < $file #la entrada viene del contenido del archivo
else
    echo "El archivo $file no existe"
fi

#Para eliminar
echo "Nombre del archivo:"
read file

if [ -f $file ]    #SI FOLDER EXISTE
then
    rm $file #eliminar
    echo "el archivo fue eliminado"
else
    echo "El archivo $file no existe"
fi