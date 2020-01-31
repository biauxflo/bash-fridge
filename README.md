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

Exemple Commande Supprimer 
sed -i"back" '/<nom_produit>/d' DATA.txt
la commande supprime la ligne contenant le nom du produit et cree un fichier contenant la version d'avant. Il reste d'injecter la commande dans une fonction.

