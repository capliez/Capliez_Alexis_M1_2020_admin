#!/bin/bash

pause(){
	echo "Appuyez sur ENTER pour continuer"
	read
}

saisirUser(){
	echo "Saisir un nom d'utilisateur"
	read -r NOM
}

userVerif(){
		
	if grep "^$NOM:" /etc/passwd > /dev/null; then
		echo "L'utilisateur $NOM existe"
		if [ $1 -eq 2 ]
		then
			deleteUser
		fi
		pause
	else
		if [ $1 -eq 1 ]
		then
			userAdd
		fi
	fi
}

userAdd(){	
	su adduser $NOM
	su passwd $NOM
	pause
}

deleteUser(){
	su deluser  $NOM
	pause
}


REP=1
while [ $REP -eq 1 ]
do
	clear
	printf "Menu : \n\n"
	echo "1. Créer un utilisateur"
	echo "2. Supprimer un utilisateur"
	echo -e "3. Quitter \n"
	read -r CHOIX
	
	case $CHOIX in
		1)			
			saisirUser
			userVerif 1;;
		2)
			saisirUser
			userVerif 2
			;;
		q|3)
			echo "Bye"
			rep=0
			exit 1;;
		*)
			echo "Cette option n'existe pas"
			exit 1;;
	esac
done
