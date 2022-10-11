#!/bin/bash

# Ce script permet de compiler un programme C, python, java, etc.
# Il compile le programme en executable et le lance.

# si il n'y a pas d'argument, on affiche un message d'aide
if [ $# -eq 0 ]
then
    echo "Usage: $0 <ordre de compilation> <fichier source>"
    echo "Ce script permet de compiler un programme C, python, java"
    echo "Pour de l'aide tapez: $0 -h"
# si il y a 1 argument
elif [ $# -eq 1 ]
then
    # vérification que $1 est égale à -h ou --help
    if [ $1 = "-h" ] || [ $1 = "--help" ]
    then
        echo "Usage: $0 <ordre de compilation> <fichier source>"
        echo "Commandes disponibles:"
        echo "    -h, --help: affiche l'aide"
        echo "    -v, --version: affiche la version"
        echo "    -c, --compile: compile un programme"
        echo "    -e, --exec: compile et execute un programme"
        echo "    -i, --install: installe un programme"
    # vérification que $1 est égale à -v ou --version
    elif [ $1 = "-v" ] || [ $1 = "--version" ]
    then
        echo "Version 0.0.2"
    # vérification que $1 est égale à -c ou --compile
    elif [ $1 = "-c" ] || [ $1 = "--compile" ]
    then
        echo "Usage: $0 -c <fichier source>"
        echo "Ce script permet de compiler un programme C, python, java"
        echo "Pour de l'aide tapez: $0 -h"
    # vérification que $1 est égale à -e ou --exec
    elif [ $1 = "-e" ] || [ $1 = "--exec" ]
    then
        echo "Usage: $0 -e <fichier source>"
        echo "Ce script permet de compiler et executer un programme C, python, java"
        echo "Pour de l'aide tapez: $0 -h"
    # vérification que $1 est égale à -i ou --install
    elif [ $1 = "-i" ] || [ $1 = "--install" ]
    then
        echo "Il faut être root pour installer les programme de dépendances"
        echo "Les programmes de dépendances sont:"
        echo "  - gcc"
        echo "  - python"
        echo "  - java"
        echo "  - javac"
        echo ""
        echo "Les dépendances sont nécessaire pour compiler les programmes"
        echo ""
        echo "Voulez-vous installer les dépendances ? (o/n)"
        read reponse
        if [ $reponse = "o" ]
        then
            echo "Installation des programmes de dépendances"
            sudo echo "Lancement de l'installation"
            
            # si sur une distribution basé sur debian
            if [ -f /etc/debian_version ]
            then
                # installation des programmes de dépendances
                # vérification de l'installation de gcc
                if [ $(dpkg-query -W -f='${Status}' gcc 2>/dev/null | grep -c "ok installed") -eq 0 ]
                then
                    sudo apt-get install gcc -y
                fi
                
                # vérification de l'installation de python
                if [ $(dpkg-query -W -f='${Status}' python 2>/dev/null | grep -c "ok installed") -eq 0 ]
                then
                    sudo apt-get install python -y
                fi
                
                # vérification de l'installation de java
                if [ $(dpkg-query -W -f='${Status}' java 2>/dev/null | grep -c "ok installed") -eq 0 ]
                then
                    sudo apt-get install java -y
                fi
                # vérification de l'installation de javac
                if [ $(dpkg-query -W -f='${Status}' javac 2>/dev/null | grep -c "ok installed") -eq 0 ]
                then
                    sudo apt-get install javac -y
                fi
            # si sur une distribution basé sur redhat
            elif [ -f /etc/redhat-release ]
            then
                # installation des programmes de dépendances
                # vérification de l'installation de gcc
                if [ $(rpm -qa | grep -c gcc) -eq 0 ]
                then
                    sudo yum install gcc -y
                fi
                # vérification de l'installation de python
                if [ $(rpm -qa | grep -c python) -eq 0 ]
                then
                    sudo yum install python -y
                fi
                # vérification de l'installation de java
                if [ $(rpm -qa | grep -c java) -eq 0 ]
                then
                    sudo yum install java -y
                fi
                # vérification de l'installation de javac
                if [ $(rpm -qa | grep -c javac) -eq 0 ]
                then
                    sudo yum install javac -y
                fi
            # si sur une distribution basé sur archlinux
            elif [ -f /etc/arch-release ]
            then
                # installation des programmes de dépendances
                # vérification de l'installation de gcc
                if [ $(pacman -Q | grep -c gcc) -eq 0 ]
                then
                    sudo pacman -S gcc -y
                fi
                # vérification de l'installation de python
                if [ $(pacman -Q | grep -c python) -eq 0 ]
                then
                    sudo pacman -S python -y
                fi
                # vérification de l'installation de java
                if [ $(pacman -Q | grep -c java) -eq 0 ]
                then
                    sudo pacman -S java -y
                fi
                # vérification de l'installation de javac
                if [ $(pacman -Q | grep -c javac) -eq 0 ]
                then
                    sudo pacman -S javac -y
                fi
            # si sur une distribution basé sur gentoo
            elif [ -f /etc/gentoo-release ]
            then
                # installation des programmes de dépendances
                # vérification de l'installation de gcc
                if [ $(emerge --info | grep -c gcc) -eq 0 ]
                then
                    sudo emerge gcc -y
                fi
                # vérification de l'installation de python
                if [ $(emerge --info | grep -c python) -eq 0 ]
                then
                    sudo emerge python -y
                fi
                # vérification de l'installation de java
                if [ $(emerge --info | grep -c java) -eq 0 ]
                then
                    sudo emerge java -y
                fi
                # vérification de l'installation de javac
                if [ $(emerge --info | grep -c javac) -eq 0 ]
                then
                    sudo emerge javac -y
                fi
            # si sur une distribution basé sur slackware
            elif [ -f /etc/slackware-version ]
            then
                # installation des programmes de dépendances
                # vérification de l'installation de gcc
                if [ $(ls /var/log/packages | grep -c gcc) -eq 0 ]
                then
                    sudo slackpkg install gcc -y
                fi
                # vérification de l'installation de python
                if [ $(ls /var/log/packages | grep -c python) -eq 0 ]
                then
                    sudo slackpkg install python -y
                fi
                # vérification de l'installation de java
                if [ $(ls /var/log/packages | grep -c java) -eq 0 ]
                then
                    sudo slackpkg install java -y
                fi
                # vérification de l'installation de javac
                if [ $(ls /var/log/packages | grep -c javac) -eq 0 ]
                then
                    sudo slackpkg install javac -y
                fi
            # si sur une distribution basé sur suse
            elif [ -f /etc/SuSE-release ]
            then
                # installation des programmes de dépendances
                # vérification de l'installation de gcc
                if [ $(zypper search -i | grep -c gcc) -eq 0 ]
                then
                    sudo zypper install gcc -y
                fi
                # vérification de l'installation de python
                if [ $(zypper search -i | grep -c python) -eq 0 ]
                then
                    sudo zypper install python -y
                fi
                # vérification de l'installation de java
                if [ $(zypper search -i | grep -c java) -eq 0 ]
                then
                    sudo zypper install java -y
                fi
                # vérification de l'installation de javac
                if [ $(zypper search -i | grep -c javac) -eq 0 ]
                then
                    sudo zypper install javac -y
                fi
            # si sur une distribution basé sur fedora
            elif [ -f /etc/fedora-release ]
            then
                # installation des programmes de dépendances
                # vérification de l'installation de gcc
                if [ $(rpm -qa | grep -c gcc) -eq 0 ]
                then
                    sudo yum install gcc -y
                fi
                # vérification de l'installation de python
                if [ $(rpm -qa | grep -c python) -eq 0 ]
                then
                    sudo yum install python -y
                fi
                # vérification de l'installation de java
                if [ $(rpm -qa | grep -c java) -eq 0 ]
                then
                    sudo yum install java -y
                fi
                # vérification de l'installation de javac
                if [ $(rpm -qa | grep -c javac) -eq 0 ]
                then
                    sudo yum install javac -y
                fi
            else
                echo "Votre distribution n'est pas supporté par ce script"
            fi
        else
            echo "Installation annulée"
        fi
    else
        echo "Erreur : argument non valide"
    fi
# si il y a 2 argument
elif [ $# -eq 2 ]
then
    # vérification de l'argument 1
    # vérification que $1 est égale à -c ou --compile ou -e ou --execute
    if [ $1 = "-c" ] || [ $1 = "--compile" ] || [ $1 = "-e" ] || [ $1 = "--execute" ]
    then
        # vérification de l'argument 2
        # vérification du format du paramètre est celui d'un chemin d'accès à un fichier
        if [ ! -f $2 ]
        then
          echo "Erreur : le paramètre n'est pas un chemin d'accès à un fichier"
          echo "exemple : ./Compilateur.sh /home/Utilisateur/Programme.c"
          exit 1
        fi

        # variable contenant le nom du fichier à compiler
        FICHIER=$2

        # variable contenant l'extension du fichier à compiler
        EXTENSION=${FICHIER##*.}

        # variable contenant le nom du fichier à compiler sans l'extension et sans le chemin d'accès
        NOM=${FICHIER##*/}
        NOM=${NOM%.*}

        # variable contenant le chemin d'accès du fichier à compiler sans le dernier slash
        CHEMIN_ACCES=${FICHIER%/*}

        # faire la compilation en fonction de l'extension du fichier
        case $EXTENSION in
          c)
            # supprimer le fichier compilé précédent si il existe
            if [ -f $CHEMIN_ACCES/$NOM ]
            then
                rm $CHEMIN_ACCES/$NOM
            fi
            # compilation d'un programme C en executable avec des options de debug dans le dossier $CHEMIN_ACCES
            gcc -g -Wall -Wextra -Werror -o $CHEMIN_ACCES/$NOM $CHEMIN_ACCES/$NOM.c
            # affichage du résultat de la compilation
            if [ $? -eq 0 ]
            then
              echo "Compilation du programme C réussie"
              echo "Le programme C a été compilé dans le fichier $CHEMIN_ACCES/$NOM"
            else
              echo "Erreur : la compilation du programme C a échouée"
            fi
            ;;
          java)
            # supprimer le fichier compilé précédent si il existe
            if [ -f $CHEMIN_ACCES/$NOM.class ]
            then
                rm $CHEMIN_ACCES/$NOM.class
            fi
            # compilation d'un programme Java en executable dans un fichier compilé avec des options de debug dans le dossier $CHEMIN_ACCES
            javac -g -d $CHEMIN_ACCES $CHEMIN_ACCES/$NOM.java
            # affichage du résultat de la compilation
            if [ $? -eq 0 ]
            then
              echo "Compilation du programme Java réussie"
              echo "Le programme Java a été compilé dans le fichier $CHEMIN_ACCES/$NOM.class"
            else
              echo "Erreur : la compilation du programme Java a échouée"
            fi
            ;;
          py)
            # supprimer le fichier compilé précédent si il existe
            if [ -f $CHEMIN_ACCES/$NOM.pyc ]
            then
                rm $CHEMIN_ACCES/$NOM.pyc
            fi
            # compilation d'un programme Python en executable dans un fichier compilé avec des options de debug dans le dossier $CHEMIN_ACCES
            python -m py_compile $CHEMIN_ACCES/$NOM.py
            # affichage du résultat de la compilation
            if [ $? -eq 0 ]
            then
              echo "Compilation du programme Python réussie"
              echo "Le programme Python a été compilé dans le fichier $NOM.pyc"
            else
              echo "Erreur : la compilation du programme Python a échouée"
            fi
            ;;
          *)
            # extension non reconnue
            echo "Erreur : l'extension $EXTENSION n'est pas reconnue"
            exit 1
            ;;
        esac

        # vérifier que la compilation s'est bien passée et que l'argument 1 est égale à -e ou --execute
        if [ $? -eq 0 ] && ([ $1 = "-e" ] || [ $1 = "--execute" ])
        then
            # attendre la frappe d'une touche pour terminer le script et lancer le programme compilé
            read -p "Appuyer sur une touche pour terminer le script et lancer le programme compilé"
            clear
            echo "Compilation réussie ! Lancement du programme compilé"
            sleep 1
            clear
            # exécuter le programme compilé
            case $EXTENSION in
              c)
                # exécuter le programme C
                ${CHEMIN_ACCES}/${NOM}
                ;;
              java)
                # exécuter le programme Java
                java -cp ${CHEMIN_ACCES} ${NOM}
                ;;
              py)
                # exécuter le programme Python
                python ${CHEMIN_ACCES}/${NOM}.py
                # exécuter le programme Python compilé
                #python ${CHEMIN_ACCES}/${NOM}.pyc
                ;;
            esac
        else
            # attendre la frappe d'une touche pour terminer le script
            read -p "Appuyer sur une touche pour terminer le script"
            clear
            echo "Fin du script"
            sleep 1
            clear
        fi

    else
        echo "Erreur : premier argument non valide"
    fi
else
    echo "Erreur : Il y a trop d'argument"
fi



