#PCA - distances from centroids

# function to calculate Euclidean distance
# points1 is the data matrix with points as rows and dimensions as columns
# points2 is the matrix of centers (points as rows again)

myEuclid <- function(points1, points2) {
  distanceMatrix <- matrix(NA, nrow=dim(points1)[1], ncol=dim(points2)[1])
  for(i in 1:nrow(points2)) {
    distanceMatrix[,i] <- sqrt(rowSums(t(t(points1)-points2[i,])^2))
  }
  distanceMatrix
}



##Distances for NIR range

##PCA NIR  centroids and distances
pcaNIR <- prcomp (~ spc, data = NIR1n, center = FALSE)
dataNIR <-data.frame(NIR1n$explosive,pcaNIR$x[,1:9])
centroidsNIR<-dataNIR %>%
  group_by(NIR1n.explosive) %>%
  summarise(PC1m = mean(PC1), PC2m = mean(PC2)) 
points1NIR<-as.matrix(dataNIR[,2:3])
points2NIR<-as.matrix(centroidsNIR[,2:3])

distances1NIR<-data.frame(NIR1n$explosive,myEuclid(points1NIR,points2NIR))
distances2NIR<-distances1NIR %>% gather(key, value, -NIR1n.explosive)
ggplot(distances2NIR, aes(x=key, y=value, colour=NIR1n.explosive))+geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")

distances1minNIR<-data.frame(distances1NIR,as.numeric(apply(distances1NIR,1,min)))
distances2minNIR<-distances1minNIR[,c(1,6)] %>% gather(key, value, -NIR1n.explosive)
distances2minNIR[,2]<-c("NIR")
colnames(distances2minNIR)<-c("Explosive","Range","Distance")

ggplot(distances2minNIR, aes(x=Explosive, y=Distance, colour=Explosive))+geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")
meansNIR<-distances2minNIR %>%
  group_by(Explosive)%>% 
  summarise(MeanDist = mean(Distance, na.rm=TRUE))
meansNIR



##Distances for MIR range


##PCA MIR  centroids and distances
pcaMIR <- prcomp (~ spc, data = MIR1n, center = FALSE)
dataMIR <-data.frame(MIR1n$explosive,pcaMIR$x[,1:9])
centroidsMIR<-dataMIR %>%
  group_by(MIR1n.explosive) %>%
  summarise(PC1m = mean(PC1), PC2m = mean(PC2)) 
points1MIR<-as.matrix(dataMIR[,2:3])
points2MIR<-as.matrix(centroidsMIR[,2:3])

distances1MIR<-data.frame(MIR1n$explosive,myEuclid(points1MIR,points2MIR))
distances2MIR<-distances1MIR %>% gather(key, value, -MIR1n.explosive)
ggplot(distances2MIR, aes(x=key, y=value, colour=MIR1n.explosive))+geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")

distances1minMIR<-data.frame(distances1MIR,as.numeric(apply(distances1MIR,1,min)))
distances2minMIR<-distances1minMIR[,c(1,6)] %>% gather(key, value, -MIR1n.explosive)
distances2minMIR[,2]<-c("MIR")
colnames(distances2minMIR)<-c("Explosive","Range","Distance")

ggplot(distances2minMIR, aes(x=Explosive, y=Distance, colour=Explosive))+geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")
meansMIR<-distances2minMIR %>%
  group_by(Explosive)%>% 
  summarise(MeanDist = mean(Distance, na.rm=TRUE))
meansMIR




##Distances for FIR range

##PCA FIR  centroids and distances
pcaFIR <- prcomp (~ spc, data = FIR1n, center = FALSE)
dataFIR <-data.frame(FIR1n$explosive,pcaFIR$x[,1:9])
centroidsFIR<-dataFIR %>%
  group_by(FIR1n.explosive) %>%
  summarise(PC1m = mean(PC1), PC2m = mean(PC2)) 
points1FIR<-as.matrix(dataFIR[,2:3])
points2FIR<-as.matrix(centroidsFIR[,2:3])

distances1FIR<-data.frame(FIR1n$explosive,myEuclid(points1FIR,points2FIR))
distances2FIR<-distances1FIR %>% gather(key, value, -FIR1n.explosive)
ggplot(distances2FIR, aes(x=key, y=value, colour=FIR1n.explosive))+geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")

distances1minFIR<-data.frame(distances1FIR,as.numeric(apply(distances1FIR,1,min)))
distances2minFIR<-distances1minFIR[,c(1,6)] %>% gather(key, value, -FIR1n.explosive)
distances2minFIR[,2]<-c("FIR")
colnames(distances2minFIR)<-c("Explosive","Range","Distance")

ggplot(distances2minFIR, aes(x=Explosive, y=Distance, colour=Explosive))+geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")
meansFIR<-distances2minFIR %>%
  group_by(Explosive)%>% 
  summarise(MeanDist = mean(Distance, na.rm=TRUE))
meansFIR




##Combine and plot means


means<-rbind(meansNIR,meansMIR, meansFIR)
means[,3]<-rep(c("NIR","MIR","FIR"), each=4)
colnames(means)<-c("Explosive","Distance","Range")
ggplot(means, aes(x=Range, y=Distance, colour=Explosive))+geom_point(size=4)+
  scale_colour_manual(values = cols01, name="Explosive")



