f1="file1"
f2='file2'

start()
{
 echo "Error, missing one parameter!"
}

work()
{
  if [ "$1" = "$f1"  -a "$2" = "$f2" ];
  then
     a1="/nethome/stao/task4/file1"
     b1="/nethome/stao/task4/file2"
     paste -d\\0 $a1 $b1 > /nethome/stao/task4/file12; 
	 
  elif [ "$1" = "$f2" -a "$2" = "$f1" ];
  then
     a1="/nethome/stao/task4/file2"
     b1="/nethome/stao/task4/file1"
     paste -d\\0 $a1 $b1 > /nethome/stao/task4/file12;
  else echo "Error!";  
 fi
}

if [ "$1" -a "$2" ];
 then work $1 $2;
 else start;
fi


