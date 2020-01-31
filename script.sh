affichage(){
echo "Que voulez vous faire ?"
echo "1: Modifier le contenu du frigo"
echo "2: Consulter le contenu du frigo"
echo "3: Quitter"
read choix_affichage
}

afficher(){
clear
echo "" > temp.txt
tri
while read line
do
	if [ "$line" != "Nom/Quantité/Catégorie/Date de péremption" ]
	then
		date_dep=`echo $line | cut -f 4 -d '/'`
		date_arr=`compteur $date_dep`
		echo "$line" | sed "s#[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]#$date_arr#g" >> temp.txt
	else 
		echo "$line" >> temp.txt
	fi
done < DATA.txt
column -t -s '/' temp.txt
echo -e "\n"
}

modif(){
echo "Que voulez vous faire ?"
echo "1: Ajouter un produit"
echo "2: Suppression"
echo "3: Revenir au menu"
read choix_modif
}

compteur(){
## argument 1 : date de péremption
date_jour=`date +%Y%m%d`
date_1=`date -d $1 +%s`
date_2=`date -d $date_jour +%s`
compt=`echo "( $date_1 - $date_2) / (24*3600)" | bc`
echo "J-$compt"
}

ajout(){
echo "bidule"
}

suppression(){
echo "machin"
}

tri(){
echo "truc"
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
