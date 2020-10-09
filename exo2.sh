#!/bin/bash

checkNbArg(){
    if [ $# -eq 2 ]
    then
        checkFile $@
    else
        echo "Merci de mettre que deux arguments"
    fi
}

checkFile(){
    if [ -r $1 ]
    then
        #echo "Le fichier $1 existe"
        actionFile $1 $2
    else
        echo "Le fichier $1 n'existe pas"
    fi
}

actionFile(){
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

checkNbArg $@
