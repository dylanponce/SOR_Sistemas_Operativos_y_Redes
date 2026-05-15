#! /bin/bash

#Verificar si se paso al menos un parametro
if [[ $# == 0 || $1 == "" ]]
then
    echo -e "\x1b[1;31mError:\x1b[0m debe ejecutar con un parámetro al menos"
    exit 1
fi

#Guardamos el nombre del directorio
DIRECTORIO=$1
#Archivo para guardar 
ARCHIVO="contenido_home.txt"

#Posicionar en el directorio $HOME
cd $HOME || exit 1

#Creo el directorio
mkdir -p "$DIRECTORIO"

#Ingreso al nuevo directorio
cd "$DIRECTORIO" || exit 1

#Listar el contenido de HOME y guardarlo en ARCHIVO
ls -lA "$HOME" > "$ARCHIVO"

#Mostrar contenido del archivo
cat "$ARCHIVO"

#Esperando que el usuario aprete ENTER para terminar
read -p "Presione ENTER para finalizar..."