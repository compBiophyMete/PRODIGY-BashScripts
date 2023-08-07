#!/bin/bash
dir=`/bin/pwd`

mkdir -p $dir/PRODIGYpostprocessed
touch  $dir/PRODIGYpostprocessed/PRODIGYpostprocessed.txt

for f in /home/ilter/ilternoPROXHOLO/ExtractedFrames_PRODIST/DISTAL/PRODIGY_OUTPUT/*.txt ; do
b=`basename $f .txt`
echo Processing PRODIGY file $b

#grep -o 'dissociation .*' ${b}.txt && 
grep -o 'split.* ' ${b}.txt > $dir/PRODIGYpostprocessed/Kdtmp_${b}.txt
#grep -o '\b([0-9])*\b' ${b}.txt > $dir/PRODIGYpostprocessed/Kdtmp_${b}.txt

done

echo Merging the files
#cat $dir/PRODIGYpostprocessed/Kdtmp* > $dir/PRODIGYpostprocessed/PRODIGYpostprocessed.txt
for f in $dir/PRODIGYpostprocessed/Kdtmp*.txt; do cat "$f" >> $dir/PRODIGYpostprocessed/PRODIGYpostprocessedID.txt; done
echo Deleting the temporary files
for f in $dir/PRODIGYpostprocessed/Kdtmp*; do rm -rf "$f"; done
