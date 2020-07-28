#!/bin/bash -x

#Discription:This problem computes different arithmetic expressions and Sorts the results
#Author:Pratiksha C. Tamadalge

declare -A resultStore
declare -a resultStoreInArray

function getInputs(){
	read -p "Enter first Number: " firstNumber
		read -p "Enter second Number: " secondNumber
		read -p "Enter third Number: " thirdNumber
		firstExpression
}
function firstExpression(){
#Exrpession is a+b*c
	firstResult=$((($firstNumber+$secondNumber*$thirdNumber)))
		resultStore[0]=$firstResult
		secondExpression
}

function secondExpression(){
#Expression is a*b+c
	secondResult=$((($firstNumber*$secondNumber+$thirdNumber)))
		resultStore[1]=$secondResult
		thirdExpression
}

function thirdExpression(){
#Expression is c+a/b
	thirdResult=`expr "scale=2;$thirdNumber+$firstNumber/$secondNumber" | bc -l`
		resultStore[2]=$thirdResult
		fourthExpression
}

function fourthExpression(){
#Expression is a%b+c
	fourthResult=`expr "scale=2;$firstNumber%$secondNumber+$thirdNumber" | bc -l`
		resultStore[3]=$fourthResult
		storeIntoArray
}

function storeIntoArray(){
	for(( index=0; index<${#resultStore[@]}; index++ ))
		do
			resultStoreInArray[index]=${resultStore[$index]}
		done
}

function desendingArraySorting(){
	for (( index=0; index<${#resultStoreInArray[@]}; index++ ))
	do
		temp=0
		for (( innerIndex=0; innerIndex<${#resultStoreInArray[@]}; innerIndex++ ))
		do
			if [[ ${resultStoreInArray[innerIndex]} -lt ${resultStoreInArray[index]} ]]
			then
				temp=${resultStoreInArray[index]}
				resultStoreInArray[index]=${resultStoreInArray[innerIndex]}
				resultStoreInArray[innerIndex]=$temp
			fi
		done
	done
echo "array in desending order => ${resultStoreInArray[@]}"
}

function ascendingArraySorting(){
	for (( index=0; index<${#resultStoreInArray[@]}; index++ ))
    do
       temp=0
       for (( innerIndex=0; innerIndex<${#resultStoreInArray[@]}; innerIndex++ ))
       do
          if [[ ${resultStoreInArray[innerIndex]%.*} -gt ${resultStoreInArray[index]%.*} ]]
          then
				 temp=${resultStoreInArray[index]}
             resultStoreInArray[index]=${resultStoreInArray[innerIndex]}
             resultStoreInArray[innerIndex]=$temp
          fi
       done
    done
 echo "array in Ascending order => ${resultStoreInArray[@]}"
}

getInputs
desendingArraySorting
ascendingArraySorting
