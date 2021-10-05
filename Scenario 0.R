#MODEL BASELINE

############################################################################

#STEP 1: Clear the workspace

#Clear all
rm(list=ls(all=TRUE))

# RECALL STEPS 2 AND 3: DEFINITION OF VARIABLES AND COEFFICIENTS                    
r_code_001<-paste0("Variables.R")
source(r_code_001)
rm(r_code_001)

#CHOOSE SCENARIO
shock = 0

# RECALL STEPS 4 AND 5: MODEL AND ITERATIONS                    
r_code_002<-paste0("Equations.R")
source(r_code_002)
rm(r_code_002)

#Calculate average values across scenarios
ya=matrix(data=0,nrow=1,ncol=nPeriods)    #Average GPP
ysd=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of GDP
yu=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of GDP
yl=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of GDP
for (i in 2:nPeriods){
  ya[i] = mean(y[,i])
  ysd[i] = sd(y[,i])
}
yu = ya+2*ysd  
yl = ya-2*ysd

############################################################################

#STEP 6: CHECKS AND BASIC PLOTS

#Output components under baseline
plot(y[1,2:nPeriods], type="l", lty = 1, lwd = 2, col=1, font.main=1.2,cex.main=0.75,main="a) Output components under baseline",ylab = '£',xlab = '', ylim = range(0,300),cex.axis=0.75,cex.lab=1.2)
lines(c[1,2:nPeriods], type="l", lty = 2, lwd = 2, col=2)
lines(id[1,2:nPeriods], type="l", lty = 3, lwd = 2, col=3)
lines(gov[1,2:nPeriods], type="l", lty = 4, lwd = 2, col=4)
lines(tb[1,2:nPeriods], type="l", lty = 5, lwd = 2, col=5)
legend("topleft",c("Output","Consumption","Gross investment", "Government spending","Net export"),  bty = "n", cex=0.90, lty=c(1,2,3,4,5), lwd=c(2,2,2,2,2), col = c(1,2,3,4,5), box.lty=0)

#Output composition under baseline (after 60 periods)
plot(c[1,2:nPeriods]/y[1,2:nPeriods], type="l", lty = 2, lwd = 2, col=2, font.main=1.2,cex.main=0.75,main="b) Contribution to output under baseline",ylab = '% of GDP',xlab = '', ylim = range(0,1),cex.axis=0.75,cex.lab=1.2)
lines(id[1,2:nPeriods]/y[1,2:nPeriods], type="l", lty = 3, lwd = 2, col=3)
lines(gov[1,2:nPeriods]/y[1,2:nPeriods], type="l", lty = 4, lwd = 2, col=4)
lines(x[1,2:nPeriods]/y[1,2:nPeriods], type="l", lty = 5, lwd = 2, col=5)
lines(im[1,2:nPeriods]/y[1,2:nPeriods], type="l", lty = 6, lwd = 2, col=6)
legend("topleft",c("Consumption","Gross investment", "Government spending","Export","Import"),  bty = "n", cex=0.90, lty=c(2,3,4,5,6), lwd=c(2,2,2,2,2), col = c(2,3,4,5,6), box.lty=0)

#Consistency check: baseline
plot(hh[1,2:nPeriods]-hs[1,2:nPeriods], type="b", col=1, font.main=1.2,cex.main=0.75,main="c) Consistency check: \n cash demand - cash supply",ylab = '£',xlab = '', ylim = range(-0.1,0.1),cex.axis=0.75,cex.lab=1.2)

############################################################################

#Rename simulated series
p0=p
y0=y
ya0=ya
yu0=yu
yl0=yl
c0=c
id0=id
gov0=gov
im0=im
x0=x
m1h0=m1h
m2h0=m2h
hh0=hh
hbd0=hbd+hbd_star
un0=un
omega0=Omega
omega0_adj=Omega_adj
q0=q
lev0=lev
def0=def_ratio
deb0=deb_ratio
tb0=tb_ratio
bs0=bs

#Save data
save(p0,y0,ya0,yu0,yl0,c0,id0,gov0,x0,im0,m1h0,m2h0,hh0,hbd0,un0,omega0,omega0_adj,q0,lev0,def0,deb0,tb0,bs0, file = "Data_base.RData")

#Store data for validation
save(y,c,id,gov,x,im, file = "Data_S1.RData")