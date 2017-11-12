# DOBAVLENIE KOLONKI S DATAMI V PODLEZHASCHEM SORTIROVKE VIDE 

awk '{print $3}' file1>date
while read line; do
 day=${line:0:2}
 mon=${line:3:3}
 year=${line:7:4}
 echo $day $mon $year >> cal
done<date
rm date

arr=(JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC);
arr_num=(01 02 03 04 05 06 07 08 09 10 11 12);
while read line;do
for ((i=0;i<12;i++)); do
 if [ ${line:2:4} == ${arr[i]} ];
 then echo ${line:0:2} ${arr_num[i]} ${line:7:4} >> cal1;
fi
done
done<cal

paste file1 cal1 > cal2

# SORTIROVKA

sort -n -b -k 7.1,7.4 -k 6.1,6.2 -k 5.1,5.2 cal2>cal3

# CENA NA TEST IZ file2 

npr=$(awk 'FNR==1{NA=$2}END{print NA}' file2)
kpr=$(awk 'FNR==2{K=$2}END{print K}' file2)
gpr=$(awk 'FNR==3{GLU=$2}END{print GLU}' file2)

# ZAPOLNYAEM kOLONKY "PRICE" - STAVIM CENU DLYA KAZHDOGO VIDA TESTA

awk -v NA=$npr -v K=$kpr -v GLU=$gpr '{u1=1; u2=2; u3=3}
{if ($1 =="K") print $0, K, "\t", u1; else if ($1 =="NA") print $0, NA, "\t", u2; else print $0, GLU, "\t", u3}' cal3>cal4

# VICHISLENIE KOLONKI "TOTAL' - UMNOZHAEM (unit*price) I ZAPISYVAEM V KOLONKY $10 - "TOTAL"

awk '{total=$8*$9}{print $0, total}' cal4>cal5

# RESULT

awk '/^K/{cost1+=$10; print $1,"\t",$3,"\t",$4,"\t",$8,"\t",$9,"\t",$10}END{print "Total for K:", cost1}' cal5 
echo "-------"
awk '/^NA/{cost2+=10; print $1,"\t",$3,"\t",$4,"\t",$8,"\t",$9,"\t",$10}END{print "Total for NA:", cost2}' cal5
echo "-------"
awk '/^GLU/{cost3+=10; print $1,"\t",$3,"\t",$4,"\t",$8,"\t",$9,"\t",$10}END{print "Total for GLU:", cost3}' cal5
echo "-------"

# UDALENIE VREMENNYH FAILOV

rm cal
rm cal1
rm cal2
rm cal3
rm cal4
rm cal5
