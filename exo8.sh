#!/bin/bash

enterFile(){
    echo "Saisir un nom de fichier"
    read -r NOM
    checkFile
}

enterUser(){
    echo "Saisir un nom d'utilisateur"
    read -r USER
    checkUser
}

enterGroup(){
    echo "Saisir un nom de groupe"
    read -r GROUP
    checkGoup
}

checkFile(){
    
    if [ -r $NOM ]
    then
        echo "Le fichier $NOM existe bien"
        checkUser
    else
        echo "Le fichier $NOM n'existe pas"
    fi
}

checkUser(){
    
    if grep "^$NOM:" /etc/passwd > /dev/null; then
        echo "L'utilisateur $NOM existe"
        checkGoup
    else
        echo "L'utilisateur $NOM n'existe pas"
    fi
}

checkGoup(){
    
    if grep "^$GROUP:" /etc/group > /dev/null; then
        echo "Le groupe $GROUP existe"
        changePermFile
    else
        echo "Le groupe $GROUP n'existe pas"
    fi

}

changePermFile(){
    sudo chown $USER:$GROUP $NOM
    sudo chmod g-rwx $NOM
}

enterFile