#SCENARIO 10: JOB GUARANTEE PLAN WITH ENDOGENOUS EMPLOYEES (PURPLE DASHED LINE)

############################################################################

#STEP 1: Clear the workspace

#Clear all
rm(list=ls(all=TRUE))

# RECALL STEPS 2 AND 3: DEFINITION OF VARIABLES AND COEFFICIENTS                    
r_code_001<-paste0("Variables.R")
source(r_code_001)
rm(r_code_001)

#CHOOSE SCENARIO
shock = 10

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
omega10=Omega
p10=p
y10=y
ya10=ya
yu10=yu
yl10=yl
c10=c
id10=id
gov10=gov
im10=im
x10=x
un10=un
q10=q
lev10=lev
def10=def_ratio
deb10=deb_ratio
tb10=tb_ratio
m1h10=m1h
m2h10=m2h
hh10=hh
hbd10=hbd+hbd_star

#Save data
save(omega10,p10,y10,ya10,yu10,yl10,c10,id10,gov10,x10,im10,un10,q10,lev10,def10,deb10,tb10,m1h10,m2h10,hh10,hbd10, file = "Data_S10.RData")