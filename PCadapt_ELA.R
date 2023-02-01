#######################
PCADAPT
######################

rm(list = ls()) #clear environment

install.packages("pcadapt")

install.packages("vcfR")

library(pcadapt)

library(vcfR)

path_to_file <- "/Users/ericwitte/Desktop/ELA_Project/ELA_2_1/ELA_populations.snps.vcf"

ELA_loci <- read.pcadapt(path_to_file, type = "vcf")

x <- pcadapt(input = ELA_loci, K = 2)

plot(x, option = "screeplot")

plot(x, option = "screeplot", K = 6)

poplist.names <- c(rep("MBA",24),rep("PBA",21))

plot(x, option = "scores", pop = poplist.names)

#Bonferroni correction
padj <- p.adjust(x$pvalues,method="bonferroni")
alpha <- 0.01
outliers_ELA_45 <- which(padj < alpha)
length(outliers_ELA_45)
outliers_ELA_45
