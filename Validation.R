#VALIDATION

#Clear all
rm(list=ls(all=TRUE))

#Install.packages
library(mFilter)

#Upload simulated data
load(file = "Data_S1.RData")

#Upload time series for the US economy
Data1 <- read.csv( "https://www.dropbox.com/s/reghacurlef3i45/data-US-annual.csv?dl=1" )

###########

#Log of actual series
ly<-log(Data1$gdp)
lc<-log(Data1$cons)
lid<-log(Data1$inv)
lim<-log(Data1$imp)

#Log of simulated series
ly_s<-log(y[1,3:100])
lc_s<-log(c[1,3:100])
lid_s<-log(id[1,3:100])
lim_s<-log(im[1,3:100])

#Filter actual series
y.hp <- hpfilter(ly, freq=6.25, drift=TRUE)
c.hp <- hpfilter(lc, freq=6.25, drift=TRUE)       
id.hp <- hpfilter(lid, freq=6.25, drift=TRUE)       
im.hp <- hpfilter(lim, freq=6.25, drift=TRUE)  

#Filter simulated series
y_s.hp <- hpfilter(ly_s, freq=6.25, drift=TRUE)
c_s.hp <- hpfilter(lc_s, freq=6.25, drift=TRUE)       
id_s.hp <- hpfilter(lid_s, freq=6.25, drift=TRUE)       
im_s.hp <- hpfilter(lim_s, freq=6.25, drift=TRUE) 

#Compute auto-correlation of cyclical components of actual series
acfY=acf(y.hp$cycle, lag.max=20, plot=F)      #GDP
acfC=acf(c.hp$cycle, lag.max=20, plot=F)      #Consumption
acfI=acf(id.hp$cycle, lag.max=20, plot=F)      #Investment
acfM=acf(im.hp$cycle, lag.max=20, plot=F)      #Import

#Compute auto-correlation of cyclical components of simulated series
acfY_s=acf(y_s.hp$cycle,lag.max=20, plot=F) #GDP
acfC_s=acf(c_s.hp$cycle,lag.max=20, plot=F) #Consumption
acfI_s=acf(id_s.hp$cycle,lag.max=20, plot=F) #Investment
acfM_s=acf(im_s.hp$cycle,lag.max=20, plot=F) #Import

#Compute cross-correlation of cyclical components of actual series
ccfY=ccf(y.hp$cycle,y.hp$cycle,lag.max=20, plot=F) #GDP
ccfC=ccf(y.hp$cycle,c.hp$cycle,lag.max=20, plot=F) #consumption
ccfI=ccf(y.hp$cycle,id.hp$cycle,lag.max=20, plot=F) #investment
ccfM=ccf(y.hp$cycle,im.hp$cycle,lag.max=20, plot=F) #import

#Compute cross-correlation of cyclical components of simulated series
ccfY_s=ccf(y_s.hp$cycle,y_s.hp$cycle,lag.max=20, plot=F) #GDP
ccfC_s=ccf(y_s.hp$cycle,c_s.hp$cycle,lag.max=20, plot=F) #consumption
ccfI_s=ccf(y_s.hp$cycle,id_s.hp$cycle,lag.max=20, plot=F) #investment
ccfM_s=ccf(y_s.hp$cycle,im_s.hp$cycle,lag.max=20, plot=F) #import

########

#png(file="Minsky validation 2.png",width=644,height=966)
layout(matrix(c(1,2,3,4,5,6,7,8), 4, 2, byrow = TRUE))

#Plot and compare GDP auto-correlation
plot(acfY$acf, ylab=" ", xlab="Lag", type="l", lty=2, col=1,lwd=1,ylim=c(-0.5,1),font.main=1,cex.main=1.5,main="a) Auto-correlation: GDP",cex.axis=1.5,cex.lab=1.5)
lines(acfY_s$acf, type="l", lty=1, ylim=c(-0.5,1), col=2)
legend("topright", legend=c("Actual", "Simulated"), lty=c(2,1), col=c(1,2), bty="n", cex=1.5,box.lty=0)

#Plot and compare consumption auto-correlation
plot(acfC$acf, ylab=" ", xlab="Lag", type="l", lty=2, col=1,lwd=1,ylim=c(-0.5,1),font.main=1,cex.main=1.5,main="b) Auto-correlation: consumption",cex.axis=1.5,cex.lab=1.5)
lines(acfC_s$acf, type="l", lty=1, ylim=c(-0.5,1), col=2)
legend("topright", legend=c("Actual", "Simulated"), lty=c(2,1), col=c(1,2), bty="n", cex=1.5,box.lty=0)

#Plot and compare investment auto-correlation
plot(acfI$acf, ylab=" ", xlab="Lag", type="l", lty=2, col=1,lwd=1,ylim=c(-0.5,1),font.main=1,cex.main=1.5,main="c) Auto-correlation: investment",cex.axis=1.5,cex.lab=1.5)
lines(acfI_s$acf, type="l", lty=1, ylim=c(-0.5,1), col=2)
legend("topright", legend=c("Actual", "Simulated"), lty=c(2,1), col=c(1,2), bty="n", cex=1.5,box.lty=0)

#Plot and compare import auto-correlation
plot(acfM$acf, ylab=" ", xlab="Lag", type="l", lty=2, col=1,lwd=1,ylim=c(-0.5,1),font.main=1,cex.main=1.5,main="d) Auto-correlation: import",cex.axis=1.5,cex.lab=1.5)
lines(acfM_s$acf, type="l", lty=1, ylim=c(-0.5,1), col=2)
legend("topright", legend=c("Actual", "Simulated"), lty=c(2,1), col=c(1,2), bty="n", cex=1.5,box.lty=0)

#Plot and compare GDP-GDP cross-correlation
plot(ccfY$acf, ylab=" ", xlab="Lag", type="l", lty=2, col=1,lwd=1,ylim=c(-0.5,1),font.main=1,cex.main=1.5,main="e) Cross-correlation: GDP",cex.axis=1.5,cex.lab=1.5,xaxt="n")
lines(ccfY_s$acf, type="l", lty=1, ylim=c(-0.5,1), col=3)
axis(side=1, at=c(1,6,11,16,21,26,31,36,41), labels=c("-20","-15","-10","-5","0","5","10","15","20"), cex.axis=1.5)
legend("topleft", legend=c("Actual", "Simulated"), lty=c(2,1), col=c(1,3), bty="n", cex=1.5,box.lty=0)

#Plot and compare consumption-GDP cross-correlation
plot(ccfC$acf, ylab=" ", xlab="Lag", type="l", lty=2, col=1,lwd=1,ylim=c(-0.5,1),font.main=1,cex.main=1.5,main="f) Cross-correlation: consumption",cex.axis=1.5,cex.lab=1.5,xaxt="n")
lines(ccfC_s$acf, type="l", lty=1, ylim=c(-0.5,1), col=3)
axis(side=1, at=c(1,6,11,16,21,26,31,36,41), labels=c("-20","-15","-10","-5","0","5","10","15","20"), cex.axis=1.5)
legend("topleft", legend=c("Actual", "Simulated"), lty=c(2,1), col=c(1,3), bty="n", cex=1.5,box.lty=0)

#Plot and compare investment-GDP cross-correlation
plot(ccfI$acf, ylab=" ", xlab="Lag", type="l", lty=2, col=1,lwd=1,ylim=c(-0.5,1),font.main=1,cex.main=1.5,main="g) Cross-correlation: investment",cex.axis=1.5,cex.lab=1.5,xaxt="n")
lines(ccfI_s$acf, type="l", lty=1, ylim=c(-0.5,1), col=3)
axis(side=1, at=c(1,6,11,16,21,26,31,36,41), labels=c("-20","-15","-10","-5","0","5","10","15","20"), cex.axis=1.5)
legend("topleft", legend=c("Actual", "Simulated"), lty=c(2,1), col=c(1,3), bty="n", cex=1.5,box.lty=0)

#Plot and compare import-GDP cross-correlation
plot(ccfM$acf, ylab=" ", xlab="Lag", type="l", lty=2, col=1,lwd=1,ylim=c(-0.5,1),font.main=1,cex.main=1.5,main="h) Cross-correlation: import",cex.axis=1.5,cex.lab=1.5,xaxt="n")
lines(ccfM_s$acf, type="l", lty=1, ylim=c(-0.5,1), col=3)
axis(side=1, at=c(1,6,11,16,21,26,31,36,41), labels=c("-20","-15","-10","-5","0","5","10","15","20"), cex.axis=1.5)
legend("topleft", legend=c("Actual", "Simulated"), lty=c(2,1), col=c(1,3), bty="n", cex=1.5,box.lty=0)

#dev.off()
