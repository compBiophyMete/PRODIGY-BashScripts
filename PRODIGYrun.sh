#!/bin/bash
dir=`/bin/pwd`

for f in /home/ilter/Desktop/MI_Research2020/PhD/DUBs/OTUD7B/FinalizedSims/ContourMap/HOLO/ExtractedFrames/*.pdb ; do
b=`basename $f .pdb`
echo Processing PDB file $b
mkdir -p $dir/PRODIGY_OUTPUT

sed -i 's/OT1/O  /g' ${b}.pdb
sed -i 's/HSE/HIS/g' ${b}.pdb
sed -i 's/HSD/HIS/g' ${b}.pdb
sed -i 's/CD  ILE/CD1 ILE/g' ${b}.pdb
grep -v "OT2\|HT2" ${b}.pdb > tmp.pdb
mv tmp.pdb ${b}.pdb

prodigy ${b}.pdb --temperature 37.5 --selection P R > $dir/PRODIGY_OUTPUT/${b}.txt 
done
