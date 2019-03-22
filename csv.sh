#!/bin/bash

files=($(ls l-P*))
#cat ${files[0]} | awk 'BEGIN{FS=":[ ]+";ORS=""}NR==2{print $1}NR>2{print ","$1}END{print "\n"}' >> test.csv

file0=$(ls l-P* | head -1)
#cat $file0 | awk 'BEGIN{FS=":[ ]+";ORS=""}NR==2{print $1}NR>2{print ","$1}END{print "\n"}' >> test.csv
cat $file0 | awk 'BEGIN{FS=":[ ]+";ORS="";print "test_case"}NR>1{print ","$1}END{print "\n"}' > test.csv

for file in $(ls l-P*)
do
    echo $file
    #cat $file | awk 'BEGIN{FS=":[ ]+";ORS=""}NR==2{print $2}NR>2{print ","$2}END{print "\n"}' >> test.csv
    cat $file | awk 'BEGIN{FS=":[ ]+";ORS="";print "'${file}'"}NR>1{print ","$2}END{print "\n"}' >> test.csv
done

