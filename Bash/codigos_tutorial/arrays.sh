#! /bin/bash

#Elementos que aparecen en un mismo grupo, agruparlos en listas
#Las listas se definen en () similar a las tuplas

##Escencial para hacer tareas repetitivas - automatizar
##Enlistar carpetas,recorrerlas,enlistar usuarios


names=( "ana" "leo" "noe" "sol" ) #elementos en lista
echo $names #solo el primero
echo "Nombres: ${names[*]}" #todos los elementos
echo "Nombres: ${names[@]}" #todos los elementos
echo "1re Nombre: ${names[0]}" #elemento 1ro
echo "Posiciones: ${!names[@]}" #ver el indice
echo "Total: ${#names[@]}" # con "#" cuento los elementos
#Imprime el ultimo elemento, al contar el total de los elementos
#Importante el -1 porque sino me paso
#Similar a length en java
echo "Nombres: ${names[${#names[@]}-1]}"

#Recorrer los elementos
for name in ${names[@]}
do
    echo "Mi nombre es: $name"
done

#Eliminar elementos de la lista
unset names[1]
echo "Nombres: ${names[@]}"

#Agregar a la lista
names[4]="bob"
echo "Nombres: ${names[@]}"

#Agregar siempre a lo ultimo
names[${#names[@]}]="bob"
echo "Nombres: ${names[@]}"

#Otra forma sencilla
names+=("bob")
names+=("pep")
echo "Nombres: ${names[*]}" 

#Añadir elementos a una posicion y actualizarla
names[2]="bob"
echo "Nombres: ${names[*]}" 