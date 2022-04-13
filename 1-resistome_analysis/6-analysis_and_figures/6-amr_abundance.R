# AMR abundance plot
# ARGs in Bangladesh

#install.packages("tidyverse")

rm(list=ls())

#load packages
library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(reshape2)
library(tidyr)

#import data from csv
amr.abund <- read.csv("amr_abundance.csv")
str(amr.abund)
colnames(amr.abund)[1] <- "Fecal.Host"

#set up color palette
colors <- c("#89C5DA", "orange", "#74D944",  "#CD9BCD", "#6DDE88","#599861", "#5E738F", "#FFCC00", "#D14285",   
            "#673770", "#DA5724", "666666")

#plot
amr.abund.long <- melt(amr.abund, id.vars="Fecal.Host", variable.name="ARG.Class")
amr.abund.long$Fecal.Host <- as.character(amr.abund.long$Fecal.Host)
amr.abund.long$ARG.Class <- as.character(amr.abund.long$ARG.Class)

#rename values
amr.abund.long$Fecal.Host[amr.abund.long$Fecal.Host=="RC"] <- "Rural Chicken"
amr.abund.long$Fecal.Host[amr.abund.long$Fecal.Host=="RG"] <- "Rural Goat"
amr.abund.long$Fecal.Host[amr.abund.long$Fecal.Host=="RH"] <- "Rural Human"
amr.abund.long$Fecal.Host[amr.abund.long$Fecal.Host=="UC"] <- "Urban Chicken"
amr.abund.long$Fecal.Host[amr.abund.long$Fecal.Host=="UG"] <- "Urban Goat"
amr.abund.long$Fecal.Host[amr.abund.long$Fecal.Host=="UH"] <- "Urban Human"

amr.abund.long$ARG.Class[amr.abund.long$ARG.Class=="amino_abund"] <- "Aminoglycoside"
amr.abund.long$ARG.Class[amr.abund.long$ARG.Class=="beta_abund"] <- "Beta-lactam"
amr.abund.long$ARG.Class[amr.abund.long$ARG.Class=="folate_abund"] <- "Folate pathway antagonist"
amr.abund.long$ARG.Class[amr.abund.long$ARG.Class=="fosfo_abund"] <- "Fosfomycin"
amr.abund.long$ARG.Class[amr.abund.long$ARG.Class=="glyco_abund"] <- "Glycopeptide"
amr.abund.long$ARG.Class[amr.abund.long$ARG.Class=="mls_abund"] <- "MLS"
amr.abund.long$ARG.Class[amr.abund.long$ARG.Class=="nitro_abund"] <- "Nitroimidazole"
amr.abund.long$ARG.Class[amr.abund.long$ARG.Class=="pheni_abund"] <- "Phenicol"
amr.abund.long$ARG.Class[amr.abund.long$ARG.Class=="quino_abund"] <- "Quinolone"
amr.abund.long$ARG.Class[amr.abund.long$ARG.Class=="tetra_abund"] <- "Tetracycline"
amr.abund.long$ARG.Class[amr.abund.long$ARG.Class=="multi_abund"] <- "Multidrug"
amr.abund.long$ARG.Class[amr.abund.long$ARG.Class=="other_abund"] <- "Other"

#create location and species variable for facet grids
amr.abund.long <- amr.abund.long %>%
  mutate(
    Location = substr(Fecal.Host, 1, 5),
    Species = gsub("(^\\s+)|(\\s+$)", "", substr(Fecal.Host, 7, nchar(Fecal.Host)))
  )

amr.abund.long$Fecal.Host <- factor(amr.abund.long$Fecal.Host, levels=unique(amr.abund.long$Fecal.Host))
amr.abund.long$Species <- factor(amr.abund.long$Species, levels=unique(amr.abund.long$Species))
amr.abund.long$Location <- factor(amr.abund.long$Location, levels=unique(amr.abund.long$Location))

amr.abund.long$ARG.Class <- factor(amr.abund.long$ARG.Class, levels = c("Aminoglycoside", "Beta-lactam", "Folate pathway antagonist", "Fosfomycin", "Glycopeptide", "MLS", "Nitroimidazole", "Phenicol", "Quinolone", "Tetracycline", "Multidrug", "Other"))

#calculate total ARGs
totals <- amr.abund.long %>%
  group_by(Location, Species) %>%
  summarize(total = sum(value))

pdf("amr_abundance.pdf", useDingbats=FALSE, width=12, height=10)
abund <- ggplot(amr.abund.long, aes(x=Location, y=value, fill=ARG.Class)) +
  geom_bar(stat="identity", width=1.0, color="black") +
  geom_text(aes(Location, total, label = round(total, digits=0), fill = NULL, vjust=-0.5), size=6, data = totals) +
  labs(fill="Drug Class") +
  ylab("ARG Abundance (gc/Gbp Bacteria)") +
  xlab("Community") +
  scale_fill_manual(values=colors) + 
  scale_x_discrete(position="bottom", expand=c(0,0)) +
  scale_y_continuous(limits=c(0,800), expand=c(0,0)) +
  theme(panel.background=element_blank(), panel.border=element_rect(color="black", fill=NA, size=2),
        axis.title.x=element_text(face="bold", size=18, color="black"),
        axis.text.x=element_text(size=18, color="black"),
        axis.title.y=element_text(face="bold", size=18, color="black"),
        axis.text.y=element_text(size=18, color="black"),
        legend.title=element_text(face="bold", size=14),
        legend.text=element_text(size=14),
        strip.background=element_blank(),
        strip.text.x=element_text(face="bold", size=18, color="black")) +
  facet_grid(.~Species, scales="free_x", space="free_x")
abund
dev.off()
