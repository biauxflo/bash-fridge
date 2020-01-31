#!/bin/bash

function chercher_recette {
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

chercher_recette
