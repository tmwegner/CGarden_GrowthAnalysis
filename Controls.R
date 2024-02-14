library(dplyr)
library(ggplot2)
Controls <- read.csv("CGarden_Controls_121023.csv")
Controls
ggplot(Controls, aes(x = Mother, y = Height, fill = Type))+
  geom_boxplot()+
  ylab("Height (m)")+
  xlab("Non-transgenic Control Families")+
  scale_fill_manual(values = c("pink", "#89CFF0", "lavender"))
                    