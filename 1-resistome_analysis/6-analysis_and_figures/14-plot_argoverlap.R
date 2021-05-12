# ARG sharing histogram and specific alleles plot
# ARGs in Bangladesh

rm(list=ls())

#load packages
library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(reshape2)
library(tidyr)

## Histogram

#import data from csv
argtab <- read.csv("argoverlap_histogram.csv")
str(argtab)
colnames(argtab)[1] <- "Community"

#set up color palette
colors <- c("orange", "#673770")

#plot
argtab <- melt(argtab, id.vars="Community", variable.name="Fecal.Host")
argtab$Community <- as.character(argtab$Community)
argtab$Community <- factor(argtab$Community, levels=unique(argtab$Community))

pdf("overlappingARGs-histogram.pdf", useDingbats=FALSE, width=5.5, height=5)
sharedARGs <- ggplot(argtab, aes(x=Community, y=value, fill=Fecal.Host)) +
  geom_bar(stat="identity", position="dodge", width=1.0, color="black") +
  geom_text(aes(Community, value, label = round(value, digits=2), vjust=-0.5), position=position_dodge(width=1.0), size=6, data = argtab) +
  labs(fill="Fecal.Host") +
  ylab("Distinct ARGs in Humans\nOverlapping with Animal Host (%)") +
  xlab("Community") +
  scale_fill_manual(values=colors, name="Fecal Host") + 
  scale_x_discrete(position="bottom", expand=c(0,0)) +
  scale_y_continuous(limits=c(0,100), expand=c(0,0)) +
  theme(panel.background=element_blank(), panel.border=element_rect(color="black", fill=NA, size=2),
        axis.title.x=element_blank(),
        axis.text.x=element_text(size=18, color="black"),
        axis.title.y=element_text(face="bold", size=18, color="black"),
        axis.text.y=element_text(size=18, color="black"),
        legend.title=element_text(face="bold", size=14),
        legend.text=element_text(size=14),
        strip.background=element_blank(),
        strip.text.x=element_blank())+
  facet_grid(.~Community, scales="free_x", space="free_x")
sharedARGs
dev.off()
ggsave(sharedARGs, file="overlappingARGs-histogram.tiff", width=5.5, height=5, units=c("in"))

## Histogram by drug class

#import data from csv
argtab <- read.csv("argoverlap_histogram-drug_class.csv")
str(argtab)
colnames(argtab)[1] <- "Community"
colnames(argtab)[2] <- "Class"

#set up color palette
colors <- c("orange", "#673770")

#plot
argtab <- melt(argtab, id.vars=c("Community","Class"), variable.name="Fecal.Host")
argtab$Community <- as.character(argtab$Community)
argtab$Community <- factor(argtab$Community, levels=unique(argtab$Community))
argtab$Class <- as.character(argtab$Class)
argtab$Class <- factor(argtab$Class, levels=unique(argtab$Class))

pdf("overlappingARGs-histogram-drug_class.pdf", useDingbats=FALSE, width=18, height=6.75)
sharedARGs <- ggplot(argtab, aes(x=Class, y=value, fill=Fecal.Host, width=0.85)) +
  geom_bar(stat="identity", position="dodge", width=0.9, color="black") +
  geom_text(aes(Class, value, label = round(value, digits=0), vjust=-0.5), position=position_dodge(width=0.85), size=3, data = argtab) +
  labs(fill="Fecal.Host") +
  ylab("Distinct ARGs in Humans\nOverlapping with Animal Host (%)") +
  xlab("Drug Class") +
  scale_fill_manual(values=colors, name="Fecal Host") + 
  scale_x_discrete(position="bottom", expand=expansion(add=0.75)) +
  scale_y_continuous(limits=c(0,100), expand=expansion(mult=c(0,0.03))) +
  theme(panel.background=element_blank(), panel.border=element_rect(color="black", fill=NA, size=2),
        axis.title.x=element_text(face="bold", size=14, color="black"),
        axis.text.x=element_text(size=10, color="black", angle=60, hjust=1),
        axis.title.y=element_text(face="bold", size=14, color="black"),
        axis.text.y=element_text(size=14, color="black"),
        legend.title=element_text(face="bold", size=14),
        legend.text=element_text(size=14),
        strip.background=element_blank(),
        strip.text.x = element_text(face="bold",size=14,color="black")) +
  facet_grid(.~Community, scales="free_x")
sharedARGs
dev.off()
ggsave(sharedARGs, file="overlappingARGs-histogram-drug_class.tiff", width=18, height=6.75, units=c("in"))

## Overlap of specific alleles

# import data from csv
argtab <- read.csv("argoverlap_matrix.csv")[,1:7]
str(argtab)
argtab.df <- as.data.frame.matrix(argtab)

# x axis
samp_types <- c("Rural Goat", "Rural Chicken", "Rural Human", "Urban Goat", "Urban Chicken", "Urban Human")

# remove rows with no shared genes
argtab.df$rural_shared <- rowSums(cbind(argtab.df$allele_in_RG, argtab.df$allele_in_RC, argtab.df$allele_in_RH))
argtab.df$urban_shared <- rowSums(cbind(argtab.df$allele_in_UG, argtab.df$allele_in_UC, argtab.df$allele_in_UH))

argtab.df <- argtab.df[!(argtab.df$rural_shared<2 & argtab.df$urban_shared<2),]

argtab.df$rural_shared <- NULL
argtab.df$urban_shared <- NULL

argtab.df <- melt(argtab.df, id.vars="amr_allele", variable.name="Fecal.Host")
argtab.df <- mutate(.data=argtab.df, Community=case_when(grepl("R", Fecal.Host)~"Rural", grepl("U", Fecal.Host)~"Urban"))
argtab.df <- mutate(.data=argtab.df, Fecal.Host=case_when(grepl("C", Fecal.Host)~"Chicken", grepl("G", Fecal.Host)~"Goat", grepl("H", Fecal.Host)~"Human"))

argtab.df <- argtab.df[!(argtab.df$value==0),]

# merge with drug class
class <- read.csv("argoverlap_matrix.csv")[,c(1,8)]
argtab.df <- merge(argtab.df, class, by="amr_allele")

argtab.df$amr_drug_class_edited <- as.character(argtab.df$amr_drug_class_edited)

# factor data
argtab.df$Community <- factor(argtab.df$Community)
argtab.df$Fecal.Host <- factor(argtab.df$Fecal.Host, levels = c("Human", "Chicken", "Goat"))
argtab.df$amr_allele <- factor(argtab.df$amr_allele)

argtab.df$amr_drug_class_edited <- factor(argtab.df$amr_drug_class_edited, levels = c("Multidrug", "Tetracycline", "Quinolone", "Phenicol", "Nitroimidazole", "MLS", "Glycopeptide", "Fosfomycin", "Folate pathway antagonist", "Beta-lactam", "Aminoglycoside"))

# set up color palettes
colors <- c("666666", "#DA5724", "#673770", "#D14285", "#FFCC00", "#5E738F", "#599861", "#6DDE88", "#CD9BCD", "#74D944", "orange", "#80C5DA")

# plot
pdf("overlappingAlleles.pdf", useDingbats=FALSE, width=24, height=5)
overlap <- ggplot(argtab.df, aes(x=reorder(amr_allele, desc(amr_drug_class_edited)), fill=as.factor(amr_drug_class_edited), y=Fecal.Host)) +
  geom_tile(aes(fill=amr_drug_class_edited), size=5) + 
  scale_shape_manual(values=c(21,22), guide=FALSE) +
  scale_fill_manual(values=colors) + 
  guides(fill=guide_legend(override.aes=list(shape=21), reverse=TRUE)) +
  labs(fill="Drug Class") +
  xlab("Overlapping Alleles") +
  scale_y_discrete(position="left") +
  theme(panel.background=element_blank(), panel.border=element_rect(color="black", fill=NA, size=2),
        axis.text.x = element_text(face="italic",size=14, color="black", angle=67.5, hjust=1),
        axis.text.y = element_text(size=14, color="black"),
        axis.title.x = element_text(face="bold",size=14,color="black"),
        axis.title.y = element_blank(),
        legend.title = element_text(face="bold", size=14),
        legend.text = element_text(size=14),
        strip.background=element_blank(),
        strip.text.y.left = element_text(angle=90,face="bold",size=14,color="black"),
        strip.text.x = element_text(face="bold",size=14,color="black"),
        strip.placement = "outside") +
  facet_grid(rows=vars(Community), scales = "free_y", space = "free_y", switch="y")
overlap
dev.off()
ggsave("overlappingAlleles.tiff",width=24,height=5,units="in")

