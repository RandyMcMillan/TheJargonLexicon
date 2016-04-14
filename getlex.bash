#wget -r -A.pdf http://url-to-webpage-with-pdfs/
#!/usr/bin/env bash
rm  $PWD/*.html
rm  $PWD/*.txt

thejargonlexicon="http://www.jargon.net/"
#wget -r -nc  -l13 -k -A.html $thejargonlexicon
#wget -r -nc  -l13 -A.txt $thejargonlexicon

original="http://www.dourish.com/goodies/jargon.html"
#wget -r -nc  -l1 --no-parent -A.html $original
trailingedge="ftp://ftp.trailing-edge.com/pub/rsx11freewarev2/rsx81b/374001/jargon.txt"
#wget $trailingedge
#wget -r -nc -l1 --no-parent -A.txt $trailingedge
bookurl="http://jargon-file.org/archive/jargon-1.5.0.dos.txt"
#wget $bookurl
#wget -r -nc  -l1 --no-parent -A.txt $bookurl
#url="http://www.catb.org/jargon/html/go01.html"
url="https://www.google.com"
wget  -nc -l13 -k $url
#wget http://www.catb.org/jargon/html/go01.html
cat $PWD/go01.html | pup 'a text{}' > $PWD/a.txt
cat $PWD/go01.html | pup 'a attr{href}' > $PWD/links.htm
cat $PWD/go01.html | pup 'a' > $PWD/links.htm
cat $PWD/go01.html | pup 'img' > $PWD/img.htm
#wget -r -P $PWD -A jpg,jpeg,gif,png http://imgur.com/index.html
wget -nd -r -l 1 -A jpg http://imgur.com/
wget --no-check-certificate https://images.google.com

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

#rm  $PWD/*.html
#rm  $PWD/*.txt
