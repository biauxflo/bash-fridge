affichage(){
echo "Que voulez vous faire ?"
echo "1: Modifier le contenu du frigo"
echo "2: Consulter le contenu du frigo"
echo "3: Quitter"
read choix_affichage
}

afficher(){
clear
tri
column -t 4 -s '/' DATA.txt
echo -e "\n"
./alerte.sh
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

tri(){
touch temp
tail -n +1 DATA.txt > temp
sort -g -k 4 -t '/' temp -o DATA.txt
rm temp
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
					*)
						echo "Erreur. Veuillez taper un chiffre valable."
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
		*)
			echo "Erreur. Veuillez taper un chiffre valable."
			;;
	esac
done
