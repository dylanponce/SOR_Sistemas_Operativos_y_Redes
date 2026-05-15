#! /bin/bash

function sayHello(){
    local mensaje="Holasss"
    echo $mensaje
    echo "Hola $1, edad: $2"
    echo "Hola mundo"
}

sayHello
sayHello jose 30
sayHello pepe 20
sayHello leo

#Para un valor que cambie, con variables y mas
#Ejemplo, pasar argumentos
#echo "Hola $1"

#Dentro de la funcion podemos crear variables
#Se puede acceder a la variable porque es global
#Aun estando fuera de la funcion
#Hacerla "local" para que solo sirva para la funcion
#Para no se accedido desde afuera