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
firstExpression
