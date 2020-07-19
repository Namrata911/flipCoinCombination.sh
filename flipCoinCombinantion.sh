#!/bin/bash
declare -A singlet
H=0
T=0
for step in {1..20}
do
	flipCoin=$(( RANDOM%2 ))
	if [ $flipCoin -eq 1 ]
	then
		H=$(( $H+1 ))
   	#echo "Head"
	else
		T=$(( $T+1 ))
   	#echo "tail"
	fi
done

singlet["H"]=$(( ($H*100)/20 ))
singlet["T"]=$(( ($T*100)/20 ))

for key in ${!singlet[@]}
do
	echo "Win Percentage for singlet combination $key is ${singlet[$key]}"
done

echo "Flipping Two coins now "
declare -A doublet
HH=0
HT=0
TH=0
TT=0
for step in {1..20}
do
   flipCoin1=$(( RANDOM%2 ))
	flipCoin2=$(( RANDOM%2 ))
   combination=$flipCoin1$flipCoin2
   case $combination in
   11)
      HH=$(( $HH+1 ))
   ;;
   10)
      HT=$(( $HT+1 ))
   ;;
   01)
      TH=$(( $TH+1 ))
   ;;
   00)
      TT=$(( $TT+1 ))
   ;;
	esac
done

doublet["HH"]=$(( ($HH*100)/20 ))
doublet["HT"]=$(( ($HT*100)/20 ))
doublet["TH"]=$(( ($TH*100)/20 ))
doublet["TT"]=$(( ($TT*100)/20 ))

for key in ${!doublet[@]}
do
   echo "Win Percentage for doublet combination $key is ${doublet[$key]}"
done
