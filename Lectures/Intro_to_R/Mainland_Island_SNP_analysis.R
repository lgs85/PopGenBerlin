library(tidyverse)

#Read in data
dd <- read_csv("Mainland_Island_SNP_data.csv")

#Separate alleles
a1 <- dd[, seq(3, ncol(dd) - 1, 2)]
a2 <- dd[, seq(4, ncol(dd), 2)]

#Calculate heterozygosity per locus and plot data
p <-
  tibble(
    Pop = rep(dd$Pop, ncol(a1)),
    SNP = rep(colnames(a1), each = nrow(dd)),
    Het = unlist(as.vector(a1 != a2))
  ) %>%
  group_by(Pop, SNP) %>%
  summarise(LocusHet = mean(Het)) %>%
  ggplot(aes(x = Pop, y = LocusHet)) +
  geom_point() +
  theme_classic() +
  xlab("") +
  ylab("Heterozygosity")