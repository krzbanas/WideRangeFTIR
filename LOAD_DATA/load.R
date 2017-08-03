#here will be code

#load data
#range 7600-400
#full path to the data files
data <- file.path("DATA/range_7600_400")
#read list of files 
files <- list.files(path = data)
#read firest spectrum to the buffer
buffer <- read.table(file.path(data,files [1]), sep=",")
#allocate matrix 
spc <- matrix (ncol = nrow (buffer), nrow = length (files))
#assign first spectrum in the first row of matrix
spc [1, ] <- buffer [, 2]
#rest of the spectra by the loop
for (f in seq (along = files)[-1]) {
  buffer <- read.table(file.path(data,files [f]), sep=",")
  spc [f, ] <- buffer[, 2]
}
#wavenumbers vector
wavenumber = buffer[, 1]
explosive<-substr(files, 1, 4)
explosive<-factor(explosive, levels=c ("C_4_", "PETN", "RDX_", "TNT_"), labels=c ("C-4", "PETN","RDX", "TNT"))

d1 = data.frame(files, explosive)
#create hyperSpec object
a1= new ("hyperSpec", wavelength = wavenumber, spc = spc, data=d1)
a1