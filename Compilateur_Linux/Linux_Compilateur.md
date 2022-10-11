# Compilateur Linux

## Introduction

Le compilateur pour linux est un programme qui permet de compiler un programme écrit en langage C, python, java, etc. Il
permet de transformer le code source en un programme exécutable.

## Installation

Pour installer le compilateur, il faut télécharger le fichier `Compilateur_Linux.bash` et le placer dans le dossier
`/usr/bin/`. Ensuite, il faut donner les droits d’exécution au fichier avec la
commande `chmod +x /usr/bin/Compilateur_Linux.bash`.
Pour vérifier que le compilateur est bien installé, il faut taper la commande `Compilateur_Linux.bash` dans le terminal.
Si le compilateur est bien installé, if affichera les options disponibles.

Pour installer les dependence, il faut taper la commande `Compilateur_Linux.bash -i` dans le terminal.

## Utilisation

On peut connaître la version du compilateur en tapant la commande `Compilateur_Linux.bash -v` dans le terminal.

On peut connaître les options disponibles en tapant la commande `Compilateur_Linux.bash -h`
ou `Compilateur_Linux.bash --help` dans le terminal.

Pour compiler un programme, il faut taper la commande `Compilateur_Linux.bash -c <nom_du_fichier>` dans le terminal.
Le fichier doit être un fichier source. Le compilateur va compiler le fichier et créer un fichier exécutable. Le nom du
fichier exécutable est le même que le fichier source. Si le fichier source contient une erreur, le compilateur affichera
l’erreur et ne créera pas le fichier exécutable.

Pour compiler un programme et l’exécuter, il faut taper la commande `Compilateur_Linux.bash -e <nom_du_fichier>` dans le
terminal, dans l’ensemble, c’est la même chose que la commande précédente, mais le fichier exécutable est executé.

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
