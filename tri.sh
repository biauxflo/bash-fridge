#!/bin/bash

touch temp
tail -n +1 DATA.txt > temp
sort -g -k 4 -t '/' temp -o DATA.txt
rm temp
cat DATA.txt
