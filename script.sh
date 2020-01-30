## Algorithme général ##
q=0;
while [ $q -ne 0 ]
do
	case $(affichage()) in
		modification)
			q_2=1;
			while [ $q_2 -ne 0 ]
			do
				case $(modif()) in
					add)
						ajout();
					supp)
						suppression();
					quit)
						q_2=0;
				esac
			done
		affichage)
			affichage();
		quit)
			q=0;
	esac
done

