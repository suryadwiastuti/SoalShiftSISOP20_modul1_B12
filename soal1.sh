#!/bin/bash

awk -F "," '
	NR > 1{
		reg[$13]=reg[$13]+$21
		sta[$11]
		prod[$17]
		staReg[$11,$13]=staReg[$11,$13]+$21
		staRegProd[$11,$13,$17]=staRegProd[$11,$13,$17]+$21
	}

	function compareString(str1,str2) {
		if(length(str1)!=length(str2)){
			return 0
		}

		split(str1,str11,"")
		split(str2,str22,"")
		
		for(i=0;i<length(str1);i++) {
			if(str11[i]!=str22[i])return 0
		}
		
		return 1
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
		print "Smallest profit region -> " smallestReg
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

		print "Smallest profit states -> " smallestSta " and " smallestSta1
		
		for(i=1;i<=10;i++){
			arr[i]=999999999999999
			name[i]=""
		}

		for(a in prod) {
			i=1

			if(staRegProd[smallestSta,smallestReg,a] != "") {
				num=staRegProd[smallestSta,smallestReg,a]
				flag=0
				
				for(k=1;k<=10;k++) {
					if(compareString(name[k],a)==1){
						if(arr[k]>num) {
							arr[k]=num
						}
						flag=1
						break
					}
				}

				while(i <= 10 && num > arr[i] && flag==0) {
					i++
				}

				j=9

				while(j >= i && flag==0){
					arr[j+1]=arr[j]
					name[j+1]=name[j]
					j--
				}

				if(i <= 10 && flag==0) {
					arr[i]=num
					name[i]=a
				}
			}

			if(staRegProd[smallestSta1,smallestReg,a] != "") {
				num=staRegProd[smallestSta1,smallestReg,a]
				flag=0
				for(k=1;k<=10;k++) {
					if(compareString(name[k],a)==1){
						if(arr[k]>num) {
							arr[k]=num
						}
						flag=1
						break
					}
				}

				while(i <= 10 && num > arr[i] && flag==0) {
					i++
				}

				j=9
				
				while(j >= i && flag==0){
					arr[j+1]=arr[j]
					name[j+1]=name[j]
					j--
				}
				
				if(i <= 10 && flag==0) {
					arr[i]=num
					name[i]=a
				}
			}
		}

		print "Smallest profit products : "
		for(a in name) print name[a] " -> " arr[a]
	
	}
' Sample*
