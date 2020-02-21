lower_array[0]="abcdefghijklmnopqrstuvwxyz"
lower_array[1]="bcdefghijklmnopqrstuvwxyza"
lower_array[2]="cdefghijklmnopqrstuvwxyzab"
lower_array[3]="defghijklmnopqrstuvwxyzabc"
lower_array[4]="efghijklmnopqrstuvwxyzabcd"
lower_array[5]="fghijklmnopqrstuvwxyzabcde"
lower_array[6]="ghijklmnopqrstuvwxyzabcdef"
lower_array[7]="hijklmnopqrstuvwxyzabcdefg"
lower_array[8]="ijklmnopqrstuvwxyzabcdefgh"
lower_array[9]="jklmnopqrstuvwxyzabcdefghi"
lower_array[10]="klmnopqrstuvwxyzabcdefghij"
lower_array[11]="lmnopqrstuvwxyzabcdefghijk"
lower_array[12]="mnopqrstuvwxyzabcdefghijkl"
lower_array[13]="nopqrstuvwxyzabcdefghijklm"
lower_array[14]="opqrstuvwxyzabcdefghijklmn"
lower_array[15]="pqrstuvwxyzabcdefghijklmno"
lower_array[16]="qrstuvwxyzabcdefghijklmnop"
lower_array[17]="rstuvwxyzabcdefghijklmnopq"
lower_array[18]="stuvwxyzabcdefghijklmnopqr"
lower_array[19]="tuvwxyzabcdefghijklmnopqrs"
lower_array[20]="uvwxyzabcdefghijklmnopqrst"
lower_array[21]="vwxyzabcdefghijklmnopqrstu"
lower_array[22]="wxyzabcdefghijklmnopqrstuv"
lower_array[23]="xyzabcdefghijklmnopqrstuvw"
lower_array[24]="yzabcdefghijklmnopqrstuvwx"
lower_array[25]="zabcdefghijklmnopqrstuvwxy"
upper_array[0]="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
upper_array[1]="BCDEFGHIJKLMNOPQRSTUVWXYZA"
upper_array[2]="CDEFGHIJKLMNOPQRSTUVWXYZAB"
upper_array[3]="DEFGHIJKLMNOPQRSTUVWXYZABC"
upper_array[4]="EFGHIJKLMNOPQRSTUVWXYZABCD"
upper_array[5]="FGHIJKLMNOPQRSTUVWXYZABCDE"
upper_array[6]="GHIJKLMNOPQRSTUVWXYZABCDEF"
upper_array[7]="HIJKLMNOPQRSTUVWXYZABCDEFG"
upper_array[8]="IJKLMNOPQRSTUVWXYZABCDEFGH"
upper_array[9]="JKLMNOPQRSTUVWXYZABCDEFGHI"
upper_array[10]="KLMNOPQRSTUVWXYZABCDEFGHIJ"
upper_array[11]="LMNOPQRSTUVWXYZABCDEFGHIJK"
upper_array[12]="MNOPQRSTUVWXYZABCDEFGHIJKL"
upper_array[13]="NOPQRSTUVWXYZABCDEFGHIJKLM"
upper_array[14]="OPQRSTUVWXYZABCDEFGHIJKLMN"
upper_array[15]="PQRSTUVWXYZABCDEFGHIJKLMNO"
upper_array[16]="QRSTUVWXYZABCDEFGHIJKLMNOP"
upper_array[17]="RSTUVWXYZABCDEFGHIJKLMNOPQ"
upper_array[18]="STUVWXYZABCDEFGHIJKLMNOPQR"
upper_array[19]="TUVWXYZABCDEFGHIJKLMNOPQRS"
upper_array[20]="UVWXYZABCDEFGHIJKLMNOPQRST"
upper_array[21]="VWXYZABCDEFGHIJKLMNOPQRSTU"
upper_array[22]="WXYZABCDEFGHIJKLMNOPQRSTUV"
upper_array[23]="XYZABCDEFGHIJKLMNOPQRSTUVW"
upper_array[24]="YZABCDEFGHIJKLMNOPQRSTUVWX"
upper_array[25]="ZABCDEFGHIJKLMNOPQRSTUVWXY"

a=$(cat $1)
b="${a:28:1}${a:29:1}"

d=$1
name="${d%%.*}"
extension="${d#*.}"

num=$(expr "$b" % 26)

echo $name >> temp.txt

new_name=$(sed "y/${lower_array[$num]}${upper_array[$num]}/${lower_array[0]}${upper_array[0]}/" temp.txt)

rm temp.txt

mv $1 "$new_name.$extension"