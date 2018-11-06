# Population one - mainland
set.seed(12345)

popsize <- 157

p <- c(0.52,0.56,0.51,0.60,0.55)
q <- 1-p

genotype_freqs <- cbind(p^2,
                    (2*p*q),
                    q^2)



het_genos <- c("AC","AT","CG","AT","GT")

p1_genos <- matrix(NA,nrow = popsize,ncol = length(genotypes))

for(i in 1:nrow(genotype_freqs))
{
  c_alleles <- strsplit(het_genos[i],split = "")[[1]]
  c_genos <- c(paste0(c_alleles[1],c_alleles[1]),
               paste0(c_alleles[1],c_alleles[2]),
               paste0(c_alleles[2],c_alleles[2]))
  p1_genos[,i] <- sample(c_genos,
                         popsize,
                         prob = genotype_freqs[i,],
                         replace = TRUE)
}


m <- cbind(substr(p1_genos,1,1), substr(p1_genos,2,2))   
p1 <- data.frame(Ind = paste0("M",1:popsize),Pop = rep("Mainland",popsize),m[, c(matrix(1:ncol(m), nrow = 2, byrow = T))])




# Population two - island

popsize <- 93

p <- c(0.88,0.76,0.93,0.82,0.83)
q <- 1-p

genotype_freqs <- cbind(p^2,
                        (2*p*q),
                        q^2)



het_genos <- c("AC","AT","CG","AT","GT")

p2_genos <- matrix(NA,nrow = popsize,ncol = length(genotypes))

for(i in 1:nrow(genotype_freqs))
{
  c_alleles <- strsplit(het_genos[i],split = "")[[1]]
  c_genos <- c(paste0(c_alleles[1],c_alleles[1]),
               paste0(c_alleles[1],c_alleles[2]),
               paste0(c_alleles[2],c_alleles[2]))
  p2_genos[,i] <- sample(c_genos,
                         popsize,
                         prob = genotype_freqs[i,],
                         replace = TRUE)
}


m <- cbind(substr(p2_genos,1,1), substr(p2_genos,2,2))   
p2 <- data.frame(Ind = paste0("I",1:popsize),Pop = rep("Island",popsize),m[, c(matrix(1:ncol(m), nrow = 2, byrow = T))])


dd <- rbind(p1,p2)
head(dd)
colnames(dd)[3:12] <- paste0("SNP_",rep(1:5,each = 2),rep(c(".1",".2"),5))
write.csv(dd,"Mainland_Island_SNP_data.csv",row.names = F)
