#SCENARIO 5: GOVERNMENT SPENDING AND MONETIZATION (GREEN DASHED LINE)

############################################################################

#STEP 1: Clear the workspace

#Clear all
rm(list=ls(all=TRUE))

# RECALL STEPS 2 AND 3: DEFINITION OF VARIABLES AND COEFFICIENTS                    
r_code_001<-paste0("Variables.R")
source(r_code_001)
rm(r_code_001)

#CHOOSE SCENARIO
shock = 5

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

# RECALL STEP 6: CHECKS AND BASIC PLOTS      
r_code_003<-paste0("Plot.R")
source(r_code_003)
rm(r_code_003)

############################################################################

#Rename simulated series
p5=p
y5=y
ya5=ya
yu5=yu
yl5=yl
c5=c
id5=id
gov5=gov
im5=im
x5=x
m1h5=m1h
m2h5=m2h
hh5=hh
hbd5=hbd+hbd_star

#Save data
save(p5,y5,ya5,yu5,yl5,c5,id5,gov5,x5,im5,m1h5,m2h5,hh5,hbd5, file = "Data_S5.RData")