#!/bin/bash

nbArgument(){
	 echo -e "Nombre de fichier : $#"
	fileExist $*
}

fileExist(){
	for param in $*
	do
		if [ -r $param  ]
		then		
			echo -e "Le fichier $param existe"
		else
			echo -e "Le fichier $param n'existe pas"
		fi
	done
}

 nbArgument $@
