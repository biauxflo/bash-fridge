README : Inventaire d'un frigo

Format de la sauvegarde dans un fichier texte : 
Nom | Quantité | Catégorie | Date de péremption (AAAAMMJJ)
(1 item par ligne)

Exemple commande tri par date 
 sort -g -k <champ> -t '<separateur>' <fichier à trier> -o <fichier à trier>

Exemple Fonction Ajouter
#!/bin/bash

function ajouter {
        echo "Saisir les infos de votre produit (Nom/Date d'expiration/Type/quantite"
        read -r chaine
        echo "$chaine" >> DATA.txt
}
ajouter
