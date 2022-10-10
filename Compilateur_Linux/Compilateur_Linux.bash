#!/bin/bash

# Ce script permet de compiler un programme C, python, java, etc.
# Il compile le programme en executable et le lance.

# il faut donner en paramètre le nom du fichier à compiler avec son chemin d'accès
# exemple : ./Compilateur.sh /home/Utilisateur/Programme.c

# il faut donc que le programme soit dans un fichier unique

# vérification du nombre de paramètres
if [ $# -ne 1 ]
then
  echo "Erreur : il faut donner en paramètre le nom du fichier à compiler avec son chemin d'accès"
  echo "exemple : ./Compilateur.sh /home/Utilisateur/Programme.c"
  exit 1
fi

# vérification du format du paramètre est celui d'un chemin d'accès à un fichier
if [ ! -f $1 ]
then
  echo "Erreur : le paramètre n'est pas un chemin d'accès à un fichier"
  echo "exemple : ./Compilateur.sh /home/Utilisateur/Programme.c"
  exit 1
fi

# variable contenant le nom du fichier à compiler
FICHIER=$1

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

# vérifier que la compilation s'est bien passée
if [ $? -ne 0 ]
then
  # attendre la frappe d'une touche pour terminer le script
  read -p "Appuyer sur une touche pour terminer le script"
  clear
  echo "Fin du script"
  sleep 1
  clear
else
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
      ${CHEMIN_ACCES}/${NOM}.class
      ;;
    py)
      # exécuter le programme Python
      ${CHEMIN_ACCES}/${NOM}.pyc
      ;;
  esac
fi



