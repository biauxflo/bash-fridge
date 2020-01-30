## Algorithme général ##
q=0
while [ $q -eq 0 ]
do
	affichage
	case $choix_affichage in
		modification)
			q_2=0
			while [ $q_2 -eq 0 ]
			do
				modif
				case $choix_modif in
					add)
						`ajout`
					supp)
						`suppression`
					quit)
						q_2=1
				esac
			done
		afficher)
			afficher
		quit)
			q=1
	esac
done

