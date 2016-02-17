#!/usr/bin/env bash
rm  $PWD/*.html
rm  $PWD/*.txt

thejargonlexicon="http://www.jargon.net/"
wget -r -l13 -k -A.html $thejargonlexicon
wget -r -l13 -A.txt $thejargonlexicon

original="http://www.dourish.com/goodies/jargon.html"
wget -r -l1 --no-parent -A.html $original
trailingedge="ftp://ftp.trailing-edge.com/pub/rsx11freewarev2/rsx81b/374001/jargon.txt"
#wget $trailingedge
wget -r -l1 --no-parent -A.txt $trailingedge
bookurl="http://jargon-file.org/archive/jargon-1.5.0.dos.txt"
#wget $bookurl
wget -r -l1 --no-parent -A.txt $bookurl
url="http://www.catb.org/jargon/html/go01.html"
wget $url
#wget http://www.catb.org/jargon/html/go01.html
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

rm  $PWD/*.html
rm  $PWD/*.txt
