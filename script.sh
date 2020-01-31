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
}

modif(){
echo "Que voulez vous faire ?"
echo "1: Ajouter un produit"
echo "2: Suppression"
echo "3: Revenir au menu"
read choix_modif
}

ajout(){
	echo "Quelle est la categorie du produit que vous voulez ajouter ?"
	echo "1: Fruits"
	echo "2: Légumes"
	echo "3: Viande"
	echo "4: Poisson"
	echo "5: Plats préparés"
	echo "6: Sauces"
	echo "7: Restes"
	read c
	case c in 
		'1')categorie="Fruit";;
                '2')categorie="Légume";;
                '3')categorie="Viande";;
		'4')categorie="Poisson";;
		'5')categorie="Plat Préparé";;
		'6')categorie="Sauce";;
		'7')
			categorie="Restes"
			echo "Saisir les infos de votre produit :"
        		read -p "Nom" pdt
        		read -p "Quantite" qte
			echo "$pdt/$qte/Restes/$(date +%Y%m%d -d '+3 days'" >> DATA.txt
                	return 0;;
		*) echo "Erreur. Veuillez taper un chiffre valable.";;
	esac
        echo "Saisir les infos de votre produit (Nom/Quantite/Date -AAAAMMJJ-) :"
        read -p "Nom" pdt
	read -p "Quantite" qte
	read -p "Date" day
	if [ $day -eq $(date +%Y%m%d) ] || [ $day -lt $(date +%Y%m%d) ]
	then
		echo "Attention votre produit est à consommer rapidement (date recommandée de consommation passée)"
	fi
	for i in seq 2 $(wc -l DATA.txt)
	do
		if [ $pdt == $(head -n $i DATA.txt | tail -1 | cut -f 1 -d "/") ]
        	then
			if [ $date == $(head -n $i DATA.txt | tail -1 | cut -f 4 -d "/") ]
			then
				echo "$pdt/$(($qte + head -n $i DATA.txt | tail -1 ))/$categorie/$day">> DATA.txt
				sed "/$(head -n $i DATA.txt | tail -1)/d" DATA.txt
				return 0
			fi
		fi
	done
	echo"$pdt/$qte/$categorie/$day" >> DATA.txt;
}

suppression(){
        echo "Saisir le nom du produit que vous voulez supprimer : "
        read -r nom
        sed -i"back" "/$nom/d" DATA.txt
	rm -rf DATA.txt.back;
}

tri(){
echo "truc"
}

## Algorithme général ##
clear
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
