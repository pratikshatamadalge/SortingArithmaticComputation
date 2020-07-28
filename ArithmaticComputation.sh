#!/bin/bash -x

#Discription:This problem computes different arithmetic expressions and Sorts the results
#Author:Pratiksha C. Tamadalge

declare -A resultStore

function getInputs(){
	read -p "Enter first Number: " firstNumber
	read -p "Enter second Number: " secondNumber
	read -p "Enter third Number: " thirdNumber
	firstExpression
}
function firstExpression(){
	#Exrpession is a+b*c
	firstResult=$((($firstNumber+$secondNumber*$thirdNumber)))
	resultStore[firstResult]=$firstResult
	secondExpression
}

function secondExpression(){
	#Expression is a*b+c
	secondResult=$((($firstNumber*$secondNumber+$thirdNumber)))
	resultStore[secondResult]=$secondResult
	thirdExpression
}

function thirdExpression(){
	#Expression is c+a/b
	thirdResult=`expr "scale=2;$thirdNumber+$firstNumber/$secondNumber" | bc -l`
	resultStore[thirdResult]=$thirdResult
	fourthExpression
}

function fourthExpression(){
	#Expression is a%b+c
	fourthResult=`expr "scale=2;$firstNumber%$secondNumber+$thirdNumber" | bc -l`
	resultStore[fourthResult]=$fourthResult
}

getInputs
echo ${resultStore[@]}
echo ${!resultStore[@]}
