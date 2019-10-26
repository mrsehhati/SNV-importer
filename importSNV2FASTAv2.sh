#!/bin/bash

Vars=$1
FASTA=$2

awk -F":|-|\t" 'BEGIN{Exp=0; n=0}{if(NR==FNR){ if((NF>=5) && (length($4)<2) && (length($5)<2)){n++;a[n]=$1;b[n]=$2;c[n]=$4; d[n]=$5;} next;}}{if(NF>=3){if(Exp==1){st=1; str2=""; for(k=1;k<=count;k++){ if(substr(str,pos[k]+1,1)==ref[k]){str2=str2 substr(str,st,pos[k]-st+1) rep[k]; st=pos[k]+2;} continue;} str2=str2 substr(str,st,length(str)-st+1); st=1; for(k=1; k<=nl; k++){print substr(str2,st,LL[k]); st=LL[k]+st; continue;}  Exp=0;} print $0; str=""; count=0; for(i=1;i<=n;i++){ if((">chr"a[i]==$1)&&(b[i]>=$2)&&(b[i]<$3)){count++; pos[count]=b[i]-$2;ref[count]=c[i];rep[count]=d[i];} continue;} next;}else{ if(Exp==0){Exp=1; nl=0;} str=str $0; nl++; LL[nl]=length($0); next;}}END{st=1; str2=""; for(k=1;k<=count;k++){ if(substr(str,pos[k]+1,1)==ref[k]){str2=str2 substr(str,st,pos[k]-st+1) rep[k]; st=pos[k]+2;} continue;} str2=str2 substr(str,st,length(str)-st+1); st=1; for(k=1; k<=nl; k++){print substr(str2,st,LL[k]); st=LL[k]+st; continue;}}' $Vars $FASTA
