#!/bin/bash

pause(){
	echo "Appuyez sur ENTER pour continuer"
	read
}

saisirFichier(){
	echo "Saisir un nom de fichier"
	read -r NOM
}

fichierVerif(){
		
	if [ -r $NOM ]
	 then
		echo "Le fichier $NOM existe"
		if [ $1 -eq 2 ]
		then
			deleteFichier
		fi
		pause
	else
		if [ $1 -eq 1 ]
		then
			fichierAdd
		fi
	fi
}

fichierAdd(){	
	touch $NOM
	echo "Créer avec succès"
	pause
}

deleteFichier(){
	rm $NOM
	echo "Supprimer avec succès"
	pause
}


REP=1
while [ $REP -eq 1 ]
do
	clear
	printf "Menu : \n\n"
	echo "1. Créer un fichier"
	echo "2. Supprimer un fichier"
	echo -e "3. Quitter \n"
	read -r CHOIX
	
	case $CHOIX in
		1)			
			saisirFichier
			fichierVerif 1;;
		2)
			saisirFichier
			fichierVerif 2
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
