# Calculating Distance Matrices - Plot PCoA
# ARGs in Bangladesh

# # Install bioconductor
# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install(version = "3.10")
# 
# # Install phyloseq package
# BiocManager::install("phyloseq")
# BiocManager::install("XVector")
# BiocManager::install("rhdf5")

rm(list=ls())

library(vegan); packageVersion("vegan")
library(phyloseq); packageVersion("phyloseq")
library(ggplot2)


# Grouped as alleles

# Create phyloseq (ps) object
# otu_table-alleles.xlsx edited to divide number of ARG hits by Gbp data classified as Bacteria (gbps-bacteria.txt)
otu <- as.matrix(read.csv("otu_table-alleles.csv", row.names = 1))
row.names(otu) <- gsub("'", "_", row.names(otu))
sample <- read.csv("sample_data.csv", row.names = 1)

sample$Host[sample$Host=="chicken"] <- "Chicken"
sample$Host[sample$Host=="goat"] <- "Goat"
sample$Host[sample$Host=="human"] <- "Human"

ps_object <- phyloseq(otu_table(otu, taxa_are_rows=TRUE), sample_data(sample))

# PCoA of bray curtis dissimilarity-color coded by sample type-shape by urban vs rural
all.pcoa.bray <- ordinate(ps_object, method="PCoA", distance="bray")
pcoa_plot <- plot_ordination(ps_object, all.pcoa.bray, color="Host", shape="Location") +
  geom_point(size=2, stroke=1) +
  scale_shape_manual(values=c(2,3)) +
  scale_color_manual(values=c("#FF8C00", "#551A8B", "#41ab5d"))+
  ggtitle("ARG Allele") +
  theme(panel.background=element_blank(), panel.border=element_rect(color="black", fill=NA, size=2), legend.title=element_blank(), legend.key=element_rect(fill=NA), axis.text.y=element_text(size=12, color="black"), axis.text.x=element_text(size=12, color="black"),
        axis.title=element_text(face="bold"), plot.title=element_text(face="bold"))
pcoa_plot
ggsave("pcoa-allele.pdf", device="pdf", height=4, width=6, useDingbats=FALSE)

# PERMANOVA
all = as(sample_data(ps_object), "data.frame")
all_bray = phyloseq::distance(ps_object, "bray")
all_adonis = adonis(all_bray ~ Location+Host, all)

all_adonis


# Grouped by drug class

# Create phyloseq (ps) object
# otu_table-drug_class.xlsx edited to divide number of ARG hits by Gbp data classified as Bacteria (gbps-bacteria.txt)
otu <- as.matrix(read.csv("otu_table-drug_class.csv", row.names = 1))
row.names(otu) <- gsub("'", "_", row.names(otu))
sample <- read.csv("sample_data.csv", row.names = 1)

sample$Host[sample$Host=="chicken"] <- "Chicken"
sample$Host[sample$Host=="goat"] <- "Goat"
sample$Host[sample$Host=="human"] <- "Human"

ps_object <- phyloseq(otu_table(otu, taxa_are_rows=TRUE), sample_data(sample))

# PCoA of bray curtis dissimilarity-color coded by sample type-shape by urban vs rural
all.pcoa.bray <- ordinate(ps_object, method="PCoA", distance="bray")
pcoa_plot <- plot_ordination(ps_object, all.pcoa.bray, color="Host", shape="Location") +
  geom_point(size=2, stroke=1) +
  scale_shape_manual(values=c(2,3)) +
  scale_color_manual(values=c("#FF8C00", "#551A8B", "#41ab5d"))+
  ggtitle("ARG Drug Class") +
  theme(panel.background=element_blank(), panel.border=element_rect(color="black", fill=NA, size=2), legend.title=element_blank(), legend.key=element_rect(fill=NA), axis.text.y=element_text(size=12, color="black"), axis.text.x=element_text(size=12, color="black"),
        axis.title=element_text(face="bold"), plot.title=element_text(face="bold"))
pcoa_plot
ggsave("pcoa-drug_class.pdf", device="pdf", height=4, width=6, useDingbats=FALSE)


# PERMANOVA
all = as(sample_data(ps_object), "data.frame")
all_bray = phyloseq::distance(ps_object, "bray")
all_adonis = adonis(all_bray ~ Location+Host, all)

all_adonis


# Grouped as alleles - aminoglycoside

# Create phyloseq (ps) object
otu <- as.matrix(read.csv("otu_table-alleles-Aminoglycoside.csv", row.names = 1))
otu <- otu[, colSums(otu != 0) > 0]
row.names(otu) <- gsub("'", "_", row.names(otu))
sample <- read.csv("sample_data.csv", row.names = 1)

sample$Host[sample$Host=="chicken"] <- "Chicken"
sample$Host[sample$Host=="goat"] <- "Goat"
sample$Host[sample$Host=="human"] <- "Human"

ps_object <- phyloseq(otu_table(otu, taxa_are_rows=TRUE), sample_data(sample))

# PCoA of bray curtis dissimilarity-color coded by sample type-shape by urban vs rural
all.pcoa.bray <- ordinate(ps_object, method="PCoA", distance="bray")
pcoa_plot <- plot_ordination(ps_object, all.pcoa.bray, color="Host", shape="Location") +
  geom_point(size=2, stroke=1) +
  scale_shape_manual(values=c(2,3)) +
  scale_color_manual(values=c("#FF8C00", "#551A8B", "#41ab5d"))+
  ggtitle("Aminoglycosides") +
  theme(panel.background=element_blank(), panel.border=element_rect(color="black", fill=NA, size=2), legend.title=element_blank(), legend.key=element_rect(fill=NA), axis.text.y=element_text(size=12, color="black"), axis.text.x=element_text(size=12, color="black"),
        axis.title=element_text(face="bold"), plot.title=element_text(face="bold", hjust=0.5))
pcoa_plot
ggsave("pcoa-allele-aminoglycoside.pdf", device="pdf", height=4, width=6, useDingbats=FALSE)


# Grouped as alleles - beta-lactam

# Create phyloseq (ps) object
otu <- as.matrix(read.csv("otu_table-alleles-Beta-lactam.csv", row.names = 1))
otu <- otu[, colSums(otu != 0) > 0]
row.names(otu) <- gsub("'", "_", row.names(otu))
sample <- read.csv("sample_data.csv", row.names = 1)

sample$Host[sample$Host=="chicken"] <- "Chicken"
sample$Host[sample$Host=="goat"] <- "Goat"
sample$Host[sample$Host=="human"] <- "Human"

ps_object <- phyloseq(otu_table(otu, taxa_are_rows=TRUE), sample_data(sample))

# PCoA of bray curtis dissimilarity-color coded by sample type-shape by urban vs rural
all.pcoa.bray <- ordinate(ps_object, method="PCoA", distance="bray")
pcoa_plot <- plot_ordination(ps_object, all.pcoa.bray, color="Host", shape="Location") +
  geom_point(size=2, stroke=1) +
  scale_shape_manual(values=c(2,3)) +
  scale_color_manual(values=c("#FF8C00", "#551A8B", "#41ab5d"))+
  ggtitle("Beta-lactams") +
  theme(panel.background=element_blank(), panel.border=element_rect(color="black", fill=NA, size=2), legend.title=element_blank(), legend.key=element_rect(fill=NA), axis.text.y=element_text(size=12, color="black"), axis.text.x=element_text(size=12, color="black"),
        axis.title=element_text(face="bold"), plot.title=element_text(face="bold", hjust=0.5))
pcoa_plot
ggsave("pcoa-allele-betalactam.pdf", device="pdf", height=4, width=6, useDingbats=FALSE)


# Grouped as alleles - MLS

# Create phyloseq (ps) object
otu <- as.matrix(read.csv("otu_table-alleles-MLS.csv", row.names = 1))
otu <- otu[, colSums(otu != 0) > 0]
row.names(otu) <- gsub("'", "_", row.names(otu))
sample <- read.csv("sample_data.csv", row.names = 1)

sample$Host[sample$Host=="chicken"] <- "Chicken"
sample$Host[sample$Host=="goat"] <- "Goat"
sample$Host[sample$Host=="human"] <- "Human"

ps_object <- phyloseq(otu_table(otu, taxa_are_rows=TRUE), sample_data(sample))

# PCoA of bray curtis dissimilarity-color coded by sample type-shape by urban vs rural
all.pcoa.bray <- ordinate(ps_object, method="PCoA", distance="bray")
pcoa_plot <- plot_ordination(ps_object, all.pcoa.bray, color="Host", shape="Location") +
  geom_point(size=2, stroke=1) +
  scale_shape_manual(values=c(2,3)) +
  scale_color_manual(values=c("#FF8C00", "#551A8B", "#41ab5d"))+
  ggtitle("Macrolides-lincosamides-streptogramins") +
  theme(panel.background=element_blank(), panel.border=element_rect(color="black", fill=NA, size=2), legend.title=element_blank(), legend.key=element_rect(fill=NA), axis.text.y=element_text(size=12, color="black"), axis.text.x=element_text(size=12, color="black"),
        axis.title=element_text(face="bold"), plot.title=element_text(face="bold", hjust=0.5))
pcoa_plot
ggsave("pcoa-allele-mls.pdf", device="pdf", height=4, width=6, useDingbats=FALSE)


# Grouped as alleles - tetracycline

# Create phyloseq (ps) object
otu <- as.matrix(read.csv("otu_table-alleles-Tetracycline.csv", row.names = 1))
otu <- otu[, colSums(otu != 0) > 0]
row.names(otu) <- gsub("'", "_", row.names(otu))
sample <- read.csv("sample_data.csv", row.names = 1)

sample$Host[sample$Host=="chicken"] <- "Chicken"
sample$Host[sample$Host=="goat"] <- "Goat"
sample$Host[sample$Host=="human"] <- "Human"

ps_object <- phyloseq(otu_table(otu, taxa_are_rows=TRUE), sample_data(sample))

# PCoA of bray curtis dissimilarity-color coded by sample type-shape by urban vs rural
all.pcoa.bray <- ordinate(ps_object, method="PCoA", distance="bray")
pcoa_plot <- plot_ordination(ps_object, all.pcoa.bray, color="Host", shape="Location") +
  geom_point(size=2, stroke=1) +
  scale_shape_manual(values=c(2,3)) +
  scale_color_manual(values=c("#FF8C00", "#551A8B", "#41ab5d"))+
  ggtitle("Tetracyclines") +
  theme(panel.background=element_blank(), panel.border=element_rect(color="black", fill=NA, size=2), legend.title=element_blank(), legend.key=element_rect(fill=NA), axis.text.y=element_text(size=12, color="black"), axis.text.x=element_text(size=12, color="black"),
        axis.title=element_text(face="bold"), plot.title=element_text(face="bold", hjust=0.5))
pcoa_plot
ggsave("pcoa-allele-tetracycline.pdf", device="pdf", height=4, width=6, useDingbats=FALSE)
