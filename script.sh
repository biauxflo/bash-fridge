
affichage(){
echo "Que voulez vous faire ?"
echo "1: Modifier le contenu du frigo"
echo "2: Consulter le contenu du frigo"
echo "3: Quitter"
read choix_affichage
}


afficher(){
echo "truc"
}

modif(){
echo "Que voulez vous faire ?"
echo "1: Ajouter un produit"
echo "2: Suppression"
echo "3: Revenir au menu"
read choix_modif
}

ajout(){
echo "bidule"
}

suppression(){
echo "machin"
}


## Algorithme général ##
sortie_boucle1=0
while [ $sortie_boucle1 -eq 0 ]
do
	affichage
	case $choix_affichage in
		'1')
			sortie_boucle2=0
			while [ $sortie_boucle2 -eq 0 ]
			do
				modif
				case $choix_modif in
					'1')
						ajout
						;;
					'2')
						suppression
						;;
					'3')
						sortie_boucle2=1
						;;
				esac
			done
			;;
		'2')
			afficher
			;;
		'3')
			sortie_boucle1=1
			;;
	esac
done

