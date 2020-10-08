#!/bin/bash

verifNbArgument(){
	if [ $# -eq 2 ]
	then
		verifFichier $@
	else
		echo "Merci de mettre que deux arguments"
	fi
}

verifFichier(){
	if [ -r $1 ]
	then
		#echo "Le fichier $1 existe"
		actionFichier $1 $2
	else
		echo "Le fichier $1 n'existe pas"
	fi
}

actionFichier(){
	case $2 in
		copy|COPY|copier)
			cp $1 /tmp/script
			echo "Copié avec succès"
			;;
		delete|DELETE|supprimer)
			rm $1
			echo "Supprimé avec succès"
			;;
		read|READ|lire)
			cat $1
			echo "Bonne lecture"
			;;
		*)
			echo "Merci de choisir copy ou delete ou read"
			exit 1
			;;
esac
}

verifNbArgument $@
