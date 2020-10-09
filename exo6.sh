#!/bin/bash

pause(){
    echo "Appuyez sur ENTER pour continuer"
    read
}

enterGroup(){
    echo "Saisir un nom de groupe"
    read -r NOM
}

checkGoup(){
    
    if grep "^$NOM:" /etc/group > /dev/null; then
        echo "Le groupe $NOM existe"
        if [ $1 -eq 2 ]
        then
            deleteGroup
        fi
        pause
    else
        if [ $1 -eq 1 ]
        then
            groupAdd
        fi
    fi
}

groupAdd(){
    su addgroup $NOM
    pause
}

deleteGroup(){
    su delgroup $NOM
    pause
}


REP=1
while [ $REP -eq 1 ]
do
    clear
    printf "Menu : \n\n"
    echo "1. Créer un groupe"
    echo "2. Supprimer un groupe"
    echo -e "3. Quitter \n"
    read -r CHOIX
    
    case $CHOIX in
        1)
            enterGroup
            checkGoup 1
        ;;
        2)
            enterGroup
            checkGoup 2
        ;;
        q|3)
            echo "Bye"
            rep=0
            exit 1
        ;;
        *)
            echo "Cette option n'existe pas"
            exit 1
        ;;
    esac
done
