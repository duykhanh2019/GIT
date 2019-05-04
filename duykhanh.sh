#!/bin/bash
cd Shellscript;pwd
ls -d * | while read dir; do
       rm -rf "$dir"
done
cp /home/duykhanh/duykhanh.sh duykhanh.sh;cp /home/duykhanh/idol.txt idol.txt;

s=`date +%u`
r=$((RANDOM%20+1))
for (( i = 1; i <=7; i++))
do
        a=`expr $i - $s`
        x=`date -d "$a"day +"%d_%m_%Y"`
        GetKeyWord=`sed -n $i'p' idol.txt`
        GetImageLink=$(wget --user-agent 'Mozilla/5.0' -qO - "https://www.google.com/search?q=$GetKeyWord\&tbm=isch" | sed 's/</\n</g' | grep '<img' | tail -"$r" | head -1 | sed 's/.*src="\([^"]*\)".*/\1/') #Link dowload images 
mkdir $x
wget $GetImageLink -O $x/$GetKeyWord.jpg #dowload images

done

