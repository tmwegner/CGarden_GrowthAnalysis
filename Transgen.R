library(dplyr)
library(ggplot2)
Transgen <- read.csv("CGarden_Transgen_121023.csv", as.is=F)
Transgen
Transgen$Mother <- factor(Transgen$Mother)
Transgen$Type <- factor(Transgen$Type,levels=c("OxO-","OxO+"))
Transgen <- subset(Transgen, Type %in% c("OxO-","OxO+"))
class(Transgen$Mother)
class(Transgen$Type)
levels(Transgen$Type)

# get rid of DC
Transgen2 <- subset(Transgen, Mother != "DC")
Transgen2$Mother <- droplevels(Transgen2$Mother)

ggplot(Transgen2, aes(x = Mother, y = Height, fill = Type))+
  geom_boxplot()+
  ylab("Height (m)")+
  xlab("OxO-/OxO+ Full-Sibling Families")+
  scale_fill_manual(values = c("tan3", "forestgreen"))



# simple statistical model
lm1 <- lm(Height~Mother*Type,data=Transgen2)
plot(lm1) # assess assumptions
anova(lm1) # main effects of Mother and Type, no interaction
summary(lm1)

getwd()


# note OxO+ lower value (negative number)
# note ANOVA table

Plus <- 
