#!/bin/bash

c=2
dateproduit=`head -n $c DATA.txt | tail -1 | cut -f 4 -d '/'`

while [ $dateproduit -lt `date +%Y%m%d` ]
do
	echo `head -n $c DATA.txt | tail -1`
	echo "Attention le produit est périmé"
	c=$(($c + 1))
        dateproduit=`head -n $c DATA.txt | tail -1 | cut -f 4 -d '/'`

done


