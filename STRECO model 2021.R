#STRECO MODEL: MERGE AND SHOW EXPERIMENTS

#Version: 21 June 2021; Last amendment: 5 October 2021

# 1) PREPARE ENVIRONMENT

#Clear all
rm(list=ls(all=TRUE))

#Set directory (optional, but suggested)
#setwd("C:/Users/...")

#2) LOAD DATA

#Upload simulated data: baseline + experiments
load("Data_base.RData")
load("Data_S4.RData")
load("Data_S5.RData")
load("Data_S6.RData")
load("Data_S7.RData")
load("Data_S8.RData")
load("Data_S9.RData")
load("Data_S10.RData")
load("Data_S11.RData")
load("Data_S12.RData")

#Define number of periods and time index
nPeriods = 100
TimeIndex = c(1:100)

#3) PERFORM ADDITIONAL CALCULATIONS
r_code_001<-paste0("Calculations.R")
source(r_code_001)
rm(r_code_001)

#4) PLOT RESULTS

#Create custom color
mycol1 <- rgb(0,255,0, max = 255, alpha = 50, names = "mygreen")
mycol2 <- rgb(255,0,0, max = 255, alpha = 50, names = "myred")
mycol3 <- rgb(0, 0, 255, max = 255, alpha = 50, names = "myblue")
mycol4 <- rgb(0, 255, 255, max = 255, alpha = 50, names = "mylightblue")
mycol5 <- rgb(255,51,226, max = 255, alpha = 50, names = "myorchid")
mycol6 <- rgb(90,90,136, max = 255, alpha = 50, names = "mygrey")
mycol7 <- rgb(112,48,160, max = 255, alpha = 50, names = "mypurple")
mycol8 <- rgb(255,192,0, max = 255, alpha = 50, names = "myorange")
mycol9 <- rgb(255,159,159, max = 255, alpha = 50, names = "mypink")

#Create and save figures (Figure 3 and Figure 4 in STRECO paper)

#png(file="fig3.png",width=800,height=1000)
layout(matrix(c(1,2,3,4,5,6,7,8,9), 3, 3, byrow = TRUE))

#Plot series of output from scenario 4
plot(100*(ya4[,59:nPeriods])/(ya0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col=2, font.main=1.2,cex.main=1.5,main="a) Government spending",ylab = 'Index',xlab = '', ylim = range(90,125),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(yu4[,59:nPeriods])/(yu0[,59:nPeriods]),rev(100*(yl4[,59:nPeriods])/(yl0[,59:nPeriods]))),col = mycol2, border = NA)
abline(h=100,lty = 1)
legend(0,126,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c(2), box.lty=0)
legend(0,122.5,c("+/- 2 s.d."), fill=mycol2, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 5
plot(100*(ya5[,59:nPeriods])/(ya0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col=3, font.main=1.2,cex.main=1.5,main="b) Monetisation",ylab = 'Index',xlab = '', ylim = range(90,125),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(yu5[,59:nPeriods])/(yu0[,59:nPeriods]),rev(100*(yl5[,59:nPeriods])/(yl0[,59:nPeriods]))),col = mycol1, border = NA)
abline(h=100,lty = 1)
legend(0,126,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c(3), box.lty=0)
legend(0,122.5,c("+/- 2 s.d."), fill=mycol1, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 6
plot(100*(ya6[,59:nPeriods])/(ya0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col=4, font.main=1.2,cex.main=1.5,main="c) Policy rate cut",ylab = 'Index',xlab = '', ylim = range(90,125),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(yu6[,59:nPeriods])/(yu0[,59:nPeriods]),rev(100*(yl6[,59:nPeriods])/(yl0[,59:nPeriods]))),col = mycol3, border = NA)
abline(h=100,lty = 1)
legend(0,126,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c(4), box.lty=0)
legend(0,122.5,c("+/- 2 s.d."), fill=mycol3, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 7
plot(100*(ya7[,59:nPeriods])/(ya0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col="turquoise", font.main=1.2,cex.main=1.5,main="d) Lower reserve requirement",ylab = 'Index',xlab = '', ylim = range(100,100.2),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(yu7[,59:nPeriods])/(yu0[,59:nPeriods]),rev(100*(yl7[,59:nPeriods])/(yl0[,59:nPeriods]))),col = mycol4, border = NA)
abline(h=100,lty = 1)
legend(0,100.2,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c("turquoise"), box.lty=0)
legend(0,100.18,c("+/- 2 s.d."), fill=mycol4, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 8
plot(100*(ya8[,59:nPeriods])/(ya0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col=6, font.main=1.2,cex.main=1.5,main="e) Quantitative easing",ylab = 'Index',xlab = '', ylim = range(90,125),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(yu8[,59:nPeriods])/(yu0[,59:nPeriods]),rev(100*(yl8[,59:nPeriods])/(yl0[,59:nPeriods]))),col = mycol5, border = NA)
abline(h=100,lty = 1)
legend(0,126,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c(6), box.lty=0)
legend(0,122.5,c("+/- 2 s.d."), fill=mycol5, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 9
plot(100*(ya9[,59:nPeriods])/(ya0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col="slategray4", font.main=1.2,cex.main=1.5,main="f) Tax cut",ylab = 'Index',xlab = '', ylim = range(90,125),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(yu9[,59:nPeriods])/(yu0[,59:nPeriods]),rev(100*(yl9[,59:nPeriods])/(yl0[,59:nPeriods]))),col = mycol6, border = NA)
abline(h=100,lty = 1)
legend(0,126,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c("slategray4"), box.lty=0)
legend(0,122.5,c("+/- 2 s.d."), fill=mycol6, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 10
plot(100*(ya10[,59:nPeriods])/(ya0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col="purple", font.main=1.2,cex.main=1.5,main="g) Job guarantee *",ylab = 'Index',xlab = '', ylim = range(90,125),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(yu10[,59:nPeriods])/(yu0[,59:nPeriods]),rev(100*(yl10[,59:nPeriods])/(yl0[,59:nPeriods]))),col = mycol7, border = NA)
abline(h=100,lty = 1)
legend(0,126,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c("purple"), box.lty=0)
legend(0,122.5,c("+/- 2 s.d."), fill=mycol7, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 11
plot(100*(ya11[,59:nPeriods])/(ya0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col="orange", font.main=1.2,cex.main=1.5,main="h) Job guarantee **",ylab = 'Index',xlab = '', ylim = range(90,125),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(yu11[,59:nPeriods])/(yu0[,59:nPeriods]),rev(100*(yl11[,59:nPeriods])/(yl0[,59:nPeriods]))),col = mycol8, border = NA)
abline(h=100,lty = 1)
legend(0,126,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c("orange"), box.lty=0)
legend(0,122.5,c("+/- 2 s.d."), fill=mycol8, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 12
plot(100*(ya12[,59:nPeriods])/(ya0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col="pink2", font.main=1.2,cex.main=1.5,main="i) Currency devaluation",ylab = 'Index',xlab = '', ylim = range(90,125),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(yu12[,59:nPeriods])/(yu0[,59:nPeriods]),rev(100*(yl12[,59:nPeriods])/(yl0[,59:nPeriods]))),col = mycol9, border = NA)
abline(h=100,lty = 1)
legend(0,126,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c("pink2"), box.lty=0)
legend(0,122.5,c("+/- 2 s.d."), fill=mycol9, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#dev.off()


#png(file="fig4.png",width=800,height=1000)
#layout(matrix(c(1,2,3,4,5,6,7,8,9), 3, 3, byrow = TRUE))

#Plot series of price level from scenario 4
plot(100*(pa4[,59:nPeriods])/(pa0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col=2, font.main=1.2,cex.main=1.5,main="a) Government spending",ylab = 'Index',xlab = '', ylim = range(99.9,100.1),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(pu4[,59:nPeriods])/(pu0[,59:nPeriods]),rev(100*(pl4[,59:nPeriods])/(pl0[,59:nPeriods]))),col = mycol2, border = NA)
abline(h=100,lty = 1)
legend(0,100.11,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c(2), box.lty=0)
legend(0,100.09,c("+/- 2 s.d."), fill=mycol2, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 5
plot(100*(pa5[,59:nPeriods])/(pa0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col=3, font.main=1.2,cex.main=1.5,main="b) Monetisation",ylab = 'Index',xlab = '', ylim = range(99.9,100.1),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(pu5[,59:nPeriods])/(pu0[,59:nPeriods]),rev(100*(pl5[,59:nPeriods])/(pl0[,59:nPeriods]))),col = mycol1, border = NA)
abline(h=100,lty = 1)
legend(0,100.11,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c(3), box.lty=0)
legend(0,100.09,c("+/- 2 s.d."), fill=mycol1, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 6
plot(100*(pa6[,59:nPeriods]/pa6[,59])/(p6[1,59:nPeriods]/p6[1,59]), type="l", lty = 2, lwd = 1, col=4, font.main=1.2,cex.main=1.5,main="c) Policy rate cut",ylab = 'Index',xlab = '', ylim = range(99.9,100.1),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(pu6[,59:nPeriods]/pu6[,59])/(p6[1,59:nPeriods]/p6[1,59]),rev(100*(pl6[,59:nPeriods]/pl6[,59])/(p6[1,59:nPeriods]/p6[1,59]))),col = mycol3, border = NA)
abline(h=100,lty = 1)
legend(0,100.11,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c(4), box.lty=0)
legend(0,100.09,c("+/- 2 s.d."), fill=mycol3, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 7
plot(100*(pa7[,59:nPeriods])/(pa0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col="turquoise", font.main=1.2,cex.main=1.5,main="d) Lower reserve requirement",ylab = 'Index',xlab = '', ylim = range(99.999,100.001),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(pu7[,59:nPeriods])/(pu0[,59:nPeriods]),rev(100*(pl7[,59:nPeriods])/(pl0[,59:nPeriods]))),col = mycol4, border = NA)
abline(h=100,lty = 1)
legend(0,100.0011,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c("turquoise"), box.lty=0)
legend(0,100.0008,c("+/- 2 s.d."), fill=mycol4, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 8
plot(100*(pa8[,59:nPeriods])/(pa0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col=6, font.main=1.2,cex.main=1.5,main="e) Quantitative easing",ylab = 'Index',xlab = '', ylim = range(99.9,100.1),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(pu8[,59:nPeriods])/(pu0[,59:nPeriods]),rev(100*(pl8[,59:nPeriods])/(pl0[,59:nPeriods]))),col = mycol5, border = NA)
abline(h=100,lty = 1)
legend(0,100.11,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c(6), box.lty=0)
legend(0,100.09,c("+/- 2 s.d."), fill=mycol5, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 9
plot(100*(pa9[,59:nPeriods])/(pa0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col="slategray4", font.main=1.2,cex.main=1.5,main="f) Tax cut",ylab = 'Index',xlab = '', ylim = range(99.9,100.1),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(pu9[,59:nPeriods])/(pu0[,59:nPeriods]),rev(100*(pl9[,59:nPeriods])/(pl0[,59:nPeriods]))),col = mycol6, border = NA)
abline(h=100,lty = 1)
legend(0,100.11,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c("slategray4"), box.lty=0)
legend(0,100.09,c("+/- 2 s.d."), fill=mycol6, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 10
plot(100*(pa10[,59:nPeriods])/(pa0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col="purple", font.main=1.2,cex.main=1.5,main="g) Job guarantee *",ylab = 'Index',xlab = '', ylim = range(99.9,101.7),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(pu10[,59:nPeriods])/(pu0[1,59:nPeriods]),rev(100*(pl10[,59:nPeriods])/(pl0[,59:nPeriods]))),col = mycol7, border = NA)
abline(h=100,lty = 1)
legend(0,101.8,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c("purple"), box.lty=0)
legend(0,101.6,c("+/- 2 s.d."), fill=mycol7, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 11
plot(100*(pa11[,59:nPeriods])/(pa0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col="orange", font.main=1.2,cex.main=1.5,main="h) Job guarantee **",ylab = 'Index',xlab = '', ylim = range(99.9,100.1),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(pu11[,59:nPeriods])/(pu0[,59:nPeriods]),rev(100*(pl11[,59:nPeriods])/(pl0[,59:nPeriods]))),col = mycol8, border = NA)
abline(h=100,lty = 1)
legend(0,100.11,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c("orange"), box.lty=0)
legend(0,100.09,c("+/- 2 s.d."), fill=mycol8, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#Add scenario 12
plot(100*(pa12[,59:nPeriods])/(pa0[,59:nPeriods]), type="l", lty = 2, lwd = 1, col="pink2", font.main=1.2,cex.main=1.5,main="i) Currency devaluation",ylab = 'Index',xlab = '', ylim = range(99.9,100.1),cex.axis=1.5,cex.lab=1.5)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(100*(pu12[,59:nPeriods])/(pu0[,59:nPeriods]),rev(100*(pl12[,59:nPeriods])/(pl0[,59:nPeriods]))),col = mycol9, border = NA)
abline(h=100,lty = 1)
legend(0,100.11,c("Mean"),  bty = "n", cex=1.5, lty=c(2), lwd=c(1), col = c("pink2"), box.lty=0)
legend(0,100.09,c("+/- 2 s.d."), fill=mycol9, border=0, bty = "n", lty=c(0), cex=1.5, box.lty=0)

#dev.off()