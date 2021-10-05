#Plots used in each scenario (to check consistency and dynamics)

#Create custom color
mycol1 <- rgb(0,255,0, max = 255, alpha = 50, names = "mygreen")
mycol2 <- rgb(255,0,0, max = 255, alpha = 50, names = "myred")
mycol3 <- rgb(0, 0, 255, max = 255, alpha = 50, names = "blue50")

#Create time index across scenarios
for (i in 1:nPeriods) {TimeIndex[i] = i} 

#Consistency check: 12 MC simulations
plot(hh[1,2:nPeriods]-hs[1,2:nPeriods], type="b", col=1, font.main=1.2,cex.main=0.75,main="a) Consistency check: cash demand - cash supply \n  (12 MC simulations)",ylab = '£',xlab = '', ylim = range(-0.1,0.1),cex.axis=0.75,cex.lab=1.2)
lines(hh[2,2:nPeriods]-hs[2,2:nPeriods], type="l", col=2)
lines(hh[3,2:nPeriods]-hs[3,2:nPeriods], type="l", lty = 3, lwd = 4, col=3)
lines(hh[4,2:nPeriods]-hs[4,2:nPeriods], type="l", lty = 3, lwd = 4, col=4)
lines(hh[5,2:nPeriods]-hs[5,2:nPeriods], type="l", lty = 3, lwd = 4, col=5)
lines(hh[6,2:nPeriods]-hs[6,2:nPeriods], type="l", lty = 3, lwd = 4, col=6)
lines(hh[7,2:nPeriods]-hs[7,2:nPeriods], type="l", lty = 3, lwd = 4, col=8)
lines(hh[8,2:nPeriods]-hs[8,2:nPeriods], type="l", lty = 3, lwd = 4, col="yellow")
lines(hh[9,2:nPeriods]-hs[9,2:nPeriods], type="l", lty = 3, lwd = 4, col="purple")
lines(hh[10,2:nPeriods]-hs[10,2:nPeriods], type="l", lty = 3, lwd = 4, col="orange")
lines(hh[11,2:nPeriods]-hs[11,2:nPeriods], type="l", lty = 3, lwd = 2, col="white")
lines(hh[12,2:nPeriods]-hs[12,2:nPeriods], type="l", lty = 3, lwd = 1, col="grey")

#Output following shock
plot(ya[,59:nPeriods]/y[1,59:nPeriods], type="l", lty = 1, lwd = 2, col=2, font.main=1.2,cex.main=0.75,main="b) Output following shock",ylab = 'Relative to baseline',xlab = '', ylim = range(0.9,1.4),cex.axis=0.75,cex.lab=0.75)
lines(yu[,59:nPeriods]/y[1,59:nPeriods], type="l", lty = 2, lwd = 1, col=2)
lines(yl[,59:nPeriods]/y[1,59:nPeriods], type="l", lty = 2, lwd = 1, col=2)
polygon(x=c(TimeIndex[1:42],rev(TimeIndex[1:42])),y=c(yu[,59:nPeriods]/y[1,59:nPeriods],rev(yl[,59:nPeriods]/y[1,59:nPeriods])),col = mycol2, border = NA)
lines(y[2,59:nPeriods]/y[1,59:nPeriods], type="o", lty = 0, lwd = 0, col=3)
lines(y[3,59:nPeriods]/y[1,59:nPeriods], type="o", lty = 0, lwd = 0, col="orange")
lines(y[4,59:nPeriods]/y[1,59:nPeriods], type="o", lty = 0, lwd = 0, col="purple")
lines(y[5,59:nPeriods]/y[1,59:nPeriods], type="o", lty = 0, lwd = 0, col=4)
legend("topleft",c("Average","+/- 2 s.d."),  bty = "n", cex=0.75, lty=c(1,2), lwd=c(2,1), col = c(2,2), box.lty=0)
legend("bottomright",c("sim2","sim3","sim4","sim5"),horiz=TRUE,pch =c("O","O","O","O"), col = c(3,"orange","purple",4),bty = "n", cex=0.75, border=FALSE,box.lty=0)