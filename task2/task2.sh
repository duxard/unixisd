a="VER_SWS"
if [ $1 ]; then
 if [ "$1" = "$a" ];
  then echo $VER_SWS;
    else echo "Error invalid variable's name ";
  fi;
 else echo "Current user's name: "; whoami;
 fi
