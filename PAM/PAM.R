# PAM - partition around medoids

pam1_NIR <- eclust(NIR1n[[]], "pam", k = 4, graph = FALSE) 
p1<-fviz_cluster(pam1_NIR, geom = "point", pointsize=2, ellipse.type = "confidence", main="NIR")+
  scale_colour_manual(values=cols01)

pam1_MIR <- eclust(MIR1n[[]], "pam", k = 4, graph = FALSE) 
p2<-fviz_cluster(pam1_MIR, geom = "point", pointsize=2, ellipse.type = "confidence", main="MIR")+
  scale_colour_manual(values=cols01)

pam1_FIR <- eclust(FIR1n[[]], "pam", k = 4, graph = FALSE) 
p3<-fviz_cluster(pam1_FIR, geom = "point", pointsize=2, ellipse.type = "confidence", main="FIR")+
  scale_colour_manual(values=cols01)



#merge all plots within one grid 
grid.arrange(p1, p2, p3, ncol=3)
p <- arrangeGrob(p1, p2, p3, ncol=3)

#save plot to pdf
ggsave("FIGURES/PAM_CL_01.pdf", p, width = 14, height = 8)
#save plot to png
ggsave("FIGURES/PAM_CL_01.png", p, width = 14, height = 8)


## Silhoutte Plots

pam2_NIR <- pam(scale(NIR1n[[]]), 4)
sp1<-fviz_silhouette(silhouette(pam2_NIR))+scale_colour_manual(values=cols01)+
  scale_fill_manual(values=cols01)

pam2_MIR <- pam(scale(MIR1n[[]]), 4)
sp2<-fviz_silhouette(silhouette(pam2_MIR))+scale_colour_manual(values=cols01)+
  scale_fill_manual(values=cols01)

pam2_FIR <- pam(scale(FIR1n[[]]), 4)
sp3<-fviz_silhouette(silhouette(pam2_FIR))+scale_colour_manual(values=cols01)+
  scale_fill_manual(values=cols01)
grid.arrange(sp1, sp2, sp3, ncol=3)
sp <- arrangeGrob(sp1, sp2, sp3, ncol=3)


#save plot to pdf
ggsave("FIGURES/PAM_SP_01.pdf", sp, width = 14, height = 8)
#save plot to png
ggsave("FIGURES/PAM_SP_01.png", sp, width = 14, height = 8)

