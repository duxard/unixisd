cal|sed -n 1p
 
wdays=($(cal | sed -n 2p))
mdays=$(cal | sed 1,2d)
nlines=$(echo "$mdays" | wc -l)
 
offset=0
for wday in ${wdays[@]}; do
    echo -n "$wday"
    for ((lineno = 1; lineno <= nlines; lineno++)); do
        line=$(echo "$mdays" | sed -n ${lineno}p)
        echo -n " ${line:$offset:2}"
    done
    ((offset += 4))
    echo
done
 
exit 0
