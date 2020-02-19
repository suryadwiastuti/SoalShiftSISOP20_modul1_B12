#!/bin/bash
# PATH=/home/kuuhaku86/development/flutter/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
#$(pwd)

cd /home/kuuhaku86/Documents/'Tugas & Materi'/Sisop/'Praktikum 1'/SoalShiftSISOP20_modul1_B12

for i in {1..28}
do
    wget -O "pdkt_kusuma_$i.jpg" -a "wget.log" https://loremflickr.com/320/240/cat
    arr[$i]="pdkt_kusuma_$i.jpg"
done

echo [ ! -d "kenangan" ] && mkdir "kenangan"
[ ! -d "duplicate" ] && mkdir "duplicate"

ls -l "kenangan" >> "tempKenangan.txt"
ls -l "duplicate" >> "tempDuplicate.txt"

awk -F " " '
    BEGIN{
        max=0
    }
    NR > 1{
        split($9,arr,"_")
        split(arr[2],arrr,".")
        if(max < arrr[1]){
            max=arrr[1]
        
        }
    }END{
        print max
    }
' "tempKenangan.txt" > "tempKenangan2.txt"

awk -F " " '
    BEGIN{
        max=0
    }
    NR > 1{
        split($9,arr,"_")
        split(arr[2],arrr,".")
        if(max < arrr[1]){
            max=arrr[1]
        
        }
    }END{
        print max
    }
' "tempDuplicate.txt" > "tempDuplicate2.txt"

maxKenangan=$(cat "tempKenangan2.txt")
maxDuplicate=$(cat "tempDuplicate2.txt")

maxKenangan=$(($maxKenangan+1))
maxDuplicate=$(($maxDuplicate+1))

# echo $maxKenangan " " $maxDuplicate

rm "tempDuplicate.txt"
rm "tempKenangan.txt"
rm "tempKenangan2.txt"
rm "tempDuplicate2.txt"

for i in {1..28}
do
    flag=0
    for j in {1..28}
    do
        if [[ $i -ne $j ]]
        then
            cmp --silent ${arr[$i]} ${arr[$j]} && flag=1 
        fi
        if [[ $flag -eq 1 ]]
        then
            j=30
        fi
    done
    if [[ $flag -eq 1 ]]
    then
        mv ${arr[$i]} "./duplicate/duplicate_$maxDuplicate.jpg"
        maxDuplicate=$(($maxDuplicate+1))
    else
        mv ${arr[$i]} "./kenangan/kenangan_$maxKenangan.jpg"
        maxKenangan=$(($maxKenangan+1))
    fi
done

grep Location "wget.log" > "location.log"
mv "wget.log" "wget.log.bak"
mv "location.log" "location.log.bak"