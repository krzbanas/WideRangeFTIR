## load libraries
library(hyperSpec)
library(factoextra) #eclust
library(gridExtra) #grid.arrange
library(cluster) #silhouette
library(FactoMineR) #function PCA (capital letters)
library(qcc) #pareto.chart
library(dplyr)#select mutate summarise
library(tidyr)#gather

## ggplot2 theme modifications
theme_new <- theme_set(theme_bw())
theme_new <- theme_update(axis.text = element_text(size = 14), axis.title = element_text(size = 20,face = "bold"))


## defining colours
cols01<-c("#e41a1c","#377eb8","#ff7f00","#000000")

#C4 red #e41a1c
#PETN blue #377eb8
#RDX orange #ff7f00
#TNT black #000000


#Session Info
devtools::session_info()


