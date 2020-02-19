alphabet="abcdefghijklmnopqrstuvwxyz"
ALPHABET="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

for i in {0..25}
do
    # echo ${alphabet:i:1}
    str1=""
    k=$i
    for j in {0..25}
    do
        if [[ k -eq 26 ]]
        then
            k=0
        fi
        str1="$str1${alphabet:k:1}"
        k=$((k+1))
    done
    str2='lower_array['
    str2="$str2$i]=\"$str1\""
    echo $str2
done

for i in {0..25}
do
    # echo ${alphabet:i:1}
    str1=""
    k=$i
    for j in {0..25}
    do
        if [[ k -eq 26 ]]
        then
            k=0
        fi
        str1="$str1${ALPHABET:k:1}"
        k=$((k+1))
    done
    str2='upper_array['
    str2="$str2$i]=\"$str1\""
    echo $str2
done