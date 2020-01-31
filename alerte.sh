#!/bin/bash

c=2
dateproduit=`head -n $c DATA.txt | tail -1 | cut -f 4 -d '/'`

while [ $dateproduit -lt `date +%Y%m%d` ]
do
	echo `head -n $c DATA.txt | tail -1 | cut -f 1 -d '/'` ":"
	echo "Attention le produit est périmé"
	echo " "
	c=$(($c + 1))
        dateproduit=`head -n $c DATA.txt | tail -1 | cut -f 4 -d '/'`

done


