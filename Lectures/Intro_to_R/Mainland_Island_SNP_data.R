# Population one - mainland
set.seed(12345)

popsize <- 157

genotypes <- c("AA","AC","CC")
allele_freqs <- c(0.48,0.52)
genotype_freqs <- c(allele_freqs[1]^2,(2*allele_freqs[1]*allele_freqs[2]),allele_freqs[2]^2)

p1_genos <- sample(genotypes,popsize,prob = genotype_freqs,replace = TRUE)

p1 <- data.frame(Allele_1 = substr(p1_genos,1,1),Allele_2 = substr(p1_genos,2,2),Pop = rep("Mainland",popsize))




# Population two - island
popsize <- 93

genotypes <- c("AA","AC","CC")
allele_freqs <- c(0.92,0.08)
genotype_freqs <- c(allele_freqs[1]^2,(2*allele_freqs[1]*allele_freqs[2]),allele_freqs[2]^2)

p2_genos <- sample(genotypes,popsize,prob = genotype_freqs,replace = TRUE)

p2 <- data.frame(Allele_1 = substr(p2_genos,1,1),Allele_2 = substr(p2_genos,2,2),Pop = rep("Island",popsize))





#Combine and write output
towrite <- rbind(p1,p2)
towrite$Ind_ID <- paste0("Ind_",c(1:nrow(towrite)))
towrite <- towrite[,c("Ind_ID","Pop","Allele_1","Allele_2")]
write.csv(towrite,"../Data/Mainland_Island_SNP_data.csv",row.names = F,quote = F)
