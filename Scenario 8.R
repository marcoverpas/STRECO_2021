#SCENARIO 8: QUANTITATIVE EASING (ORCHID LINE)

############################################################################

#STEP 1: Clear the workspace

#Clear all
rm(list=ls(all=TRUE))

# RECALL STEPS 2 AND 3: DEFINITION OF VARIABLES AND COEFFICIENTS                    
r_code_001<-paste0("Variables.R")
source(r_code_001)
rm(r_code_001)

#CHOOSE SCENARIO
shock = 8

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
p8=p
y8=y
ya8=ya
yu8=yu
yl8=yl
c8=c
id8=id
gov8=gov
im8=im
x8=x
m1h8=m1h
m2h8=m2h
hh8=hh
hbd8=hbd+hbd_star

#Save data
save(p8,y8,ya8,yu8,yl8,c8,id8,gov8,x8,im8,m1h8,m2h8,hh8,hbd8, file = "Data_S8.RData")