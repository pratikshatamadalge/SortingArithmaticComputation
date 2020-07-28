#!/bin/bash -x

#Discription:This problem computes different arithmetic expressions and Sorts the results
#Author:Pratiksha C. Tamadalge


function getInputs(){
	read -p "Enter first Number: " firstNumber
	read -p "Enter second Number: " secondNumber
	read -p "Enter third Number: " thirdNumber
}
function firstExpression(){
	#Exrpession is a+b*c
	getInputs
	firstResult=$((($firstNumber+$secondNumber*$thirdNumber)))
}

function secondExpression(){
	#Expression is a*b+c
	getInputs
	secondResult=$((($firstNumber*$secondNumber+$thirdNumber)))
}

function thirdExpression(){
	#Expression is c+a/b
	getInputs
	thirdResult=`expr "scale=2;$thirdNumber+$firstNumber/$secondNumber" | bc -l`
}
thirdExpression
