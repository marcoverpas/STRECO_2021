#SCENARIO 11: JOB GUARANTEE PLAN WITH ENDOGENOUS WAGE RATE AND NO IMPACT ON UNEMPLOYMENT AND WAGES (YELLOW LINE)

############################################################################

#STEP 1: Clear the workspace

#Clear all
rm(list=ls(all=TRUE))

# RECALL STEPS 2 AND 3: DEFINITION OF VARIABLES AND COEFFICIENTS                    
r_code_001<-paste0("Variables.R")
source(r_code_001)
rm(r_code_001)

#CHOOSE SCENARIO
shock = 11

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
p11=p
y11=y
ya11=ya
yu11=yu
yl11=yl
c11=c
id11=id
gov11=gov
im11=im
x11=x
m1h11=m1h
m2h11=m2h
hh11=hh
hbd11=hbd+hbd_star

#Save data
save(p11,y11,ya11,yu11,yl11,c11,id11,gov11,x11,im11,m1h11,m2h11,hh11,hbd11, file = "Data_S11.RData")