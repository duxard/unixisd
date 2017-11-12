file1="/nethome/stao/task6/file1"
file2="/nethome/stao/task6/file2"

work()
{
 echo "in File1 not in File2: "
 sed 'y/ /\n/' $file1 > out1
 sed 'y/ /\n/' $file2 > out2
 cat out1 | while read line;
  do
   if ! grep -q $line out2; then echo $line;
   fi;
  done
 echo "in File2 not in File1: "
 cat out2 | while read line;
  do
   if ! grep -q $line out1; then echo $line;
   fi;
  done

rm out1
rm out2 
} 

if [ "$1" -a "$2" ];
 then work;
 else echo "Error!";
fi
