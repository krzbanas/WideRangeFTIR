
#Raw spectra

#one plot
qplotspc(aggregate(a1, a1$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+scale_colour_manual(values=cols01)+
  guides(colour=guide_legend(title="Explosive"))+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )
#save plot to pdf
dev.copy2pdf(file="FIGURES/raw_mir_01.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/raw_mir_01.png")

#with panels
qplotspc(aggregate(a1, a1$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01)+
  guides(colour=guide_legend(title="Explosive"))+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )
#save plot to pdf
dev.copy2pdf(file="FIGURES/raw_mir_02.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/raw_mir_02.png")


#one plot
qplotspc(aggregate(a2, a2$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01)+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )

qplotspc(aggregate(a3, a3$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01)+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )

#save plot to pdf
dev.copy2pdf(file="FIGURES/raw_fir_01.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/raw_fir_01.png")




# Baseline corrected spectra


qplotspc(aggregate(NIR1b, NIR1b$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01)+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )
#save plot to pdf
dev.copy2pdf(file="FIGURES/bl_nir_01.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/bl_nir_01.png")

qplotspc(aggregate(MIR1b, MIR1b$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01)+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )
#save plot to pdf
dev.copy2pdf(file="FIGURES/bl_mir_01.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/bl_mir_01.png")

qplotspc(aggregate(FIR1b, FIR1b$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01)+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )
#save plot to pdf
dev.copy2pdf(file="FIGURES/bl_fir_01.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/bl_fir_01.png")


# Baseline corrected and min-max normalized spectra

qplotspc(aggregate(NIR1n, NIR1n$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01)+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )
#save plot to pdf
dev.copy2pdf(file="FIGURES/norm_nir_01.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/norm_nir_01.png")

qplotspc(aggregate(MIR1n, MIR1n$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01)+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )
#save plot to pdf
dev.copy2pdf(file="FIGURES/norm_mir_01.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/norm_mir_01.png")

qplotspc(aggregate(FIR1n, FIR1n$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01)+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )
#save plot to pdf
dev.copy2pdf(file="FIGURES/norm_fir_01.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/norm_fir_01.png")


qplotspc(aggregate(fullspec02, fullspec02$explosive, mean, na.rm = TRUE),
         mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01, name="Explosive")+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )


#save plot to pdf
dev.copy2pdf(file="FIGURES/bl_full_01.pdf", width = 14, height = 8)
#save plot to png
ggsave("FIGURES/bl_full_01.png")
