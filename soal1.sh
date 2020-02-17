#!/bin/bash

awk -F "," '
	NR > 1{
		reg[$13]=reg[$13]+$21
		sta[$11]
		prod[$17]
		staReg[$11,$13]=staReg[$11,$13]+$21
		staRegProd[$11,$13,$17]=staRegProd[$11,$13,$17]+$21
	}
	END{
		i=0
		smallest
		smallestReg
		for (a in reg) {
			if(i==0||smallest>reg[a]){
				smallest=reg[a]
				smallestReg=a
			}
			i++
		}
		print "smallest profit Region = " smallestReg " With profit " smallest
		smallestStaProf1=0
		smallestSta1=something
		smallestStaProf=999999999999999
		smallestSta
		i=0
		for (a in sta) {
			if((i==0 || smallestStaProf > staReg[a,smallestReg]) && staReg[a,smallestReg]!="") {
				smallestStaProf1=smallestStaProf
				smallestSta1=smallestSta
				smallestStaProf=stareg[a,smallestReg]
				smallestSta=a
				i++
			}
		}
		print "smallest profit State " smallestSta " and " smallestSta1
		for(i=1;i<=10;i++){
			arr[i]=999999999999999
			name[i]=kuuhaku86
		}	
		i=0
		for(a in prod) {
			if((i==0 && (staRegProd[smallestSta,smallestReg,a]!="" || staRegProd[smallestSta1,smallestReg,a]!="")) || (arr[1] > staRegProd[smallestSta,smallestReg,a] && staRegProd[smallestSta,smallestReg,a] != "") || (arr[1] > staRegProd[smallestSta1,smallestReg,a] && staRegProd[smallestSta1,smallestReg,a] != "")) {
                                for(i=9;i>=1;i--){
                       	 		arr[i+1] = arr[i]
					name[i+1] = name[i]
                		}
				arr[1] = staRegProd[a,smallestReg,smallestSta1]
				name[1] = a
                                i++
                        }	
		}
		print "Smallest Profit Product"
		for(a in name) print name[a]	
	}
' Sample*
