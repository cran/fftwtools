### R code from vignette source 'testTimeAndSimpleUse.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: foo
###################################################
options(keep.source = TRUE, width = 60)
fftwtools1 <- packageDescription("fftwtools")


###################################################
### code chunk number 2: timing1
###################################################

library("fftwtools")

## we try power of 2 but we can try other values
## we do ffts of 2^20 points

## reduced to 2^8 for package distribution.
fftLength <- 2^8

set.seed(10)

g <- rnorm(fftLength)


##timing # Start the clock!
ptm <- proc.time()

# Loop through 
for (i in 1:100){
    fft(g)
}

# Stop the clock
proc.time() - ptm



###################################################
### code chunk number 3: <timing2
###################################################
##timing # Start the clock!
ptm <- proc.time()

# Loop through 
for (i in 1:100){
    fftw(g)
}

# Stop the clock
proc.time() - ptm


###################################################
### code chunk number 4: <timing3
###################################################
##timing # Start the clock!
ptm <- proc.time()

# Loop through 
for (i in 1:100){
    fftw(g, HermConj=FALSE)
}

# Stop the clock
proc.time() - ptm


###################################################
### code chunk number 5: replace function
###################################################
 
## basic option ot overwrite calls
fft <- function(z, inverse = FALSE) {
    fftwtools::fftw(z, inverse=inverse)
}

mvfft <- function(z, inverse=FALSE) {
    fftwtools::mvfftw(z, invese=inverse)
}


###################################################
### code chunk number 6: <replace without conjugate
###################################################

fft <- function(z, inverse = FALSE) {
    fftwtools::fftw(z, inverse=inverse, HermConj=FALSE)
}


###################################################
### code chunk number 7: cleanup1
###################################################
rm(fft, mvfft)


