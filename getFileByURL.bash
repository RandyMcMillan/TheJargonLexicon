#!/usr/bin/env bash
rm  $PWD/*.html
rm  $PWD/*.txt
wget http://www.catb.org/jargon/html/go01.html
cat $PWD/go01.html | pup 'a text{}' > $PWD/a.txt

 # delete the first 1 lines of a file
sed '1,4d'  $PWD/a.txt > $PWD/b.txt

declare -a myarray
# Load file into array.
let i=0
while IFS=$'\n' read -r line_data; do
    myarray[i]="${line_data}"
    ((++i))
done < $PWD/b.txt

tail -r -n ${#myarray[@]}  $PWD/b.txt > $PWD/c.txt

# delete the first 1 lines of a file
sed '1,4d'  $PWD/c.txt > $PWD/d.txt
tail -r -n ${#myarray[@]}  $PWD/d.txt > $PWD/lexicon.text
