#SCENARIO 9: TAX CUT (GREY LINE)

############################################################################

#STEP 1: Clear the workspace

#Clear all
rm(list=ls(all=TRUE))

# RECALL STEPS 2 AND 3: DEFINITION OF VARIABLES AND COEFFICIENTS                    
r_code_001<-paste0("Variables.R")
source(r_code_001)
rm(r_code_001)

#CHOOSE SCENARIO
shock = 9

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
p9=p
y9=y
ya9=ya
yu9=yu
yl9=yl
c9=c
id9=id
gov9=gov
im9=im
x9=x
m1h9=m1h
m2h9=m2h
hh9=hh
hbd9=hbd+hbd_star

#Save data
save(p9,y9,ya9,yu9,yl9,c9,id9,gov9,x9,im9,m1h9,m2h9,hh9,hbd9, file = "Data_S9.RData")