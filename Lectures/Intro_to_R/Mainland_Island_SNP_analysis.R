library(magrittr)
library(plyr)
library(ggplot2)

#Read in data
dd <- read.csv("Mainland_Island_SNP_data.csv", stringsAsFactors = F)

#Separate alleles
a1 <- dd[, seq(3, ncol(dd) - 1, 2)]
a2 <- dd[, seq(4, ncol(dd), 2)]

#Calculate heterozygosity per locus and plot data
p <-
  data.frame(
    Pop = rep(dd$Pop, 5),
    SNP = rep(colnames(a1), each = nrow(dd)),
    Het = unlist(as.vector(a1 != a2))
  ) %>%
  ddply(.(Pop, SNP),
        summarise,
        LocusHet = mean(Het)) %>%
  ggplot(aes(x = Pop, y = LocusHet)) +
  geom_point() +
  theme_classic() +
  xlab("") +
  ylab("Heterozygosity")