#!/usr/bin/env bash
rm  $PWD/*.html
rm  $PWD/*.txt
wget http://www.catb.org/jargon/html/go01.html
cat $PWD/go01.html | pup 'a text{}' > lexicon.txt
 # delete the first 1 lines of a file
sed '1,4d'  $PWD/lexicon.txt > $PWD/newLexicon.txt

declare -a myarray
# Load file into array.
let i=0
while IFS=$'\n' read -r line_data; do
    myarray[i]="${line_data}"
    ((++i))
done < $PWD/newLexicon.txt

# Explicitly report array content.
let i=0
while (( ${#myarray[@]} > i )); do
    #printf "${myarray[i++]}\n"
    echo "${myarray[i++]}" >> new.txt
done


sed '1,4d'  $PWD/newLexicon.txt > $PWD/newLexicon.txt

declare -a myarray2
# Load file into array.
let i=0
while IFS=$'\n' read -r line_data; do
    myarray2[i]="${line_data}"
    ((++i))
done < $PWD/new.txt



# Explicitly report array content.
let i=0
while (( ${#myarray2[@]} > i )); do
    #printf "${myarray[i++]}\n"
    echo "${myarray2[i++]}" >> new.txt
done

for ((i = ${#myarray2[@]} - 1;i >= 0;i--)); do
    echo ${myarray2[i]}
done



