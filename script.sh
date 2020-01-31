affichage(){
echo "Que voulez vous faire ?"
echo "1: Modifier le contenu du frigo"
echo "2: Consulter le contenu du frigo"
echo "3: Chercher une recette"
echo "4: Quitter"
read choix_affichage
}

alerte(){
c=3
dateproduit=`head -n $c DATA.txt | tail -1 | cut -f 4 -d '/'`

	while [ "$dateproduit" -lt `date +%Y%m%d` ]
	do
        	echo `head -n $c DATA.txt | tail -1 | cut -f 1 -d '/'` ":"
     	  	echo "Attention le produit est périmé"
      	 	echo " "
       		c=$(($c + 1))
	        dateproduit=`head -n $c DATA.txt | tail -1 | cut -f 4 -d '/'`

	done
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
alerte
echo " "
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
rouge='\e[0;31m'
neutre='\e[0;m'
date_jour=`date +%Y%m%d`
date_1=`date -d $1 +%s 2>/dev/null` 
date_2=`date -d $date_jour +%s 2>/dev/null`
compt=`echo "( $date_1 - $date_2) / (24*3600)" | bc`
if [ $compt -gt 0 ]
then
	echo "J-$compt"
else
	echo -e "${rouge}ATTENTION PRODUIT PERIME${neutre}"
fi
}

ajout(){
	echo "Quelle est la categorie du produit que vous voulez ajouter ?"
	echo "1: Fruits"
	echo "2: Légumes"
	echo "3: Viande"
	echo "4: Poisson"
	echo "5: Plats préparés"
	echo "6: Sauces"
	echo "7: Produits Laitiers"
	echo "8: Restes"
	read c
	qte="p"
	case $c in 
		'1')categorie="Fruit";;
                '2')categorie="Légume";;
                '3')categorie="Viande";;
		'4')categorie="Poisson";;
		'5')categorie="Plat Préparé";;
		'6')categorie="Sauce";;
		'7')categorie="Produits Laitiers";;
		'8')
			categorie="Restes"
			echo "Saisir les infos de votre produit :"
        		read -p "Nom " pdt
			read -p "Quelle est la quantite ? " qte
			echo "$pdt/$qte/Restes/$(date +%Y%m%d -d '+3 days')" >> DATA.txt
                	return 0;;
		*) echo "Erreur. Veuillez taper un chiffre valable."
			return 1;;
	esac
        echo "Saisir les infos de votre produit (Nom/Quantite/Date -AAAAMMJJ-) :"
        read -p "Nom " pdt
	read -p "Quantité" qte
	read -p "Date " day
	if [ $day -eq $(date +%Y%m%d) ] || [ $day -lt $(date +%Y%m%d) ]
	then
		echo -e "\e[Attention votre produit est à consommer rapidement (date recommandée de consommation passée)"
	fi
	for i in $(seq 2 $(wc -l DATA.txt | cut -f 1 -d" "))
	do
		if [[ "$pdt" = "$(head -n $i DATA.txt | tail -1 | cut -f 1 -d '/')" ]] && [[ "$categorie" = "$(head -n $i DATA.txt | tail -1 | cut -f 3 -d '/')" ]]
        	then
			if [[ "$day" = "$(head -n $i DATA.txt | tail -1 | cut -f 4 -d '/')" ]]
			then
				echo "$pdt/$(($qte + $(head -n $i DATA.txt | tail -1| cut -f 2 -d '/')))/$categorie/$day">> DATA.txt
				sed -i"back" "`echo $i`d" DATA.txt
				rm DATA.txtback
				return 0
			fi
		fi
	done
	echo "$pdt/$qte/$categorie/$day" >> DATA.txt;
}

suppression(){
        touch supp_temp
        column -t -s '/' DATA.txt > supp_temp
        cat -n supp_temp
        read -p "Quel produit avez-vous consommer ?" num
        echo "Que voulez vous faire :"
        echo "1: Un ou plusieurs produits consommés"
        echo "2: Tous les produits consommés"
        read x
        case $x in
                '1')    read -p "Combien de produits avez-vous consommer ?" nb
                        pdt_2="$(head -n $num DATA.txt | tail -1 | cut -f 1 -d '/')"
                        qte_2="$(head -n $num DATA.txt | tail -1 | cut -f 2 -d '/')"
                        ctg_2="$(head -n $num DATA.txt | tail -1 | cut -f 3 -d '/')"
                        day_2="$(head -n $num DATA.txt | tail -1 | cut -f 4 -d '/')"
                        if [ $nb -ge $qte_2 ]
                        then
                                sed -i"back" "`echo $num`d" DATA.txt
                                rm DATA.txtback
                                return 0
                        else
                                echo "$pdt_2/$(($qte_2 - $nb))/$ctg_2/$day_2" >> DATA.txt
                                sed -i"back" "`echo $num`d" DATA.txt
                                rm DATA.txtback
                                return 0
                        fi;;
                '2')
                        sed -i"back" "`echo $num`d" DATA.txt
                        rm DATA.txtback
                        return 0;;
                *)
                        echo "La saisie n'est pas valide";;
        esac
        rm supp_temp
}

chercher_recette() {
        tail -n +2 DATA.txt > t.txt
        head -n3 t.txt > t1.txt
        cut -d/ -f1 t1.txt > t2.txt
        tr ' ' '+' < t2.txt > t3.txt
        tr '\n' '+' < t3.txt > t4.txt
        lien=$(echo "https://cuisine-libre.fr/?page=recherche&recherche=")
        t5=`cat t4.txt`
        URL=$(echo $lien$t5)
        firefox $URL&
}

tri(){
touch temp
tail -n +1 DATA.txt > temp
sort -g -k 4 -t '/' temp -o DATA.txt
rm temp
}

## Algorithme général ##
clear
sortie_boucle1=0
while [ $sortie_boucle1 -eq 0 ]
do
	affichage
	clear
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
			chercher_recette
			;;
		'4')
			sortie_boucle1=1
			;;
		*)
			echo "Erreur. Veuillez taper un chiffre valable."
			;;
	esac
done
