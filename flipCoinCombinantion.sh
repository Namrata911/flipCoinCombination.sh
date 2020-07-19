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

