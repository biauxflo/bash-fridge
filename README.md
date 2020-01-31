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

#!/bin/bash

function supprimer {
        echo "Saisir le nom du produit que vous voulez supprimer : "
        read -r nom
        sed -i"back" "/$nom/d" DATA.txt
}

supprimer

CATEGORIES PRODUITS 
'1')categorie="Fruit";;
                '2')categorie="Légume";;
                '3')categorie="Viande";;
                '4')categorie="Poisson";;
                '5')categorie="Plat Préparé";;
                '6')categorie="Sauce";;
