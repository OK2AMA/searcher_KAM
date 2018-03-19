#!/bin/bash
# Bash Menu Script Example

cislopokoje=1201
a=0
aa=0
b=0
pokoj=0
dvoj=0
troj=0

dvoj_1volny=0
troj_1volny=0
troj_2volny=0

ubytovanych=0

for(( p=1; $p-14 ; p=$p+1 )) # floor 1 - 13
do

for(( i=1; $i-23 ; i=$i+1 )) # room 1 - 22
do

a=$((($p * 100)+ $i))   # together number of room eg. 1216

ubytovanych=`wget -q https://www.kn.vutbr.cz/search/index.html?str=b07-$a -O - |grep -c "Login" `
if (( $ubytovanych > 0 )) ; then
	# echo "Na pokoji $a je studentu zapsanych:  $ubytovanych"
	aa=$a
    let "a %= 2"        # Equivalent to  let "a = a % 8"
	   if (( $a == 0 )); then
               if(( $i < 13 )); then
                  # dvoujluzak
				  if(( $ubytovanych == 1 )); then
                      dvoj_1volny=$((dvoj_1volny+1))
		              echo "Pokoj je castecne volny : $aa"			  
					  echo "Dvojluzkovy, jeden volny"
					  echo ""	
				  fi	
               else
                  # trojluzak
                   if(( $ubytovanych == 2 )); then
                       troj_1volny=$((troj_1volny+1)) 
		               echo "Pokoj je castecne volny : $aa"	
					   echo "Trojluzkovy, jeden volny"
					   echo ""	
				   fi   
                   if(( $ubytovanych == 1 )); then
                       troj_2volny=$((troj_2volny+1))
					   echo "Pokoj je castecne volny : $aa"	
					   echo "**Trojluzkovy, 2 volne"
					   echo ""	
				   fi
         fi
       else
               if(( $i < 13 )); then
                  # trojluzak
                   if(( $ubytovanych == 2 )); then
                       troj_1volny=$((troj_1volny+1))
					   echo "Pokoj je castecne volny : $aa"	
					   echo "Trojluzkovy, jeden volny"
					   echo ""	
				   fi   
                   if(( $ubytovanych == 1 )); then
                       troj_2volny=$((troj_2volny+1))  
					   echo "Pokoj je castecne volny : $aa"	
					   echo "**Trojluzkovy, 2 volne"
					   echo ""	
				   fi   
               else
                  # dvoujluzak
				  if(( $ubytovanych == 1 )); then
                      dvoj_1volny=$((dvoj_1volny+1))
					  echo "Pokoj je castecne volny : $aa"	
					  echo "Dvojluzkovy, jeden volny"
					  echo ""	
				  fi	

			   fi     	   
       fi

    else
    
    echo "******* Cely pokoj je volny : $a"
    let "a %= 2"        # Equivalent to  let "a = a % 8"
       if (( $a == 0 )); then
        #    echo "Sudy ?"
               if (( $i < 13 )); then
                  echo "******* Dvojluzkovy"
                  dvoj=$((dvoj+1))                     
               else
                  echo "******* Trojluzkovy"
                  troj=$((troj+1))              
               fi              
       else
        #    echo "Lichy ?"
               if (( $i < 13 )); then
                  echo "******* Trojluzkovy"
                  troj=$((troj+1))  
               else
                  echo "******* Dvojluzkovy"
                  dvoj=$((dvoj+1))  
               fi              
       fi
      echo ""
fi

done
done

c=$(($dvoj+$troj))
echo "Celkem jsou volne cele: $c pokoju,  z toho je $dvoj dvouluzkovych a $troj trojluzkovych."
echo "Dale zde mame situaci na trojluzkach se dvema volnymy misty $troj_2volny x a s jednim volnym mistem $troj_1volny."
echo "Nakonec na dvouluzkovych pokojich je volne jedno misto : $dvoj_1volny x."
echo "********************"
echo "Konec super programu"


