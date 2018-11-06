#Read in data
dd <- read.csv("Mainland_Island_SNP_data.csv",stringsAsFactors = F)

#Get just genotypes
ddg <- dd[,3:ncol(dd)]

#Create a heterozygote/homozygote matrix
Het <- ifelse(ddg[,seq(1,ncol(ddg)-1,2)] == ddg[,seq(2,ncol(ddg),2)],0,1)
Het <- data.frame(Pop = dd$Pop,Het)


#Calculate heterozygote frequencies for each population


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




