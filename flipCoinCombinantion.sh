#!/bin/bash
declare -A singlet
declare -A combined
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
	combined[$key]=${singlet[$key]}
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
	 combined[$key]=${doublet[$key]}
done

echo "Flipping Three coins now "
declare -A triplet
HHH=0
HHT=0
HTH=0
THH=0
TTT=0
TTH=0
THT=0
HTT=0
for step in {1..20}
do
   flipCoin1=$(( RANDOM%2 ))
   flipCoin2=$(( RANDOM%2 ))
	flipCoin3=$(( RANDOM%2 ))
   combination=$flipCoin1$flipCoin2$flipCoin3
   case $combination in
   111)
      HHH=$(( $HHH+1 ))
   ;;
   110)
      HHT=$(( $HHT+1 ))
   ;;
   101)
      HTH=$(( $HTH+1 ))
   ;;
   011)
      THH=$(( $THH+1 ))
   ;;
	000)
		TTT=$(( $TTT+1 ))
	;;
	001)
		TTH=$(( $TTH+1 ))
	;;
	010)
		THT=$(( $THT+1 ))
	;;
	100)
		HTT=$(( $HTT+1 ))
	;;
   esac
done

triplet["HHH"]=$(( ($HHH*100)/20 ))
triplet["HHT"]=$(( ($HHT*100)/20 ))
triplet["HTH"]=$(( ($HTH*100)/20 ))
triplet["THH"]=$(( ($THH*100)/20 ))
triplet["TTT"]=$(( ($TTT*100)/20 ))
triplet["TTH"]=$(( ($TTH*100)/20 ))
triplet["THT"]=$(( ($THT*100)/20 ))
triplet["HTT"]=$(( ($HTT*100)/20 ))


for key in ${!triplet[@]}
do
   echo "Win Percentage for triplet combination $key is ${triplet[$key]}"
	 combined[$key]=${triplet[$key]}
done

echo "Sorted all combinations..."

for key in ${!combined[@]}
do
   echo $key '-' ${combined[$key]}
done | sort -n -k3

