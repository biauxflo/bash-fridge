#!/bin/bash

function supprimer {
        echo "Saisir le nom du produit que vous voulez supprimer : "
        read -r nom
        sed -i"back" "/$nom/d" DATA.txt
}

supprimer
