#Read in data
dd <- read.csv("Data/Microsat_data.csv")

#Create a heterozygote/homozygote column
dd$Het <- ifelse(dd$Allele_1 == dd$Allele_2,"Homozygote","Heterozygote")

#Calculate heterozygote frequencies for each population
het_freqs <- table(dd$Het,dd$Pop)["Heterozygote",]/table(dd$Pop)

#Make a bar plot
barplot(het_freqs,ylab = "Proportion heterozygotes")

#Perform a Chi-squared test
chisq.test(dd$Het,dd$Pop)
