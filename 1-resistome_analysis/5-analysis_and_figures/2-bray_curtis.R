# Calculating Distance Matrices
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

library(phyloseq); packageVersion("phyloseq")
library(ggplot2); packageVersion("ggplot2")
library(summarize)



# Grouped as alleles

# Create phyloseq (ps) object
# out_table-alleles.xlsx edited to divide number of ARG hits by Gbp data classified as Bacteria (gbps-bacteria.txt)
otu <- as.matrix(read.csv("otu_table-alleles.csv", row.names = 1))
row.names(otu) <- gsub("'", "_", row.names(otu))
sample <- read.csv("sample_data.csv", row.names = 1)

ps_object <- phyloseq(otu_table(otu, taxa_are_rows=TRUE), sample_data(sample))

# Subset data for pairwise comparisons
ps_ch_u <- subset_samples(ps_object, subset = Host %in% c("chicken", "human") & Location %in% c("Urban"))
ps_ch_r <- subset_samples(ps_object, subset = Host %in% c("chicken", "human") & Location %in% c("Rural"))
ps_gh_u <- subset_samples(ps_object, subset = Host %in% c("goat", "human") & Location %in% c("Urban"))
ps_gh_r <- subset_samples(ps_object, subset = Host %in% c("goat", "human") & Location %in% c("Rural"))

# Calculate bray curtis distance matrices

# Chicken and human

# Urban
distbray <- as.data.frame(as.matrix(distance(ps_ch_u, method="bray")))
bray_ch_u_list <- as.data.frame(as.matrix(unlist(distbray)))
rownames(bray_ch_u_list) <- c()
names(bray_ch_u_list) <- c("braycurtis")
bray_ch_u_list$location <- c("Urban")

# Rural
distbray <- as.data.frame(as.matrix(distance(ps_ch_r, method="bray")))
bray_ch_r_list <- as.data.frame(as.matrix(unlist(distbray)))
rownames(bray_ch_r_list) <- c()
names(bray_ch_r_list) <- c("braycurtis")
bray_ch_r_list$location <- c("Rural")

ch_all <- rbind(bray_ch_r_list, bray_ch_u_list)
nrow(ch_all)
length(which(ch_all$location == "Rural"))
length(which(ch_all$location == "Urban"))

plot <- ggplot(ch_all, aes(location, braycurtis)) +
  geom_boxplot(size=0.75, fill=c("#89C5DA", "#DA5724")) +
  ggtitle("Humans and Chickens") +
  theme(panel.background=element_blank(), panel.border=element_rect(color = "black", fill = NA, size=2),
        axis.text.x = element_text(color="black", size=14, face="bold"), axis.text.y = element_text(color="black", size=14, face="bold"),
        axis.title.y=element_text(size=14, face="bold"),
        plot.title=element_text(size=14, face="bold", hjust=0.5)) +
  labs( x ="", y = "ARG Bray-Curtis Dissimilarity")
plot
ggsave("braycurtis-chicken_human-allele.pdf", device="pdf", height=8, width=6)

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, ch_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)

# Goat and human

# Urban
distbray <- as.data.frame(as.matrix(distance(ps_gh_u, method="bray")))
bray_gh_u_list <- as.data.frame(as.matrix(unlist(distbray)))
rownames(bray_gh_u_list) <- c()
names(bray_gh_u_list) <- c("braycurtis")
bray_gh_u_list$location <- c("Urban")

# Rural
distbray <- as.data.frame(as.matrix(distance(ps_gh_r, method="bray")))
bray_gh_r_list <- as.data.frame(as.matrix(unlist(distbray)))
rownames(bray_gh_r_list) <- c()
names(bray_gh_r_list) <- c("braycurtis")
bray_gh_r_list$location <- c("Rural")

gh_all <- rbind(bray_gh_r_list, bray_gh_u_list)
nrow(gh_all)
length(which(gh_all$location == "Rural"))
length(which(gh_all$location == "Urban"))

plot <- ggplot(gh_all, aes(location, braycurtis)) +
  geom_boxplot(size=0.75, fill=c("#89C5DA", "#DA5724")) +
  ggtitle("Humans and Goats") +
  theme(panel.background=element_blank(), panel.border=element_rect(color = "black", fill = NA, size=2),
        axis.text.x = element_text(color="black", size=14, face="bold"), axis.text.y = element_text(color="black", size=14, face="bold"),
        axis.title.y=element_text(size=14, face="bold"),
        plot.title=element_text(size=14, face="bold", hjust=0.5)) +
  labs( x ="", y = "ARG Bray-Curtis Dissimilarity")
plot
ggsave("braycurtis-goat_human-allele.pdf", device="pdf", height=8, width=6)

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, gh_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)



# Grouped by drug class

# Create phyloseq (ps) object
# out_table-drug_class.xlsx edited to divide number of ARG hits by Gbp data classified as Bacteria (gbps-bacteria.txt)
otu <- as.matrix(read.csv("otu_table-drug_class.csv", row.names = 1))
row.names(otu) <- gsub("'", "_", row.names(otu))
sample <- read.csv("sample_data.csv", row.names = 1)

ps_object <- phyloseq(otu_table(otu, taxa_are_rows=TRUE), sample_data(sample))

# Subset data for pairwise comparisons
ps_ch_u <- subset_samples(ps_object, subset = Host %in% c("chicken", "human") & Location %in% c("Urban"))
ps_ch_r <- subset_samples(ps_object, subset = Host %in% c("chicken", "human") & Location %in% c("Rural"))
ps_gh_u <- subset_samples(ps_object, subset = Host %in% c("goat", "human") & Location %in% c("Urban"))
ps_gh_r <- subset_samples(ps_object, subset = Host %in% c("goat", "human") & Location %in% c("Rural"))

# Calculate bray curtis distance matrices

# Chicken and human

# Urban
distbray <- as.data.frame(as.matrix(distance(ps_ch_u, method="bray")))
bray_ch_u_list <- as.data.frame(as.matrix(unlist(distbray)))
rownames(bray_ch_u_list) <- c()
names(bray_ch_u_list) <- c("braycurtis")
bray_ch_u_list$location <- c("Urban")

# Rural
distbray <- as.data.frame(as.matrix(distance(ps_ch_r, method="bray")))
bray_ch_r_list <- as.data.frame(as.matrix(unlist(distbray)))
rownames(bray_ch_r_list) <- c()
names(bray_ch_r_list) <- c("braycurtis")
bray_ch_r_list$location <- c("Rural")

ch_all <- rbind(bray_ch_r_list, bray_ch_u_list)
nrow(ch_all)
length(which(ch_all$location == "Rural"))
length(which(ch_all$location == "Urban"))

plot <- ggplot(ch_all, aes(location, braycurtis)) +
  geom_boxplot(size=0.75, fill=c("#89C5DA", "#DA5724")) +
  ggtitle("Humans and Chickens") +
  theme(panel.background=element_blank(), panel.border=element_rect(color = "black", fill = NA, size=2),
        axis.text.x = element_text(color="black", size=14, face="bold"), axis.text.y = element_text(color="black", size=14, face="bold"),
        axis.title.y=element_text(size=14, face="bold"),
        plot.title=element_text(size=14, face="bold", hjust=0.5)) +
  labs( x ="", y = "ARG Bray-Curtis Dissimilarity")
plot
ggsave("braycurtis-chicken_human-drug_class.pdf", device="pdf", height=8, width=6)

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, ch_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)

# Goat and human

# Urban
distbray <- as.data.frame(as.matrix(distance(ps_gh_u, method="bray")))
bray_gh_u_list <- as.data.frame(as.matrix(unlist(distbray)))
rownames(bray_gh_u_list) <- c()
names(bray_gh_u_list) <- c("braycurtis")
bray_gh_u_list$location <- c("Urban")

# Rural
distbray <- as.data.frame(as.matrix(distance(ps_gh_r, method="bray")))
bray_gh_r_list <- as.data.frame(as.matrix(unlist(distbray)))
rownames(bray_gh_r_list) <- c()
names(bray_gh_r_list) <- c("braycurtis")
bray_gh_r_list$location <- c("Rural")

gh_all <- rbind(bray_gh_r_list, bray_gh_u_list)
nrow(gh_all)
length(which(gh_all$location == "Rural"))
length(which(gh_all$location == "Urban"))

plot <- ggplot(gh_all, aes(location, braycurtis)) +
  geom_boxplot(size=0.75, fill=c("#89C5DA", "#DA5724")) +
  ggtitle("Humans and Goats") +
  theme(panel.background=element_blank(), panel.border=element_rect(color = "black", fill = NA, size=2),
        axis.text.x = element_text(color="black", size=14, face="bold"), axis.text.y = element_text(color="black", size=14, face="bold"),
        axis.title.y=element_text(size=14, face="bold"),
        plot.title=element_text(size=14, face="bold", hjust=0.5)) +
  labs( x ="", y = "ARG Bray-Curtis Dissimilarity")
plot
ggsave("braycurtis-goat_human-drug_class.pdf", device="pdf", height=8, width=6)

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, gh_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)
