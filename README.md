# Fridgy

Vous aussi vous en avez marre d'oublier votre nourriture dans un coin du frigo et de la retrouver périmée ?
Alors adoptez "Fridgy" !
Simple d'utilisation grâce à son interface moderne, il sera votre meilleur compagnon dans la cuisine !
Il peut effectivement vous prevenir quand un produit est périmé, et vous indique le nombre de jours avant péremption !

## Comment l'utiliser ?
Executer le fichier "script.sh" et appréciez nos nombreuses fonctionnalités

- Modifier le contenu : Vous pouvez ajouter ou supprimer des produits dans votre frigo.
    - Ajouter : Indiquez le nom, la quantité, la catégorie et la date de péremption. La catégorie sert à définir une date de consommation limite, différente de la date de péremption légale. 
Si vous ajoutez un produit ayant les mêmes noms, catégories et date de péremption qu'un produit déjà présent dans le frigo, les deux s'additionneront.
    - Supprimer : Sélectionner un produit et la quantité que vous avez enlevé du frigo
- Afficher le contenu : Vous voyez ici le contenu exhaustif de votre frigo, classé par date de péremption (la plus courte est en haut). Si un produit est périmé, sa date de péremption 
est remplacé par un message de prévention, et un message supplémentaire s'affiche en bas de la liste.
- Chercher une recette : Vous pouvez ici chercher automatiquement une recette avec les ingrédients à utiliser le plus rapidement, sur le site Cuisine-libre.

Le fichier DATA.txt comporte déjà des données de base pour permettre au programme de fonctionner, executer le script reset.sh pour remettre à zero les données

## Pourquoi ?
Projet réalisé pendant l'activté d'intersemestre (Picasoft Init)[https://librecours.net/parcours/picasoft/api-casoft-init/].

## Avec qui ?
Le projet a été réalisé en groupe de 4.

Je remercie Yoann AYOUB, Mohammed Amine SAIDI et Paul DAVIET pour ce projet.

## Mots-clés

* Bash
