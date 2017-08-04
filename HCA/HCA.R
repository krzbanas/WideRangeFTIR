# HCA

## HCA Complete Linkage

# draw your plots
hca1_NIR <- eclust(NIR1n[[]], "hclust", k = 4, method = "complete", graph = FALSE) 
h1<-fviz_dend(hca1_NIR, rect = TRUE, show_labels = TRUE, k_colors = cols01, main="NIR") 
hca1_MIR <- eclust(MIR1n[[]], "hclust", k = 4, method = "complete", graph = FALSE) 
h2<-fviz_dend(hca1_MIR, rect = TRUE, show_labels = TRUE, k_colors = cols01, main="MIR")
hca1_FIR <- eclust(FIR1n[[]], "hclust", k = 4, method = "complete", graph = FALSE) 
h3<-fviz_dend(hca1_FIR, rect = TRUE, show_labels = TRUE, k_colors = cols01, main="FIR")

#merge all plots within one grid 
grid.arrange(h1, h2, h3, ncol=3)
h <- arrangeGrob(h1, h2, h3, ncol=3)

#save plot to pdf
ggsave("FIGURES/HCA_CL_01.pdf", h, width = 14, height = 8)
#save plot to png
ggsave("FIGURES/HCA_CL_01.png", h, width = 14, height = 8)


## HCA Complete Linkage - Silhoutte Plots

silNIR <- silhouette(hca1_NIR$cluster, dist(NIR1n[[]]))
sh1<-fviz_silhouette(silNIR)+scale_colour_manual(values=cols01)+
  scale_fill_manual(values=cols01)
silMIR <- silhouette(hca1_MIR$cluster, dist(MIR1n[[]]))
sh2<-fviz_silhouette(silMIR)+scale_colour_manual(values=cols01)+
  scale_fill_manual(values=cols01)
silFIR <- silhouette(hca1_FIR$cluster, dist(FIR1n[[]]))
sh3<-fviz_silhouette(silFIR)+scale_colour_manual(values=cols01)+
  scale_fill_manual(values=cols01)
grid.arrange(sh1, sh2, sh3, ncol=3)
sh123 <- arrangeGrob(sh1, sh2, sh3, ncol=3) 


#save plot to pdf
ggsave("FIGURES/HCA_SP_01.pdf", sh123, width = 14, height = 8)
#save plot to png
ggsave("FIGURES/HCA_SP_01.png", sh123, width = 14, height = 8)

