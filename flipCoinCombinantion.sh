#!/bin/bash
flipCoin=$(( RANDOM%2 ))
if [ $flipCoin -eq 1 ]
then
   echo "Head"
else
   echo "tail"
fi
