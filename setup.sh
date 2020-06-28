#!/bin/bash

mkdir Dati
mkdir martin
mkdir lewis
mkdir phil


R
dirs <-list.files("..")
userdirs <- dirs[grep("^user",dirs)]

for(i in 1:length(userdirs))
{
  system(paste0("sudo rm -rf ../", userdirs[i],"/*"))
  system(paste0("sudo ln -s /home/ubuntu/Dati /home/",userdirs[i]))
}


ls


ssh -i "pop20.pem" ubuntu@ec2-18-236-245-229.us-west-2.compute.amazonaws.com

scp -i "pop20.pem" -r ubuntu@ec2-18-236-245-229.us-west-2.compute.amazonaws.com:~/lewis/intro_to_r ../PopGenBerlinLGS


scp -r -i "pop20.pem" ../PopGenBerlinData/genetic_diversity ubuntu@ec2-52-25-157-255.us-west-2.compute.amazonaws.com:~/Dati
scp -r -i "pop20.pem" ../PopGenBerlinData/population_structure ubuntu@ec2-52-25-157-255.us-west-2.compute.amazonaws.com:~/Dati
scp -i "pop20.pem" Lectures/Intro_to_R/*.csv ubuntu@ec2-34-222-74-233.us-west-2.compute.amazonaws.com:~/Dati/Intro_to_R
scp -i "pop20.pem" Lectures/Intro_to_R/*.R ubuntu@ec2-34-222-74-233.us-west-2.compute.amazonaws.com:~/Dati/Intro_to_R


sed -i 's/Normalized,/Normalized/g' TriboliumSSGenomes.vcf
sed -i 's/genotypes,/genotypes/g' TriboliumSSGenomes.vcf
sed -i 's/Frequency,/Frequency/g' TriboliumSSGenomes.vcf
sed -i 's/allele, in/allele in/g' TriboliumSSGenomes.vcf
sed -i 's/AF),/AF)/g' TriboliumSSGenomes.vcf


vcftools --vcf TriboliumSSGenomes.vcf
