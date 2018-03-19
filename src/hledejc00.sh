#!/bin/bash
# Bash Menu Script Example

cislopokoje=1201
a=0
aa=0
b=0

# purkyne b07 a b04 .. 13p  22r
# purkyne b02 a b05 .. 6p   40r

# listovky 6p , c01 max 25r, c02 a c03 max 632r 


for(( p=4; $p-7 ; p=$p+1 )) # floor 1 - 13
do

for(( i=1; $i-32 ; i=$i+1 )) # room 1 - 22
do

a=$((($p * 100)+ $i))   # together number of room eg. 1216

ubytovanych=`wget -q https://www.kn.vutbr.cz/search/index.html?str=c02-$a -O - |grep -c "Login" `
#echo "C0$b-$a .. kontrolovano"
if (( $ubytovanych == 0 )) 
then
    echo "Blok $b; cely pokoj je volny : $a"
fi

if (( $ubytovanych == 1 )) 
then
    echo "Blok $b; jedno luzko : $a"
fi

done
done


c=$(($dvoj+$troj))
echo "Celkem jsou volne cele: $c pokoju,  z toho je $dvoj dvouluzkovych a $troj trojluzkovych."
echo "Dale zde mame situaci na trojluzkach se dvema volnymy misty $troj_2volny x a s jednim volnym mistem $troj_1volny."
echo "Nakonec na dvouluzkovych pokojich je volne jedno misto : $dvoj_1volny x."
echo "********************"
echo "Konec super programu"


