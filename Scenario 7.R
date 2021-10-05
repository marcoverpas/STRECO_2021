#SCENARIO 7: NEGATIVE SHOCK TO RESERVE REQUIREMENT (TURQUOISE LINE)

############################################################################

#STEP 1: Clear the workspace

#Clear all
rm(list=ls(all=TRUE))

# RECALL STEPS 2 AND 3: DEFINITION OF VARIABLES AND COEFFICIENTS                    
r_code_001<-paste0("Variables.R")
source(r_code_001)
rm(r_code_001)

#CHOOSE SCENARIO
shock = 7

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
p7=p
y7=y
ya7=ya
yu7=yu
yl7=yl
c7=c
id7=id
gov7=gov
im7=im
x7=x
m1h7=m1h
m2h7=m2h
hh7=hh
hbd7=hbd+hbd_star

#Save data
save(p7,y7,ya7,yu7,yl7,c7,id7,gov7,x7,im7,m1h7,m2h7,hh7,hbd7, file = "Data_S7.RData")