# Pre-processing

## Baseline correction
blNIR<-spc.fit.poly.below (NIR1, poly.order = 3)
NIR1b<-NIR1 -blNIR
NIR1b

blMIR<-spc.fit.poly.below (MIR1, poly.order = 3)
MIR1b<-MIR1 -blMIR
MIR1b

FIR1<-a3[,,50~670]
blFIR<-spc.fit.poly.below (FIR1, poly.order = 3)
FIR1b<-FIR1-blFIR
FIR1b

##Min-max Normalization

NIR1n<-sweep(NIR1b,1, max, "/")

MIR1n<-sweep(MIR1b,1, max, "/")

FIR1n<-sweep(FIR1b,1, max, "/")


##Binding together for spectrum in whole spectral range from 7600 to 50 cm^-1^ 

fullspec01 <- collapse(NIR1b, MIR1b, FIR1b)
fullspec02 <- orderwl(fullspec01)
#fullspec03 <- sweep(fullspec02,1, max, "/")
#not working
fullspec02


# Summary of hyperspec objects available for subsequent analysis

## Baseline corrected and normalized spectra:
  
#- NIR1n (4000-7600 cm^-1^)
#- MIR1n (400-4000 cm^-1^)
#- FIR1n (50-670 cm^-1^)
#- fullspec02 (50-7600 cm^-1^)

