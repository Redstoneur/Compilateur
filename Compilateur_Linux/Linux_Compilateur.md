# Compilateur Linux

## Introduction

Le compilateur pour linux est un programme qui permet de compiler un programme écrit en langage C, python, java, etc. Il
permet de transformer le code source en un programme exécutable.

## Installation

Pour installer le compilateur, il faut télécharger le fichier `Compilateur_Linux.bash` et le placer dans le dossier
`/usr/bin/`. Ensuite, il faut donner les droits d’exécution au fichier avec la
commande `chmod +x /usr/bin/Compilateur_Linux.bash`.
Pour vérifier que le compilateur est bien installé, il faut taper la commande `Compilateur_Linux.bash` dans le terminal.
Si
le compilateur est bien installé, il affichera une erreur, car il n’y a pas de fichier à compiler.

## Utilisation

Pour utiliser le compilateur, il faut taper la commande `Compilateur_Linux.bash <fichier>` dans le terminal. Le fichier
doit être un fichier source. Le compilateur va compiler le fichier et créer un fichier exécutable. Le nom du fichier
exécutable est le même que le fichier source. Si le fichier source contient une erreur, le
compilateur affichera l’erreur et ne créera pas le fichier exécutable.

## Particularités

Le programme ne fonction que sur les systèmes d’exploitation Linux. Il ne fonctionne pas sur Windows ou Mac.
Aussi le programme ne fonctionne que sur des programmes écrits sur un fichier unique. Il ne fonctionne pas sur des
programmes écrits sur plusieurs fichiers.

## Exemple d’utilisation

1. Voici un exemple de fichier source en C :

```c
#include <stdio.h>

int main()
{
    printf("Hello World!\n");
    return 0;
}
```

Pour compiler ce fichier, il faut taper la commande `Compilateur_Linux.bash hello.c`. Le compilateur va compiler le
fichier et créer un fichier exécutable `hello.out`. Pour exécuter le fichier, il faut taper la commande `./hello.out`.
Le programme affichera `Hello World!`.

2. Voici un exemple de fichier source en python :

```python
print("Hello World!")
```

Pour compiler ce fichier, il faut taper la commande `Compilateur_Linux.bash hello.py`. Le compilateur va compiler le
fichier et créer un fichier exécutable `hello.out`. Pour exécuter le fichier, il faut taper la commande `./hello.out`.
Le programme affichera `Hello World!`.

3. Voici un exemple de fichier source en java :

```java
public class hello {
    public static void main(String[] args) {
        System.out.println("Hello World!");
    }
}
```

Pour compiler ce fichier, il faut taper la commande `Compilateur_Linux.bash hello.java`. Le compilateur va compiler le
fichier et créer un fichier exécutable `hello.out`. Pour exécuter le fichier, il faut taper la commande `./hello.out`.
Le programme affichera `Hello World!`.
