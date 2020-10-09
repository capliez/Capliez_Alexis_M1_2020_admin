#!/bin/bash

checkGroup(){
    
    if grep "^$1:" /etc/group > /dev/null; then
        echo "Le groupe $1 existe"
    else
        echo "Le groupe $1 n'existe pas"
    fi
}

echo "Saisir un nom de groupe"

#Demande de saisie un nom de groupe
read -r NOM

#Appel de la fonction
checkGroup $NOM
