rm(list=ls())

#install.packages(c("taxize","myTAI","plyr"))

# Load packages
library(plyr)
library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(reshape2)

###PATHOGEN PREVALENCE AND ARG HOSTS - ALLELES
path <- read.csv("pathogens-assembly.csv")
path <- distinct(path)
path <- path %>%
  mutate(amr_gene="",
         amr_drug_class_edited="Pathogen present",
         type="pathogen")
path <- dplyr::rename(path, amr_allele = amr_gene)

host <- read.csv("pathogens_args_combos-assembly.csv")
host <- host %>%
  mutate(type="gene")

data <- rbind(host,path)
cols <- c("sample", "species", "arg", "class", "type")
colnames(data) <- cols
data <- data %>%
  mutate(location=as.character(substr(sample,1,1)),
         host=as.character(substr(sample,2,2))
  )

data$location[data$location=="R"] <- "Rural"
data$location[data$location=="U"] <- "Urban"
data$host[data$host=="C"] <- "Chicken"
data$host[data$host=="G"] <- "Goat"
data$host[data$host=="H"] <- "Human"

data$species <- as.character(data$species)

data$location <- factor(data$location)
data$host <- factor(data$host, levels=c("Goat","Chicken","Human"))
data$species <- factor(data$species)
data$arg <- factor(data$arg)
data$type <- factor(data$type)

data$class <- factor(data$class, levels = c("Pathogen present", "Aminoglycoside", "Beta-lactam", "Folate pathway antagonist", "Fosfomycin", "MLS", "Phenicol", "Quinolone", "Tetracycline", "Multidrug"))

# Set up color palettes
colors <- c("black", "#89C5DA", "orange", "#74D944", "#CD9BCD", "#599861", "#FFCC00", "#D14285",   
            "#673770", "#DA5724")

# Plot
pdf("pathogens_args_combos-assembly.pdf", useDingbats=FALSE, width=10, height=10)
arg_hosts <- ggplot(data, aes(x=location, y=reorder(arg, desc(class)), fill=as.factor(class))) +
  geom_point(aes(shape=type, fill=class), color="black", size=5) + 
  scale_shape_manual(values=c(21,22), guide=FALSE) +
  scale_fill_manual(values=colors) + 
  guides(fill=guide_legend(override.aes=list(shape=21))) +
  xlab("Community") +
  scale_y_discrete(position="right") +
  theme(panel.background=element_blank(), panel.border=element_rect(color="black", fill=NA, size=2),
        axis.text.x = element_text(size=14, color="black"),
        axis.text.y = element_text(size=14, color="black"),
        axis.title.x = element_text(face="bold",size=14,color="black"),
        axis.title.y = element_blank(),
        legend.title = element_blank(),
        legend.text = element_text(size=10),
        strip.background=element_blank(),
        strip.text.y.left = element_text(angle=0,face="italic",size=14,color="black"),
        strip.text.x = element_text(face="bold",size=14,color="black")) +
  facet_grid(cols=vars(host), rows=vars(species), scales = "free_y", space = "free_y", switch="y")
arg_hosts
dev.off()
ggsave("pathogens_args_combos-assembly.tiff",width=10,height=10,units="in")
