#Read in data
dd <- read.csv("Mainland_Island_SNP_data.csv")

#Create a heterozygote/homozygote column
dd$Het <- ifelse(dd$Allele_1 == dd$Allele_2,"Homozygote","Heterozygote")

#Calculate heterozygote frequencies for each population
het_freqs <- table(dd$Het,dd$Pop)["Heterozygote",]/table(dd$Pop)

#Make a bar plot
barplot(het_freqs,ylab = "Proportion heterozygotes")

#Perform a Chi-squared test
chisq.test(dd$Het,dd$Pop)

#Allele frequencies
a1 <- table(dd$Allele_1,dd$Pop)
a2 <- table(dd$Allele_2,dd$Pop)

a_counts <- a1+a2

Island_freq <- a_counts[,"Island"]/sum(a_counts[,"Island"])
Mainland_freq <- a_counts[,"Mainland"]/sum(a_counts[,"Mainland"])

newdata <- cbind(Island_freq,Mainland_freq)

barplot(newdata)




