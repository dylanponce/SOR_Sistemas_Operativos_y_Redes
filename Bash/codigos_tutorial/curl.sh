#! /bin/bash

echo "Ingrese la url"
read url

curl $url

#Podemos guardar en un archivo
curl $url > nota.txt

curl $url > imagen.jpg

curl -I $url #Muestra informacion Headers