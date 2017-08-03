
#Raw spectra

#one plot
qplotspc(aggregate(a1, a1$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+scale_colour_manual(values=cols01)+
  guides(colour=guide_legend(title="Explosive"))+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )

#with panels
qplotspc(aggregate(a1, a1$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01)+
  guides(colour=guide_legend(title="Explosive"))+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )

#one plot
qplotspc(aggregate(a2, a2$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01)+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )

qplotspc(aggregate(a3, a3$explosive, mean), mapping = aes(x =.wavelength, y = spc, colour= explosive))+
  scale_x_reverse()+facet_grid(explosive~.)+scale_colour_manual(values=cols01)+
  labs(x=expression(bold(paste ("Wavenumber", " [",cm ^-1, "]"))), y = "Absorbance [a.u.]" )
