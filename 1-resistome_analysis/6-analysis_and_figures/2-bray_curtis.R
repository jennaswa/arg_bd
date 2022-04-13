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
library(dplyr)

# Grouped as alleles

# Create phyloseq (ps) object
# out_table-alleles.xlsx edited to divide number of ARG hits by Gbp data classified as Bacteria (gbps-bacteria.txt)
otu <- as.matrix(read.csv("otu_table-alleles.csv", row.names = 1))
row.names(otu) <- gsub("'", "_", row.names(otu))
sample <- read.csv("sample_data.csv", row.names = 1)

ps_object <- phyloseq(otu_table(otu, taxa_are_rows=TRUE), sample_data(sample))

# Subset data
ps_c <- subset_samples(ps_object, subset = Host %in% c("chicken"))
ps_g <- subset_samples(ps_object, subset = Host %in% c("goat"))
ps_h <- subset_samples(ps_object, subset = Host %in% c("human"))
ps_all <- subset_samples(ps_object, subset = Host %in% c("chicken", "goat", "human"))

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
  ylim(0,1) +
  labs( x ="", y = "ARG Bray-Curtis Dissimilarity")
plot
ggsave("braycurtis-chicken_human-allele.pdf", device="pdf", height=8, width=6)

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, ch_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)
group_by(ch_all, location) %>%
  summarise(
    count=n(),
    median=median(braycurtis, na.rm=TRUE),
    IQR=IQR(braycurtis, na.rm=TRUE)
  )

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
  ylim(0,1) +
  labs( x ="", y = "ARG Bray-Curtis Dissimilarity")
plot
ggsave("braycurtis-goat_human-allele.pdf", device="pdf", height=8, width=6)

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, gh_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)
group_by(gh_all, location) %>%
  summarise(
    count=n(),
    median=median(braycurtis, na.rm=TRUE),
    IQR=IQR(braycurtis, na.rm=TRUE)
  )

# Chicken rural vs. urban
distbray <- as.data.frame(as.matrix(distance(ps_c, method="bray")))
bray_c_r <- distbray[(1:4), (1:4)]
bray_c_r_list <- as.data.frame(as.matrix(unlist(bray_c_r)))
rownames(bray_c_r_list) <- c()
names(bray_c_r_list) <- c("braycurtis")
bray_c_r_list$host <- c("Chicken")
bray_c_r_list$location <- c("Rural")

bray_c_u <- distbray[(5:8), (5:8)]
bray_c_u_list <- as.data.frame(as.matrix(unlist(bray_c_u)))
rownames(bray_c_u_list) <- c()
names(bray_c_u_list) <- c("braycurtis")
bray_c_u_list$host <- c("Chicken")
bray_c_u_list$location <- c("Urban")

bray_c_all <- rbind(bray_c_r_list, bray_c_u_list)
bray_c_all <- bray_c_all[!bray_c_all$braycurtis==0,]

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, bray_c_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)
group_by(bray_c_all, location) %>%
  summarise(
    count=n(),
    median=median(braycurtis, na.rm=TRUE),
    IQR=IQR(braycurtis, na.rm=TRUE)
  )

# Goat rural vs. urban
distbray <- as.data.frame(as.matrix(distance(ps_g, method="bray")))
bray_g_r <- distbray[(1:3), (1:3)]
bray_g_r_list <- as.data.frame(as.matrix(unlist(bray_g_r)))
rownames(bray_g_r_list) <- c()
names(bray_g_r_list) <- c("braycurtis")
bray_g_r_list$host <- c("Goat")
bray_g_r_list$location <- c("Rural")

bray_g_u <- distbray[(4:7), (4:7)]
bray_g_u_list <- as.data.frame(as.matrix(unlist(bray_g_u)))
rownames(bray_g_u_list) <- c()
names(bray_g_u_list) <- c("braycurtis")
bray_g_u_list$host <- c("Goat")
bray_g_u_list$location <- c("Urban")

bray_g_all <- rbind(bray_g_r_list, bray_g_u_list)
bray_g_all <- bray_g_all[!bray_g_all$braycurtis==0,]

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, bray_g_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)
group_by(bray_g_all, location) %>%
  summarise(
    count=n(),
    median=median(braycurtis, na.rm=TRUE),
    IQR=IQR(braycurtis, na.rm=TRUE)
  )

# Human rural vs. urban
distbray <- as.data.frame(as.matrix(distance(ps_h, method="bray")))
bray_h_r <- distbray[(1:4), (1:4)]
bray_h_r_list <- as.data.frame(as.matrix(unlist(bray_h_r)))
rownames(bray_h_r_list) <- c()
names(bray_h_r_list) <- c("braycurtis")
bray_h_r_list$host <- c("Human")
bray_h_r_list$location <- c("Rural")

bray_h_u <- distbray[(5:8), (5:8)]
bray_h_u_list <- as.data.frame(as.matrix(unlist(bray_h_u)))
rownames(bray_h_u_list) <- c()
names(bray_h_u_list) <- c("braycurtis")
bray_h_u_list$host <- c("Human")
bray_h_u_list$location <- c("Urban")

bray_h_all <- rbind(bray_h_r_list, bray_h_u_list)
bray_h_all <- bray_h_all[!bray_h_all$braycurtis==0,]

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, bray_h_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)
group_by(bray_h_all, location) %>%
  summarise(
    count=n(),
    median=median(braycurtis, na.rm=TRUE),
    IQR=IQR(braycurtis, na.rm=TRUE)
  )

bray_all_ru <- rbind(bray_c_all, bray_g_all, bray_h_all)

plot <- ggplot(bray_all_ru, aes(location, braycurtis)) +
  geom_boxplot(size=0.75, fill=c("#89C5DA", "#DA5724", "#89C5DA", "#DA5724", "#89C5DA", "#DA5724")) +
  theme(strip.background = element_blank(),
        strip.text.x = element_text(color="black", size=14),
        panel.background=element_blank(), panel.border=element_rect(color = "black", fill = NA, size=2),
        axis.text.x = element_text(color="black", size=14), axis.text.y = element_text(color="black", size=14),
        axis.title.y=element_text(size=14),
        plot.title=element_text(size=14, hjust=0.5)) +
  scale_y_continuous(breaks = seq(0.00, 1.00, by=0.25), limits=c(0.00, 1.00), expand=c(0,0)) +
  labs( x ="", y = "ARG Allele Bray-Curtis Dissimilarity") +
  facet_grid(.~host, scales="free_x", space="free_x")
plot
ggsave("braycurtis-all_hosts-allele.pdf", device="pdf", height=4, width=6, useDingbats=FALSE)


# Grouped by drug class

# Create phyloseq (ps) object
# out_table-drug_class.xlsx edited to divide number of ARG hits by Gbp data classified as Bacteria (gbps-bacteria.txt)
otu <- as.matrix(read.csv("otu_table-drug_class.csv", row.names = 1))
row.names(otu) <- gsub("'", "_", row.names(otu))
sample <- read.csv("sample_data.csv", row.names = 1)

ps_object <- phyloseq(otu_table(otu, taxa_are_rows=TRUE), sample_data(sample))

# Subset data
ps_c <- subset_samples(ps_object, subset = Host %in% c("chicken"))
ps_g <- subset_samples(ps_object, subset = Host %in% c("goat"))
ps_h <- subset_samples(ps_object, subset = Host %in% c("human"))
ps_all <- subset_samples(ps_object, subset = Host %in% c("chicken", "goat", "human"))

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
  ylim(0,1) +
  labs( x ="", y = "ARG Bray-Curtis Dissimilarity")
plot
ggsave("braycurtis-chicken_human-drug_class.pdf", device="pdf", height=8, width=6)

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, ch_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)
group_by(ch_all, location) %>%
  summarise(
    count=n(),
    median=median(braycurtis, na.rm=TRUE),
    IQR=IQR(braycurtis, na.rm=TRUE)
  )

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
  ylim(0,1) +
  labs( x ="", y = "ARG Bray-Curtis Dissimilarity")
plot
ggsave("braycurtis-goat_human-drug_class.pdf", device="pdf", height=8, width=6)

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, gh_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)
group_by(gh_all, location) %>%
  summarise(
    count=n(),
    median=median(braycurtis, na.rm=TRUE),
    IQR=IQR(braycurtis, na.rm=TRUE)
  )

# Chicken rural vs. urban
distbray <- as.data.frame(as.matrix(distance(ps_c, method="bray")))
bray_c_r <- distbray[(1:4), (1:4)]
bray_c_r_list <- as.data.frame(as.matrix(unlist(bray_c_r)))
rownames(bray_c_r_list) <- c()
names(bray_c_r_list) <- c("braycurtis")
bray_c_r_list$host <- c("Chicken")
bray_c_r_list$location <- c("Rural")

bray_c_u <- distbray[(5:8), (5:8)]
bray_c_u_list <- as.data.frame(as.matrix(unlist(bray_c_u)))
rownames(bray_c_u_list) <- c()
names(bray_c_u_list) <- c("braycurtis")
bray_c_u_list$host <- c("Chicken")
bray_c_u_list$location <- c("Urban")

bray_c_all <- rbind(bray_c_r_list, bray_c_u_list)
bray_c_all <- bray_c_all[!bray_c_all$braycurtis==0,]

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, bray_c_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)
group_by(bray_c_all, location) %>%
  summarise(
    count=n(),
    median=median(braycurtis, na.rm=TRUE),
    IQR=IQR(braycurtis, na.rm=TRUE)
  )

# Goat rural vs. urban
distbray <- as.data.frame(as.matrix(distance(ps_g, method="bray")))
bray_g_r <- distbray[(1:3), (1:3)]
bray_g_r_list <- as.data.frame(as.matrix(unlist(bray_g_r)))
rownames(bray_g_r_list) <- c()
names(bray_g_r_list) <- c("braycurtis")
bray_g_r_list$host <- c("Goat")
bray_g_r_list$location <- c("Rural")

bray_g_u <- distbray[(4:7), (4:7)]
bray_g_u_list <- as.data.frame(as.matrix(unlist(bray_g_u)))
rownames(bray_g_u_list) <- c()
names(bray_g_u_list) <- c("braycurtis")
bray_g_u_list$host <- c("Goat")
bray_g_u_list$location <- c("Urban")

bray_g_all <- rbind(bray_g_r_list, bray_g_u_list)
bray_g_all <- bray_g_all[!bray_g_all$braycurtis==0,]

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, bray_g_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)
group_by(bray_g_all, location) %>%
  summarise(
    count=n(),
    median=median(braycurtis, na.rm=TRUE),
    IQR=IQR(braycurtis, na.rm=TRUE)
  )

# Human rural vs. urban
distbray <- as.data.frame(as.matrix(distance(ps_h, method="bray")))
bray_h_r <- distbray[(1:4), (1:4)]
bray_h_r_list <- as.data.frame(as.matrix(unlist(bray_h_r)))
rownames(bray_h_r_list) <- c()
names(bray_h_r_list) <- c("braycurtis")
bray_h_r_list$host <- c("Human")
bray_h_r_list$location <- c("Rural")

bray_h_u <- distbray[(5:8), (5:8)]
bray_h_u_list <- as.data.frame(as.matrix(unlist(bray_h_u)))
rownames(bray_h_u_list) <- c()
names(bray_h_u_list) <- c("braycurtis")
bray_h_u_list$host <- c("Human")
bray_h_u_list$location <- c("Urban")

bray_h_all <- rbind(bray_h_r_list, bray_h_u_list)
bray_h_all <- bray_h_all[!bray_h_all$braycurtis==0,]

# Wilcoxon rank sum test
wilcox.test(braycurtis~location, bray_h_all, paired=FALSE, correct=FALSE, conf.int=TRUE, conf.level=0.95)
group_by(bray_h_all, location) %>%
  summarise(
    count=n(),
    median=median(braycurtis, na.rm=TRUE),
    IQR=IQR(braycurtis, na.rm=TRUE)
  )

bray_all_ru <- rbind(bray_c_all, bray_g_all, bray_h_all)

plot <- ggplot(bray_all_ru, aes(location, braycurtis)) +
  geom_boxplot(size=0.75, fill=c("#89C5DA", "#DA5724", "#89C5DA", "#DA5724", "#89C5DA", "#DA5724")) +
  theme(strip.background = element_blank(),
        strip.text.x = element_text(color="black", size=14),
        panel.background=element_blank(), panel.border=element_rect(color = "black", fill = NA, size=2),
        axis.text.x = element_text(color="black", size=14), axis.text.y = element_text(color="black", size=14),
        axis.title.y=element_text(size=14),
        plot.title=element_text(size=14, hjust=0.5)) +
  scale_y_continuous(breaks = seq(0.00, 1.00, by=0.25), limits=c(0.00, 1.00), expand=c(0,0)) +
  labs( x ="", y = "ARG Drug Class Bray-Curtis Dissimilarity") +
  facet_grid(.~host, scales="free_x", space="free_x")
plot
ggsave("braycurtis-all_hosts-drug_class.pdf", device="pdf", height=4, width=6, useDingbats=FALSE)
