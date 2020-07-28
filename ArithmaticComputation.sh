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
getInputs
