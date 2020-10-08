#!/bin/bash

UserVerif(){
	
	if grep "^$1:" /etc/passwd > /dev/null; then
		echo "L'utilisateur $1 existe"
	else
		echo "L'utilisateur $1 n'existe pas"
	fi
}

echo "Saisir un nom d'utilisateur"

#Demande de saisie utilisateur
read -r NOM

#Appel de la fonction
UserVerif $NOM
