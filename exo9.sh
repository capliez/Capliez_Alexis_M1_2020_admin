#!/bin/bash

enterFile(){
    echo "Saisir un nom de fichier"
    read -r NOM
    checkFile
}

enterUserRights(){
    echo "Saisir les droits du propriétaire"
    read -r USER
    groupRights
}

enterGroupRights(){
    echo "Saisir les droits du groupe"
    read -r GROUP
    othersRights
}

enterOthersRights(){
    echo "Saisir les droits des autres 'reste du monde'"
    read -r OTHERS
    changePermFile
}

checkFile(){
    
    if [ -r $NOM ]
    then
        echo "Le fichier $NOM existe bien"
        userRights
    else
        echo "Le fichier $NOM n'existe pas"
    fi
}

userRights(){
    enterUserRights
}

othersRights(){
    enterOthersRights
}

groupRights(){
    enterGroupRights
}

changePermFile(){
    #Propriétaire
    sudo chmod u-$USER $NOM

    #Groupe propriétaire
    sudo chmod g-$GROUP $NOM

    #Reste du monde
    sudo chmod o-$OTHERS $NOM

    echo "Changement bien effectué !"
}

enterFile