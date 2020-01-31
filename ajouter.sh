#!/bin/bash

function ajouter {
        echo "Saisir les infos de votre produit (Nom/Quantite/Categorie/Date -AAAAMMJJ-) : "
        read -r chaine
        echo "$chaine" >> DATA.txt
}

ajouter
