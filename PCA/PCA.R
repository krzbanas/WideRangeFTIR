#PCA

## NIR region

pcaNIR <- prcomp (~ spc, data = NIR1n, center = FALSE)
dataNIR <-data.frame(NIR1n$explosive,pcaNIR$x[,1:9])
colnames(dataNIR)[1]<-c("Explosive")
g1<-ggplot(dataNIR,
           aes(x=PC2, y=PC1, colour=Explosive))+
  geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")
g2<-ggplot(dataNIR,
           aes(x=PC3, y=PC1, colour=Explosive))+
  geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")
grid.arrange(g1, g2, ncol=2)
g12 <- arrangeGrob(g1, g2, ncol=2)


#save plot to pdf
ggsave("FIGURES/PCA_NIR_SC_01.pdf", g12, width = 14, height = 8)
#save plot to png
ggsave("FIGURES/PCA_NIR_SC_01.png", g12, width = 14, height = 8)


## Screeplot for NIR region


res.pca.nir <- PCA(NIR1n[[]], graph = FALSE)
eigenvalues.nir <- res.pca.nir$eig
barplot(eigenvalues.nir[, 3], names.arg=1:nrow(eigenvalues.nir), 
        main = "Variances",
        xlab = "Principal Components",
        ylab = "Percentage of variances",
        col ="steelblue")
### Add connected line segments to the plot
lines(x = 1:nrow(eigenvalues.nir), eigenvalues.nir[, 2], 
      type="b", pch=19, col = "red")

dev.copy(png,"FIGURES/PCA_NIR_Scree_01.png",width = 1400, height = 800)
dev.off()


## Screeplot for NIR region - factoextra version

res.pca.nir <- PCA(NIR1n[[]], graph = FALSE)
eigen.nir <- get_eig(res.pca.nir)
fviz_screeplot(res.pca.nir, choice="variance", ncp=10, addlabels= TRUE)
#save plot to pdf
dev.copy2pdf(file="FIGURES/PCA_NIR_Scree_02.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/PCA_NIR_Scree_02.png")



## Screeplot for NIR region - qcc package version Kaiser's criterion

res.pca.nir.2 <- prcomp (NIR1n[[]]) # PCA
variances.nir <- res.pca.nir.2$sdev^2  # variances
pareto.chart (variances.nir[c(1:10)], ylab="Variances", col=rainbow(length(variances.nir)))  # plot pareto chart
abline(h=1, col="red", lwd=2, lty=2)
dev.copy(png,"FIGURES/PCA_NIR_Scree_03.png",width = 1400, height = 800)
dev.off()




## MIR region


pcaMIR <- prcomp (~ spc, data = MIR1n, center = FALSE)
dataMIR<-data.frame(MIR1n$explosive,pcaMIR$x[,1:9])
colnames(dataMIR)[1]<-c("Explosive")
g3<-ggplot(dataMIR,
           aes(x=PC2, y=PC1, colour=Explosive))+
  geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")
g4<-ggplot(dataMIR,
           aes(x=PC3, y=PC1, colour=Explosive))+
  geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")
g34<-grid.arrange(g3, g4, ncol=2)
g34

#save plot to pdf
ggsave("FIGURES/PCA_MIR_SC_01.pdf", g34, width = 14, height = 8)
#save plot to png
ggsave("FIGURES/PCA_MIR_SC_01.png", g34, width = 14, height = 8)


##Screeplot for MIR region
res.pca.mir <- PCA(MIR1n[[]], graph = FALSE)
eigenvalues.mir <- res.pca.mir$eig
barplot(eigenvalues.mir[, 2], names.arg=1:nrow(eigenvalues.mir), 
        main = "Variances",
        xlab = "Principal Components",
        ylab = "Percentage of variances",
        col ="steelblue")
# Add connected line segments to the plot
lines(x = 1:nrow(eigenvalues.mir), eigenvalues.mir[, 2], 
      type="b", pch=19, col = "red")

dev.copy(png,"FIGURES/PCA_MIR_Scree_01.png",width = 1400, height = 800)
dev.off()


##Screeplot for MIR region - factoextra version
res.pca.mir <- PCA(MIR1n[[]], graph = FALSE)
eigen.mir <- get_eig(res.pca.mir)
fviz_screeplot(res.pca.mir, choice="variance", ncp=10, addlabels= TRUE)
#save plot to pdf
dev.copy2pdf(file="FIGURES/PCA_MIR_Scree_02.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/PCA_MIR_Scree_02.png")


## Screeplot for MIR region - qcc package version Kaiser's criterion

res.pca.mir.2 <- prcomp (MIR1n[[]]) # PCA
variances.mir <- res.pca.mir.2$sdev^2  # variances
pareto.chart (variances.mir[c(1:10)], ylab="Variances", col=rainbow(length(variances.mir)))  # plot pareto chart
abline(h=1, col="red", lwd=2, lty=2)
dev.copy(png,"FIGURES/PCA_MIR_Scree_03.png",width = 1400, height = 800)
dev.off()





##FIR region

pcaFIR <- prcomp (~ spc, data = FIR1n, center = FALSE)
dataFIR <-data.frame(FIR1n$explosive,pcaFIR$x[,1:9])
colnames(dataFIR)[1]<-c("Explosive")
g5<-ggplot(dataFIR,
           aes(x=PC2, y=PC1, colour=Explosive))+
  geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")
g6<-ggplot(dataFIR,
           aes(x=PC3, y=PC1, colour=Explosive))+
  geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")
g56<-grid.arrange(g5, g6, ncol=2)
g56
#save plot to pdf
ggsave("FIGURES/PCA_FIR_SC_01.pdf", g56, width = 14, height = 8)
#save plot to png
ggsave("FIGURES/PCA_FIR_SC_01.png", g56, width = 14, height = 8)




##Screeplot for FIR region
res.pca.fir <- PCA(FIR1n[[]], graph = FALSE)
eigenvalues.fir <- res.pca.fir$eig
barplot(eigenvalues.fir[, 2], names.arg=1:nrow(eigenvalues.fir), 
        main = "Variances",
        xlab = "Principal Components",
        ylab = "Percentage of variances",
        col ="steelblue")
# Add connected line segments to the plot
lines(x = 1:nrow(eigenvalues.fir), eigenvalues.fir[, 2], 
      type="b", pch=19, col = "red")
dev.copy(png,"FIGURES/PCA_FIR_Scree_01.png",width = 1400, height = 800)
dev.off()


##Screeplot for FIR region - factoextra version
res.pca.fir <- PCA(FIR1n[[]], graph = FALSE)
eigen.fir <- get_eig(res.pca.fir)
fviz_screeplot(res.pca.fir, choice="variance", ncp=10, addlabels= TRUE)
#save plot to pdf
dev.copy2pdf(file="FIGURES/PCA_FIR_Scree_02.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/PCA_FIR_Scree_02.png")


## Screeplot for FIR region - qcc package version Kaiser's criterion

res.pca.fir.2 <- prcomp (FIR1n[[]]) # PCA
variances.fir <- res.pca.fir.2$sdev^2  # variances
pareto.chart (variances.fir[c(1:10)], ylab="Variances", col=rainbow(length(variances.fir)))  # plot pareto chart
abline(h=1, col="red", lwd=2, lty=2)
dev.copy(png,"FIGURES/PCA_FIR_Scree_03.png",width = 1400, height = 800)
dev.off()