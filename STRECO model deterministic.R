#STRECO MODEL - DETERMINISTIC VERSION (SIMPLIFIED)

#Made by MVP

#Modified: 14 October 2021

############################################################################

#Set directory
#setwd("C:/Users/.../...")

############################################################################

#STEP 1: Clear the workspace

#Clear all
rm(list=ls(all=TRUE))

############################################################################

#STEP 2: Define the number of periods and scenarios

#Number of periods
nPeriods = 100 

#Number of scenarios
nScenarios=12 

############################################################################

#STEP 3: 

#Variables
af=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Amortization funds
cw=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Workers' consumption 
cr=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Rentiers' and managers' consumption 
c=matrix(data=0,nrow=nScenarios,ncol=nPeriods)                #Total demand for consumption 
da=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Depreciation allowances
k=matrix(data=0,nrow=nScenarios,ncol=nPeriods)                #Stock of capital 
kt=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Target stock of capital
lf=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Demand for bank loans 
ls=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Supply of bank loans 
id=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Investment
m1w=matrix(data=0,nrow=nScenarios,ncol=nPeriods)              #Cheque deposits held by workers 
m1r=matrix(data=0,nrow=nScenarios,ncol=nPeriods)              #Cheque deposits held by rentiers and managers 
m1h=matrix(data=0,nrow=nScenarios,ncol=nPeriods)              #Total cheque deposits held by households
m1s=matrix(data=0,nrow=nScenarios,ncol=nPeriods)              #Supply of cheque deposits
m2h=matrix(data=0,nrow=nScenarios,ncol=nPeriods)              #Saving deposits held by households
m2s=matrix(data=0,nrow=nScenarios,ncol=nPeriods)              #Supply of saving deposits
nd=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Labour demand
ns=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Labour supply
nn=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Workers who do not have a job in the private sector
prf=matrix(data=1,nrow=nScenarios,ncol=nPeriods)              #Labour productivity in private sector
prg=matrix(data=0.75,nrow=nScenarios,ncol=nPeriods)           #Labour productivity in government sector
r_star=matrix(data=0.02,nrow=nScenarios,ncol=nPeriods)        #Policy rate
omega1=0.01                                                   #PC coefficient: speed of adjustment of un to nun
nun=matrix(data=0,nrow=nScenarios,ncol=nPeriods)              #Non-inflationary rate of unemployment
wb=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Wage bill
wh=matrix(data=0.86,nrow=nScenarios,ncol=nPeriods)            #Wage rate of skilled workers
betaw=0.03                                                    #Percentage of low skilled workers to total workers
rhol = 0.35                                                   #Ratio of low wage rate to high wage rate
wl=matrix(data=rhol*wh,nrow=nScenarios,ncol=nPeriods)         #Minimum wage rate
w=matrix(data=(betaw*wl+(1-betaw)*wh),nrow=nScenarios,ncol=nPeriods) #Average wage rate
y=matrix(data=40,nrow=nScenarios,ncol=nPeriods)               #Total income
ydw=matrix(data=0,nrow=nScenarios,ncol=nPeriods)              #Disposable income of workers 
ydr=matrix(data=0,nrow=nScenarios,ncol=nPeriods)              #Disposable income of rentiers and managers 
yd=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Total disposal income of households 
ff=matrix(data=0,nrow=nScenarios,ncol=nPeriods)               #Profits of firms
fuf=matrix(data=0,nrow=nScenarios,ncol=nPeriods)              #Undistributed firms profits (retained profits)
fdf=matrix(data=0,nrow=nScenarios,ncol=nPeriods)              #Distributed firms profits (dividends)

############################################################################

#STEP 4: Set values for parameters and exogenous variables 
#Parameters
alpha10=matrix(data=1.6,nrow=nScenarios,ncol=nPeriods)      #Autonomous component of propensity to consume 
alpha11=matrix(data=20,nrow=nScenarios,ncol=nPeriods)       #Sensitivity of propensity to consume to interest rate 
alpha12=matrix(data=0.05,nrow=nScenarios,ncol=nPeriods)     #Sensitivity of propensity to consume to unemployment rate 
alpha1=matrix(data=0,nrow=nScenarios,ncol=nPeriods)         #Propensity to consume out of income of workers 
alpha7=matrix(data=0.15,nrow=nScenarios,ncol=nPeriods)      #Propensity to consume out of income of rentiers and managers 
alpha2=matrix(data=0.10,nrow=nScenarios,ncol=nPeriods)      #Propensity to consume out of wealth: cash 
alpha3=matrix(data=0.05,nrow=nScenarios,ncol=nPeriods)      #Propensity to consume out of wealth: cheque deposits 
alpha4=matrix(data=0.025,nrow=nScenarios,ncol=nPeriods)     #Propensity to consume out of wealth: saving deposits 
alpha5=matrix(data=0.01,nrow=nScenarios,ncol=nPeriods)      #Propensity to consume out of wealth: bills
alpha6=matrix(data=0.01,nrow=nScenarios,ncol=nPeriods)      #Propensity to consume out of wealth: shares and other firms' securities
delta=matrix(data=0.1,nrow=nScenarios,ncol=nPeriods)        #Depreciation rate
gamma=matrix(data=0.15,nrow=nScenarios,ncol=nPeriods)       #Reaction speed of adjustment of capital to its target value
kappa=matrix(data=1,nrow=nScenarios,ncol=nPeriods)          #Capital-Output ratio
kappa0=1 #0.035                                             #Autonomous capital-output ratio
kappa1=0.1                                                  #Sensitivity of capital-output ratio to Tobin q 
kappa2=-0.1                                                 #Sensitivity of capital-output ratio to leverage ratio 

#Additional parameters and variables
theta = matrix(data=0.02,nrow=nScenarios,ncol=nPeriods)     #Profit retention rate
tau0 = matrix(data=0,nrow=nScenarios,ncol=nPeriods)         #Autonomous component of tax revenue (shock)
tau1 = matrix(data=0.2,nrow=nScenarios,ncol=nPeriods)       #Tax rate on labour income
tau2 = matrix(data=0.2,nrow=nScenarios,ncol=nPeriods)       #Tax rate on capital income
tau3 = matrix(data=1/200,nrow=nScenarios,ncol=nPeriods)     #Tax revenue rate on wealth
tau4 = matrix(data=2,nrow=nScenarios,ncol=nPeriods)         #Other transfers 
tau5 = matrix(data=5,nrow=nScenarios,ncol=nPeriods)         #Unemployment benefits (relative to unemployment rate) 
taxw = matrix(data=0,nrow=nScenarios,ncol=nPeriods)         #Taxes paid by workers 
taxr = matrix(data=0,nrow=nScenarios,ncol=nPeriods)         #Taxes paid by rentiers and managers 
tax = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Total tax revenue
gov = matrix(data=tax,nrow=nScenarios,ncol=nPeriods)        #Government spending
def = matrix(data=tax,nrow=nScenarios,ncol=nPeriods)        #Government deficit
fb = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Bank profits
sigma0 = matrix(data=5,nrow=nScenarios,ncol=nPeriods)       #Autonomous component of government spending
sigma1 = matrix(data=0.15,nrow=nScenarios,ncol=nPeriods)    #Dependent component of government spending
bs = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Bills issued by the Treasury
vw = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Workers' wealth (gross of loans) 
nvw = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Workers' net wealth 
vr = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Rentiers' and managers' wealth 
vh = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Total household wealth
bh = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Household holdings of bills
lambda10 = 0.15                                             #Parameter in portfolio equation of bills
lambda11 = 0.2                                              #Parameter in portfolio equation of bills
lambda12 = 0                                                #Parameter in portfolio equation of bills
lambda13 = -0.1                                             #Parameter in portfolio equation of bills
lambda14 = 0                                                #Parameter in portfolio equation of bills
lambda20 = 0.40                                             #Parameter in portfolio equation of cheque deposits 
lambda21 = -0.05                                            #Parameter in portfolio equation of cheque deposits
lambda22 = 0                                                #Parameter in portfolio equation of cheque deposits
lambda23 = 0.2                                              #Parameter in portfolio equation of cheque deposits
lambda24 = 0                                                #Parameter in portfolio equation of cheque deposits
lambda30 = 0.1                                              #Parameter in portfolio equation of firms' securities 
lambda31 = -(lambda11+lambda21)                             #Parameter in portfolio equation of firms' securities
lambda32 = -(lambda12+lambda22)                             #Parameter in portfolio equation of firms' securities
lambda33 = -(lambda13+lambda23)                             #Parameter in portfolio equation of firms' securities
lambda34 = -(lambda14+lambda24)                             #Parameter in portfolio equation of firms' securities
lambdacw = 0.18                                             #Cash to consumption ratio of workers +
lambdacr = 0.18                                             #Cash to consumption ratio of managers and rentiers +
lambdam = 0.50                                              #Share of cheque deposits that households hold following QE 
bcb = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #CB holdings of bills 
hs = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Supply of cash
as = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Supply of advances from CB (reserves if < 0)
ad = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Demand for advances (reserves if < 0)
hw = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Workers' holdings of cash 
hr = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Rentiers' and managers' holdings of cash 
hh = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Total holdings of cash 
mub0 = matrix(data=0.01,nrow=nScenarios,ncol=nPeriods)      #Coefficient of bills' return rate 
mub1 = matrix(data=0.0025,nrow=nScenarios,ncol=nPeriods)    #Coefficient of bills' return rate 
mub2 = matrix(data=0.015,nrow=nScenarios,ncol=nPeriods)     #Coefficient of bills' return rate (original value; 0.00368) 
mub = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Mark-up: bills' return rate 
mul = matrix(data=0.02,nrow=nScenarios,ncol=nPeriods)       #Mark-up: loans' interest rate
mul0 = matrix(data=0.02,nrow=nScenarios,ncol=nPeriods)      #Coefficient of loans' interest rate
mul1 = matrix(data=0,nrow=nScenarios,ncol=nPeriods)         #Coefficient of loans' interest rate
mum = matrix(data=0.01,nrow=nScenarios,ncol=nPeriods)       #Mark-up: saving deposits' return rate 
mua = matrix(data=0.005,nrow=nScenarios,ncol=nPeriods)      #Mark-up: CB advances' return rate 
muh = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Mark-up: reserves' return rate 
rb = matrix(data=r_star+mub,nrow=nScenarios,ncol=nPeriods)  #Return rate on bills 
rl=matrix(data=r_star+mul,nrow=nScenarios,ncol=nPeriods)    #Rate of interests on banks loans
rm=matrix(data=r_star+mum,nrow=nScenarios,ncol=nPeriods)    #Rate of interests on saving deposits
ra=matrix(data=r_star+mua,nrow=nScenarios,ncol=nPeriods)    #Rate of interests on CB advances
rh=matrix(data=r_star+muh,nrow=nScenarios,ncol=nPeriods)    #Rate of interests on reserves
fcb = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Central bank profit
hbd = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Reserve requirement: demand
hbs = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Reserve requirement: supply
rho1 = matrix(data=0.025,nrow=nScenarios,ncol=nPeriods)     #Reserves to cheque deposits parameter
rho2 = matrix(data=0.005,nrow=nScenarios,ncol=nPeriods)     #Reserves to saving deposits parameter
bb = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Bills held by commercial banks
bb_not = matrix(data=0,nrow=nScenarios,ncol=nPeriods)       #Notional amount of bills held by banks
nu = 0.2                                                    #Speed of adjustment of labour supply to labour demand
gl = 0.02                                                   #Structural rate of growth of labour force
p = matrix(data=1,nrow=nScenarios,ncol=nPeriods)            #General price level
pf = matrix(data=1,nrow=nScenarios,ncol=nPeriods)           #Unit price of private output
ep = matrix(data=1,nrow=nScenarios,ncol=nPeriods)           #Expected price level
mup = matrix(data=0.163,nrow=nScenarios,ncol=nPeriods)      #Mark-up over labour cost
un = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Unemployment rate
psi1 = 0                                                    #Coefficient of price expectations function
psi2 = 0.01                                                 #Coefficient of price expectations function
pt=matrix(data=1,nrow=nScenarios,ncol=nPeriods)             #Target or natural price level
bpr = matrix(data=1,nrow=nScenarios,ncol=nPeriods)          #Share of bills purchased by private sector
bpcb = matrix(data=0,nrow=nScenarios,ncol=nPeriods)         #Share of bills purchased by central bank 
eh = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Firms' securities held by househoulds
esr = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Number of securities issued by firms
ehr = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Number of securities held by households
re = matrix(data=r_star,nrow=nScenarios,ncol=nPeriods)      #Return rate on firms' securities
pe = matrix(data=1,nrow=nScenarios,ncol=nPeriods)           #Unit price of firms' securities
chi = 0.001                                                 #Target percentage of investment to be funded by share issues
cg = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Capital gains on firms' securities
pi = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Inflation rate
epi = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Expected inflation rate: regressive expectations
epi_a = matrix(data=0,nrow=nScenarios,ncol=nPeriods)        #Expected inflation rate: adaptive expectations
epi_r = matrix(data=0,nrow=nScenarios,ncol=nPeriods)        #Expected inflation rate: rational expectations
pit = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Target or normal inflation rate
vareps = matrix(data=0,nrow=nScenarios,ncol=nPeriods)       #Target share of bills held by CB
vareps0 = matrix(data=0,nrow=nScenarios,ncol=nPeriods)      #Autonomous component of target share of bills held by CB
vareps1 = matrix(data=0,nrow=nScenarios,ncol=nPeriods)      #Sensitivity of target share of bills to interest rate
beta = matrix(data=0.5,nrow=nScenarios,ncol=nPeriods)       #Share of notional bills held as bills by banks
hbd_star = matrix(data=0,nrow=nScenarios,ncol=nPeriods)     #Extra reserves demanded by banks
hbs_star = matrix(data=0,nrow=nScenarios,ncol=nPeriods)     #Extra reserves supplied by the CB
hbs_tot = matrix(data=0,nrow=nScenarios,ncol=nPeriods)      #Total reserves
Omega = matrix(data=0,nrow=nScenarios,ncol=nPeriods)        #Wage share to total income
Omega_adj = matrix(data=0,nrow=nScenarios,ncol=nPeriods)    #Adjusted wage share to total income 
Omega_r = matrix(data=0.5,nrow=nScenarios,ncol=nPeriods)    #Managers' share of wage and salaries 
lh = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Loans to households
mulh = matrix(data=0.02,nrow=nScenarios,ncol=nPeriods)      #Mark-up: interest rate on mortgages
rlh = matrix(data=r_star+mulh,nrow=nScenarios,ncol=nPeriods)#Interest rate on mortgages
phi = matrix(data=0.05,nrow=nScenarios,ncol=nPeriods)       #Loans to disposable income ratio with no imitation +
alpha_im = matrix(data=1.5,nrow=nScenarios,ncol=nPeriods)   #Imitative component of consumption +
rep = matrix(data=0.01,nrow=nScenarios,ncol=nPeriods)       #Repayment rate on mortgages
tr = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Total transfers 

#Minsky variables and indices
q = matrix(data=0.8,nrow=nScenarios,ncol=nPeriods)          #valuation ratio (Tobin q) 
lev = matrix(data=1,nrow=nScenarios,ncol=nPeriods)          #Leverage ratio of firms 
rhog = matrix(data=0.75,nrow=nScenarios,ncol=nPeriods)      #Government wage rate to private sector wage rate
wg = matrix(data=rhog*w,nrow=nScenarios,ncol=nPeriods)      #Wage rate paid by the government
ng = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #People hired by the government (job guarantee)
wbg = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Job guarantee wage bill
wbg_perc = matrix(data=0.015,nrow=nScenarios,ncol=nPeriods) #Job guarantee spending to GDP
type_jg = matrix(data=0,nrow=nScenarios,ncol=nPeriods)      #Job guarantee trigger (for experiments)
type_un = matrix(data=0,nrow=nScenarios,ncol=nPeriods)      #Unemployment trigger (Note: 0 = unemployment rate considers public employees; 1 = unemployment rate does not consider public employees, hence no impact of on wage curve) 
def_ratio = matrix(data=0,nrow=nScenarios,ncol=nPeriods)    #Government deficit to GDP ratio
deb_ratio = matrix(data=0,nrow=nScenarios,ncol=nPeriods)    #Government debt to GDP ratio
gammag = 0.1                                                #Speed of adjustment of JG size to market conditions
alphag = matrix(data=0.005,nrow=nScenarios,ncol=nPeriods)   #JG public goods to total consumption
tar = matrix(data=0,nrow=nScenarios,ncol=nPeriods)          #Tariffs associated with JG goods
tar_perc = matrix(data=0.25,nrow=nScenarios,ncol=nPeriods)  #Tariffs to production cost ratio

#Foreign sector variables and coefficients
im = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Import
x = matrix(data=0,nrow=nScenarios,ncol=nPeriods)            #Export
exr = matrix(data=1,nrow=nScenarios,ncol=nPeriods)          #Exchange rate (quantity of domestic currency per one unit of foreign currency)
fr = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Foreign reserves
m0 = -2.1                                                   #Coefficient of import function
m1 = -0.5                                                   # Coefficient of import function 
m2 = 0.5                                                    #Coefficient of import function
m3 = 0                                                      #Coefficient of import function
x0 = -2.1                                                   #Coefficient of export function
x1 = 0.5                                                    #Coefficient of export function
x2 = 0.5                                                    #Coefficient of export function
x3 = 0                                                      #Coefficient of export function
tb = matrix(data=0,nrow=nScenarios,ncol=nPeriods)           #Trade balance
tb_ratio = matrix(data=0,nrow=nScenarios,ncol=nPeriods)     #Trade balance to GDP
yF = matrix(data=40,nrow=nScenarios,ncol=nPeriods)          #Foreign income
gF = matrix(data=0.053,nrow=nScenarios,ncol=nPeriods)       #Foreign income growth rate
gS = 0.03                                                   #De-growth rate of income growth rate

#New coefficients and variables after revisions
wh0 = 0.86                                                  #Initial value of skilled workers wage rate 
wh1 = 0.5                                                   #Inertia coefficient of skilled workers wages


############################################################################

# STEP 5: MODEL AND ITERATIONS

#Select scenarios
for (j in 1:nScenarios){
  
  #Define the time loop
  for (i in 2:nPeriods){
    
    #Define iterations
    for (iterations in 1:100){

            #Define alternative scenarios
      
            #Job guarantee plan with endogenous wage rate
            if (i>=60 && j==2){
            type_jg[2,i]=1
            }    
      
            #Positive shock to government spending to be compared with JG plan
            if (i>=60 && j==3){
            sigma0[3,i]=5+0.015*y[3,59]            #[Note: JG experiment uses: 0.015*y[j,59]]
            }  
      
            #Positive shock to government spending (profligacy)
            if (i>=60 && j==4){
            sigma0[4,i]=8 
            }
      
            #Positive shock to government spending and higher monetisation (QE)
            if (i>=60 && j==5){
              sigma0[5,i]=8
              vareps0[5,i]=0.5 
            }
      
            #Negative shock to policy rate
            if (i>=60 && j==6){
            r_star[6,i]=0.015
            }
      
            #Negative shock to reserve requirement
            if (i>=60 && j==7){
            rho1[7,i]=0
            rho2[7,i]=0
            }
      
            #Quantitative easing turned on
            if (i>=60 && j==8){
            vareps0[8,i]=0.5
            }
      
            #Negative shock to taxes
            if (i>=60 && j==9){
            tau0[9,i]=-3 
            }
      
            #Job guarantee plan with endogenous employees
            if (i>=60 && j==10){
            type_jg[10,i]=2
            }
      
            #Job guarantee plan (with endogenous wage rate) and no impact on un (and w)
            if (i>=60 && j==11){
            type_jg[11,i]=1
            type_un[11,i]=1
            }
            
            #Devaluation
            if (i>=60 && j==12){
            exr[12,i]=1.5
            }
      
      
      #MODEL EQUATIONS      
      
      #Non-financial firms
      y[j,i] = c[j,i] + id[j,i] + gov[j,i] + tb[j,i]                      #National income identity (GDP)
      kt[j,i] = kappa[j,i]*y[j,i-1]/ep[j,i]                               #Target capital stock 
      da[j,i] = delta[j,i]*k[j,i-1]*p[j,i]                                #Depreciation allowances
      af[j,i] = da[j,i]                                                   #Amortization funds
      id[j,i] = gamma[j,i]*(kt[j,i] - k[j,i-1])*p[j,i] + da[j,i]          #Demand for investment: conventional
      kappa[j,i] = kappa0 + kappa1*q[j,i-1] + kappa2*lev[j,i-1]           #Capital-output ratio
      k[j,i] = k[j,i-1] + (id[j,i] - da[j,i])/p[j,i]                      #Accumulation of capital - Investment behaviour
      ff[j,i] = y[j,i] - rl[j,i-1]*lf[j,i-1] - af[j,i] - wb[j,i]          #Firms profits (residual) 
      fdf[j,i] = (1-theta[j,i])*ff[j,i-1]                                 #Distributed profits
      fuf[j,i] = ff[j,i] - fdf[j,i]                                       #Retained profits 
      lf[j,i] = lf[j,i-1] + id[j,i] - af[j,i] - fuf[j,i] - (esr[j,i]-esr[j,i-1])*pe[j,i]  #Demand for bank loans
      if (i<5) {esr[j,i] = 10}
      else {esr[j,i] = esr[j,i-1] + chi*id[j,i]/pe[j,i]}                  #Number of securities (equity, shares and bonds) issued by the firms
      
      #Households
      ydw[j,i] = wb[j,i]*(1-Omega_r[j,i]) - rlh[j,i-1]*lh[j,i-1] + tr[j,i] - taxw[j,i] + wbg[j,i] - tar[j,i] #Disposable income of workers 
      ydr[j,i] = wb[j,i]*Omega_r[j,i] + rm[j,i-1]*m2h[j,i-1] + rb[j,i-1]*bh[j,i-1] + fdf[j,i] + fb[j,i] - taxr[j,i] #Disposable income of rentiers and managers 
      yd[j,i] = ydw[j,i] + ydr[j,i]                                                         #Total disposable income 
      if (cr[j,i-1]>0 && cw[j,i-1]>0){cw[j,i] = (alpha1[j,i]*ydw[j,i-1]+alpha2[j,i]*hw[j,i-1]+alpha3[j,i]*m1w[j,i-1])*p[j,i]/ep[j,i]+alpha_im[j,i]*(cr[j,i-1]/cw[j,i-1])*p[j,i] }        
      else{cw[j,i] = (alpha1[j,i]*ydw[j,i-1]+alpha2[j,i]*hw[j,i-1]+alpha3[j,i]*m1w[j,i-1])*p[j,i]/ep[j,i]}  #Workers' consumption +     
      cr[j,i] = (alpha7[j,i]*ydr[j,i-1]+alpha2[j,i]*hr[j,i-1]+alpha3[j,i]*m1r[j,i-1]+alpha4[j,i]*m2h[j,i-1]+alpha5[j,i]*bh[j,i-1]+alpha6[j,i]*eh[j,i-1])*p[j,i]/ep[j,i] #Rentiers' and managers' consumption 
      c[j,i] = cw[j,i] + cr[j,i]                                                            #Total consumption 
      alpha1[j,i] = alpha10[j,i] - alpha11[j,i]*rlh[j,i-1] - alpha12[j,i]*un[j,i-1]         #Endogenous propensity to consume of workers 
      nvw[j,i] = nvw[j,i-1] + ydw[j,i] - cw[j,i]                                            #Workers' wealth net of loans 
      vw[j,i] = nvw[j,i] + lh[j,i]                                                          #Workers' (gross) wealth
      vr[j,i] = vr[j,i-1] + ydr[j,i] + cg[j,i] - cr[j,i]                                    #Rentiers' and managers' wealth 
      vh[j,i] = vw[j,i] + vr[j,i]                                                           #Total household wealth 
      cg[j,i] = esr[j,i-1]*(pe[j,i] - pe[j,i-1])                                            #Capital gains
      Omega[j,i]=(wb[j,i] + wbg[j,i])/yd[j,i]                                               #Wage and salary share to total disposable income 
      Omega_adj[j,i]=(wb[j,i]*(1-Omega_r[j,i]) + wbg[j,i])/yd[j,i]                          #Adjusted wage share to total disposable income 
      lh[j,i]=lh[j,i-1]*(1-rep[j,i-1]) + max(phi[j,i]*cw[j,i],cw[j,i]-ydw[j,i])             #Loans to working-class households 
      
      #Commercial banks
      ls[j,i] = lf[j,i] + lh[j,i]                                         #Supply of bank credit (loans and mortgages)
      m1s[j,i] = m1h[j,i]                                                 #Supply of cheque deposits 
      m2s[j,i] = m2h[j,i]                                                 #Supply of saving deposits 
      fb[j,i] = rl[j,i-1]*lf[j,i-1] + rlh[j,i-1]*lh[j,i-1] + rb[j,i-1]*bb[j,i-1] - rm[j,i-1]*m2s[j,i-1] - ra[j,i-1]*ad[j,i-1] + rh[j,i-1]*(hbd[j,i-1]+hbd_star[j,i-1])   #Bank profits
      bb_not[j,i] = m1s[j,i] + m2s[j,i] - ls[j,i] - hbd[j,i]              #Notional amount of bills held by banks
      if (bb_not[j,i]>0){bb[j,i] = bb_not[j,i]*beta[j,i]} else {bb[j,i] = 0} #Bills actually held by commercial banks
      if (bb_not[j,i]>0){hbd_star[j,i] = bb_not[j,i]*(1-beta[j,i])} else {hbd_star[j,i] = 0} #Extra reserves held by commercial banks
      if (bb_not[j,i]>0){ad[j,i] = 0} else {ad[j,i] = -bb_not[j,i]}       #Demand for advances
      
      #Government
      taxw[j,i] = tau1[j,i]*wb[j,i]*(1-Omega_r[j,i]) + tau3[j,i]*m1w[j,i-1] #Taxes paid by workers  
      taxr[j,i] = tau0[j,i] + tau1[j,i]*wb[j,i]*Omega_r[j,i] + tau2[j,i]*(rm[j,i-1]*m2h[j,i-1]+rb[j,i-1]*bh[j,i-1]+fdf[j,i]+fb[j,i]) + tau3[j,i]*(vr[j,i-1]-hr[j,i-1]) #Taxes paid by rentiers and managers 
      tax[j,i] = taxw[j,i] + taxr[j,i]                                     #Total tax revenue 
      tr[j,i] = tau4[j,i]+tau5[j,i]*un[j,i-1]                              #Transfers (including unemployment benefits)
      gov[j,i] = sigma0[j,i] + sigma1[j,i]*y[j,i-1]                        #Government spending: purchase of goods and services
      
          #A) Job guarantee with endogenous wg/w and exogenous employees (Scenario 2)
          if (type_jg[j,i]==1){
          if (ng[j,i]==0){wg[j,i]=0}
          else {wg[j,i] = wbg[j,i]/ng[j,i]}                               #Wage rate paid under the JG programme
          nn[j,i] = ns[j,i] - nd[j,i]                                     #Workers who do not have a job in the private sector
          ng[j,i] = ng[j,i-1]+gammag*(nn[j,i]-ng[j,i-1])                  #Workers hired under JG programme
          wbg[j,i] = wbg_perc[j,i]*y[j,59]                                #Total spending for the JG programme
          tar[j,i] = tar_perc[j,i]*wbg[j,i]                               #Tariffs
          }
          else {
          wg[j,i] = 0
          ng[j,i] = 0
          nn[j,i] = ns[j,i] - nd[j,i]
          wbg[j,i] = 0      
          }    
        
          #B) Job guarantee with endogenous employees and exogenous wg/w (Scenario 10)
          if (type_jg[j,i]==2){
          wg[j,i] = rhog[j,i]*w[j,i]  
          wbg[j,i] = wbg_perc[j,i]*y[j,59]                                #Total spending for the JG programme  
          ng[j,i] = wbg[j,i]/wg[j,i]                                       #Workers hired under JG programme
          nn[j,i] = ns[j,i] - nd[j,i]                                     #Workers who do not have a job in the private sector  
          tar[j,i] = tar_perc[j,i]*wbg[j,i]                               #Tariffs
          }
      
      def[j,i] = gov[j,i] + tr[j,i] + rb[j,i-1]*bs[j,i-1] - tax[j,i] - fcb[j,i] + wbg[j,i] - tar[j,i] #Government deficit
      bs[j,i] = bs[j,i-1] + def[j,i]                                      #Supply of bills
      
      #Portfolio decisions
      ehr[j,i] = esr[j,i]                                                 #Number of securities held by households
      eh[j,i] = ehr[j,i]*pe[j,i]                                          #Nominal amount of securities demanded by households
      bh[j,i] = lambda10*vr[j,i-1] + lambda11*vr[j,i-1]*rb[j,i-1] + lambda12*vr[j,i-1]*rm[j,i-1] + lambda13*ydr[j,i-1] + lambda14*vr[j,i-1]*re[j,i-1]#Demand for bills 
      m1r[j,i] = lambda20*vr[j,i-1] + lambda21*vr[j,i-1]*rb[j,i-1] + lambda22*vr[j,i-1]*rm[j,i-1] + lambda23*ydr[j,i-1] + lambda24*vr[j,i-1]*re[j,i-1]#Demand for cheque deposits 
      pe[j,i] = (lambda30*vr[j,i-1] + lambda31*vr[j,i-1]*rb[j,i-1] + lambda32*vr[j,i-1]*rm[j,i-1] + lambda33*ydr[j,i-1] + lambda34*vr[j,i-1]*re[j,i-1])/ehr[j,i]#Demand for firms' securities (equity, shares and bonds) 
      hw[j,i] = lambdacw*cw[j,i]*ep[j,i]/p[j,i]                           #Banknotes held by workers 
      hr[j,i] = lambdacr*cr[j,i]*ep[j,i]/p[j,i]                           #Banknotes held by rentiers and managers 
      hh[j,i] = hw[j,i] + hr[j,i]                                         #Demanded stock of banknotes (cash)
      m1w[j,i] = vw[j,i] - hw[j,i]                                        #Cheque deposits held by workers 
      m1h[j,i] = m1w[j,i] + m1r[j,i]                                      #Total demand for cheque deposits 
      m2h[j,i] = vr[j,i] - hr[j,i] - m1r[j,i] - bh[j,i] - eh[j,i]         #Demand for saving deposits 
      
      #Central bank
      bcb[j,i] = bs[j,i] - bh[j,i] - bb[j,i]                              #CB holdings of bills
      hs[j,i] = bcb[j,i] + as[j,i] - (hbs[j,i] + hbs_star[j,i]) + fr[j,i] #Supply of cash
      as[j,i] = ad[j,i]                                                   #Supply of advances
      fcb[j,i] = rb[j,i-1]*bcb[j,i-1] + ra[j,i-1]*as[j,i-1] - rh[j,i-1]*(hbs[j,i-1]+hbs_star[j,i-1]) #Central bank profit (seigniorage)
      hbd[j,i] = rho1[j,i]*m1s[j,i-1] + rho2[j,i]*m2s[j,i-1]              #Reserve requirement: demand
      hbs[j,i] = hbd[j,i]                                                 #Reserve requirement: supply
      hbs_star[j,i] = hbd_star[j,i]                                       #Extra reserves: supply
      
      #Foreign sector
      im[j,i] = exp(m0 + m1*log(exr[j,i-1]) + m2*log(y[j,i-1]) + m3*log(p[j,i-1])) #Import
      x[j,i] =  exp(x0 + x1*log(exr[j,i-1]) + x2*log(yF[j,i-1]) + x3*log(p[j,i-1])) #Export
      yF[j,i] = yF[j,i-1]*(1+gF[j,i])                                     #Foreign income
      gF[j,i] = gF[j,i-1]*(1-gS)                                          #Foreign income growth rate
      tb[j,i] = x[j,i] - im[j,i]                                          #Trade balance
      fr[j,i] = fr[j,i-1] + tb[j,i]                                       #Foreign reserves
      
      #Quantitative easing
      if (i<5) {bcb[j,i] = bcb[j,i]}
      else {if (bcb[j,i]<bs[j,i-1]*vareps[j,i]) {bcb[j,i] = bs[j,i-1]*vareps[j,i]}} #Bills held by CB under QE

      if (i<5) {m1r[j,i] = m1r[j,i]
      m2h[j,i] = m2h[j,i]}
      else {if (bh[j,i]>bs[j,i]-bb[j,i]-bcb[j,i]) {m1r[j,i] = m1r[j,i] + lambdam*(bh[j,i] - (bs[j,i]-bb[j,i]-bcb[j,i])) #Cheque deposits held by upper-class households under QE 
      m1h[j,i] = m1r[j,i] + m1w[j,i]                                             #Total cheque deposits held by households 
      m2h[j,i] = m2h[j,i] + (1-lambdam)*(bh[j,i] - (bs[j,i]-bb[j,i]-bcb[j,i]))}} #Total saving deposits held by households   
      
      if (i<5) {hs[j,i] = hs[j,i]}
      else {if (bh[j,i]>bs[j,i]-bb[j,i]-bcb[j,i]) {hs[j,i] = hh[j,i]}}    #Supply of cash under QE
      
      if (i<5) {bh[j,i] = bh[j,i]}
      else {if (bh[j,i]>bs[j,i]-bb[j,i]-bcb[j,i]) {bh[j,i] = bs[j,i]-bb[j,i]-bcb[j,i]}} #Bills held by households under QE
      vareps[j,i] = vareps0[j,i] + vareps1[j,i]*r_star[j,i]               #Target share of bills held by CB

      #Interest rates
      if (i<5) {re[j,i] = r_star[j,i]}
      else {re[j,i] = (fdf[j,i]+ cg[j,i])/eh[j,i-1]}                      #Return rate on firms' securities (including cg) 
      rb[j,i] = r_star[j,i] + mub[j,i]                                    #Return rate on bills
      rl[j,i] = r_star[j,i] + mul[j,i]                                    #Interest rate on loans
      rlh[j,i] = r_star[j,i] + mulh[j,i]                                  #Interest rate on mortgages
      rm[j,i] = r_star[j,i] + mum[j,i]                                    #Return rate on saving deposits
      ra[j,i] = r_star[j,i] + mua[j,i]                                    #Interest rate on CB advances
      rh[j,i] = r_star[j,i] + muh[j,i]                                    #Return rate on reserves
      mul[j,i] = mul0[j,i] + mul1[j,i]*lev[j,i-1]                         #Mark-up of interest rate on loans: endogenous (Minsky)
      
      if ((j==5 || j==8) && i>=60) {mub[j,i] = mub0[j,i] - mub2[j,i]*(bpcb[j,i-1])}  
      else{mub[j,i] = mub0[j,i] - mub1[j,i]*(bpr[j,i-1])}                 #Mark-up of bills yield 
      bpr[j,i] = (bh[j,i] + bb[j,i])/bs[j,i]                              #Share of bills demanded by private sector
      bpcb[j,i] = bcb[j,i]/bs[j,i]                                        #Share of bills demanded by CB under QE program 
    
      #Labour market
      wb[j,i] = w[j,i]*nd[j,i]                                            #Wage bill  
      nd[j,i] = (y[j,i]-wbg[j,i])/(prf[j,i]*p[j,i])                       #Employment (labour demand)
      if (i<3) {ns[j,i] = 45} 
      else{ ns[j,i] = ns[j,i-1]*(1+gl) + nu*(nd[j,i-1]-ns[j,i-1])}
      if (ns[j,i]<nd[j,i]) {ns[j,i]=nd[j,i]}                              #Labour force (labour supply)
      if (type_un[j,i]==0) {un[j,i] = 1-((nd[j,i]+ng[j,i])/ns[j,i])}      #Unemployment rate considering public employees
      else{un[j,i] = 1-(nd[j,i]/ns[j,i])}                                 #Unemployment rate without public employees
      if (i<3) {wh[j,i] = wh0}
      else{wh[j,i] = wh1*wh0 + (1-wh1)*((1 - omega1*(un[j,i-1] - nun[j,i]))*ep[j,i]*wh[j,i-1]/p[j,i-1]) #Nominal wage rate of skilled workers (linear)
      }
      w[j,i] = betaw*wl[j,i] + (1-betaw)*wh[j,i]                          #Average wage rate across workers
      if (type_jg[j,i]==2){                                               #|| type_jg[j,i]==1){
      wl[j,i] = wg[j,i]}  else {wl[j,i]=rhol*w[j,i]}                      #Minimum wage rate
      
      #Prices and expectations
      pf[j,i] = (w[j,i]/prf[j,i])*(1+mup[j,i])                            #Unit price of private output
      if (type_jg[j,i]==0 && j!=11) {p[j,i] = pf[j,i]}                    #General price level
      else {p[j,i] = p[j,i-1]+(pf[j,i]-pf[j,i-1])*(1-(wbg[j,i-1]/y[j,i-1])) + (tar[j,i]-tar[j,i-1])*(wbg[j,i-1]/y[j,i-1])}    #General price level
      pi[j,i] = (p[j,i]/p[j,i-1])-1                                       #Inflation rate
      if (i<3) {epi_a[j,i] = pi[j,i]}
      else {epi_a[j,i] = epi_a[j,i-1] + psi1 + psi2*(pi[j,i-1]-epi_a[j,i-1])} #Expected inflation rate: adaptive expectations
      set.seed(i)
      if (i<3) {epi_r[j,i] = pi[j,i]}
      else {epi_r[j,i] = pi[j,i] + runif(1,min=-0.01,max=0.01)}           #Expected inflation rate: rational expectations
      if (i<3) {epi[j,i] = pi[j,i]}
      else {epi[j,i] = pi[j,i-1] + psi1 + psi2*(pit[j,i-1]-pi[j,i-1])}    #Expected inflation rate: regressive expectations
      ep[j,i] = p[j,i-1]*(1+epi[j,i])                                     #Expected price level

      #Minsky variables and indices
      q[j,i] = (esr[j,i]*pe[j,i] + lf[j,i])/(p[j,i]*k[j,i])               #Valuation ratio (Tobin q)
      lev[j,i] = lf[j,i]/(esr[j,i]*pe[j,i] + lf[j,i])                     #Leverage ratio of firms
      def_ratio[j,i] = def[j,i]/y[j,i]                                    #Government deficit to GDP ratio
      deb_ratio[j,i] = bs[j,i]/y[j,i]                                     #Government debt to GDP ratio
      tb_ratio[j,i] = tb[j,i]/y[j,i]                                      #Trade balance to GDP ratio
      
      #Redundant equation
      #hh[j,i] = hs[j,i]
      
      
    }
  }
}

############################################################################

# STEP 6: CHECKS AND BASIC PLOTS

#Create custom color
mycol1 <- rgb(0,255,0, max = 255, alpha = 50, names = "mygreen")
mycol2 <- rgb(255,0,0, max = 255, alpha = 50, names = "myred")
mycol3 <- rgb(0, 0, 255, max = 255, alpha = 50, names = "blue50")

#Consistency check: all scenarios
plot(hh[1,2:nPeriods]-hs[1,2:nPeriods], type="b", col=1, font.main=1.2,cex.main=0.75,main="a) Consistency check: \n cash demand - cash supply (10 scenarios)",ylab = '£',xlab = '', ylim = range(-0.1,0.1),cex.axis=0.75,cex.lab=1.2)
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

#Output components under baseline
plot(y[1,2:nPeriods],type="l", col=1, lty=1, lwd=2, font.main=1.2,cex.main=1.2,main="b) Output components under baseline",ylab = '£',xlab = '',ylim = range(0,230),cex.axis=1,cex.lab=1.2)
lines(c[1,2:nPeriods],type="l", col=2,lty=2, lwd=2)
lines(id[1,2:nPeriods],type="l", col=3,lty=3, lwd=2)
lines(gov[1,2:nPeriods],type="l", col=4,lty=4, lwd=2)
lines(tb[1,2:nPeriods], type="l", lty = 5, lwd = 2, col=5)
legend("topleft",c("Net export","Government spending","Gross investment","Consumption","Output"),  bty = "n", cex=1.2, lty=c(5,4,3,2,1), lwd=c(2,2,2,2,2), col = c(5,4,3,2,1), box.lty=0)

#Interest rates under baseline
library('pracma')
plot(r_star[1,20:40],type="l", col=8, lwd=2, lty=1, font.main=1.2,cex.main=1.2, main="c) Interest rates under baseline (periods: 20-40)",ylab = 'x 100',xlab = '',ylim = range(0,0.30),cex.axis=1,cex.lab=1.2)
lines(rb[1,25:nPeriods],type="l", col=2,lty=1,lwd=2)
lines(re[1,25:nPeriods],type="l", col="purple",lty=2,lwd=2)
lines(rlh[1,25:nPeriods],type="l", col=7,lty=1,lwd=2)
lines(rl[1,25:nPeriods],type="l", col=3,lty=2,lwd=2)
lines(rm[1,25:nPeriods],type="l", col=4,lty=2,lwd=2)
lines(ra[1,25:nPeriods],type="l", col=5,lty=1,lwd=2)
lines(rh[1,25:nPeriods],type="l", col="orange",lty=1,lwd=2)
legend("topleft",c("Policy rate","Bills","Shares","Mortgages","Loans","Saving deposits","Advances","Reserves"),  bty = 'n', cex=1.2, lty=c(1,1,1,1,2,2,1,1), lwd=c(2,2,2,2,2,2,2,2), col = c(8,2,"purple",7,3,4,5,"orange"), box.lty=0)

#Portfolio composition under baseline
library(plotrix)
slices = c(hr[1,60:60],hw[1,60:60],m1r[1,60:60],m1w[1,60:60],m2h[1,60:60],bh[1,60:60],eh[1,60:60])
slicecol = rainbow(8,s=0.5)
lbls <- c("Rentiers' cash","Workers' cash","Rentiers' cheque \n deposits","Workers' cheque \n deposits","Saving deposits","Bills","Corp. securities")
pct<-round(slices/sum(slices)*100)
lbls<-paste(lbls,pct)
lbls<-paste(lbls,"%",sep="")
pie3D(slices,labels=lbls,col=slicecol,explode=0.1,shade=0.5,mar=c(4,4,4,4),font.main=1.2,labelcex=1,cex.main=1.2,main="d) Portfolio composition under baseline")

#Output
plot(y[7,58:nPeriods]/y[1,58:nPeriods],type="l", col=5, lty=1, lwd=2, font.main=1.2,cex.main=1.2,main="e) Output under alternative scenarios",ylab = 'Ratio to baseline',xlab = '',ylim = range(0.85,1.35),cex.axis=1,cex.lab=1.2)
rect(xleft=-5,xright=3,ybottom=0,ytop=500,col=mycol1,border=NA)
lines(y[4,58:nPeriods]/y[1,58:nPeriods],type="l", col=2,lty=1, lwd=2)
lines(y[5,58:nPeriods]/y[1,58:nPeriods],type="l", col=3,lty=2, lwd=2)
lines(y[6,58:nPeriods]/y[1,58:nPeriods],type="l", col=4,lty=1, lwd=2)
lines(y[8,58:nPeriods]/y[1,58:nPeriods],type="l", col=6,lty=1, lwd=2)
lines(y[2,58:nPeriods]/y[1,58:nPeriods],type="l", col="orange",lty=1, lwd=2)
lines(y[9,58:nPeriods]/y[1,58:nPeriods],type="l", col="grey",lty=1, lwd=2)
lines(y[10,58:nPeriods]/y[1,58:nPeriods],type="l", col="purple",lty=2, lwd=2)
lines(y[12,58:nPeriods]/y[1,58:nPeriods],type="l", col="pink",lty=1, lwd=2)
#abline(h=1)
legend("topleft",c("Higher reserve requirement","Government spending ","Monetisation", "Policy rate cut", "Quantitative easing", "Job guarantee*", "Tax cut", "Job guarantee**", "Currency devaluation"),  bty = 'n', cex=0.9, lty=c(1,1,2,1,1,1,1,2,1), lwd=c(2,2,2,2,2,2,2,2,2), col = c(5,2,3,4,6,"orange","grey","purple","pink"), box.lty=0)

#Price of private goods
plot(pf[7,58:nPeriods]/pf[1,58:nPeriods],type="l", col=5, lty=1, lwd=2, font.main=1.2,cex.main=1.2,main="f) Price of private goods under alternative scenarios",ylab = 'Ratio to baseline',xlab = '',ylim = range(0.995,1.020),cex.axis=1,cex.lab=1.2)
rect(xleft=-5,xright=3,ybottom=0,ytop=500,col=mycol1,border=NA)
lines(pf[4,58:nPeriods]/pf[1,58:nPeriods],type="l", col=2,lty=1, lwd=2)
lines(pf[5,58:nPeriods]/pf[1,58:nPeriods],type="l", col=3,lty=2, lwd=2)
lines(pf[6,58:nPeriods]/pf[1,58:nPeriods],type="l", col=4,lty=1, lwd=2)
lines(pf[8,58:nPeriods]/pf[1,58:nPeriods],type="l", col=6,lty=1, lwd=2)
lines(pf[2,58:nPeriods]/pf[1,58:nPeriods],type="l", col="orange",lty=1, lwd=2)
lines(pf[9,58:nPeriods]/pf[1,58:nPeriods],type="l", col="grey",lty=1, lwd=2)
lines(pf[10,58:nPeriods]/pf[1,58:nPeriods],type="l", col="purple",lty=2, lwd=2)
lines(pf[12,58:nPeriods]/pf[1,58:nPeriods],type="l", col="pink",lty=1, lwd=2)
legend("topleft",c("Higher reserve requirement","Government spending ","Monetisation", "Policy rate cut", "Quantitative easing", "Job guarantee*", "Tax cut", "Job guarantee**", "Currency devaluation"),  bty = 'n', cex=0.9, lty=c(1,1,2,1,1,1,1,2,1), lwd=c(2,2,2,2,2,2,2,2,2), col = c(5,2,3,4,6,"orange","grey","purple","pink"), box.lty=0)

#Unemployment rate 
plot(un[7,58:nPeriods]-un[1,58:nPeriods],type="l", col=5, lty=1, lwd=2, font.main=1.2,cex.main=1.2,main="g) Unemployment under alternative scenarios",ylab = '% difference with baseline',xlab = '',ylim = range(-0.10,0.05),cex.axis=1,cex.lab=1.2)
rect(xleft=-5,xright=3,ybottom=-10,ytop=500,col=mycol1,border=NA)
lines(un[4,58:nPeriods]-un[7,58:nPeriods],type="l", col=2,lty=1, lwd=2)
lines(un[5,58:nPeriods]-un[7,58:nPeriods],type="l", col=3,lty=2, lwd=2)
lines(un[6,58:nPeriods]-un[7,58:nPeriods],type="l", col=4,lty=1, lwd=2)
lines(un[8,58:nPeriods]-un[7,58:nPeriods],type="l", col=6,lty=1, lwd=2)
lines(un[2,58:nPeriods]-un[1,58:nPeriods],type="l", col="orange",lty=1, lwd=2)
lines(un[9,58:nPeriods]-un[1,58:nPeriods],type="l", col="grey",lty=1, lwd=2)
lines(un[10,58:nPeriods]-un[1,58:nPeriods],type="l", col="purple",lty=2, lwd=2)
lines(un[12,58:nPeriods]-un[1,58:nPeriods],type="l", col="pink",lty=1, lwd=2)
legend("topleft",c("Higher reserve requirement","Government spending ","Monetisation", "Policy rate cut", "Quantitative easing", "Job guarantee*", "Tax cut", "Job guarantee**", "Currency devaluation"),  bty = 'n', cex=0.9, lty=c(1,1,2,1,1,1,1,2,1), lwd=c(2,2,2,2,2,2,2,2,2), col = c(5,2,3,4,6,"orange","grey","purple","pink"), box.lty=0)

#Income distribution
plot(Omega_adj[7,58:nPeriods]-Omega_adj[1,58:nPeriods],type="l", col=5, lty=1, lwd=2, font.main=1.2,cex.main=1.2,main="h) Adjusted wage share under alternative scenarios",ylab = '% difference with baseline',xlab = '',ylim = range(-0.05,0.05),cex.axis=1,cex.lab=1.2)
rect(xleft=-5,xright=3,ybottom=-10,ytop=500,col=mycol1,border=NA)
lines(Omega_adj[4,58:nPeriods]-Omega_adj[1,58:nPeriods],type="l", col=2,lty=1, lwd=2)
lines(Omega_adj[5,58:nPeriods]-Omega_adj[1,58:nPeriods],type="l", col=3,lty=2, lwd=2)
lines(Omega_adj[6,58:nPeriods]-Omega_adj[1,58:nPeriods],type="l", col=4,lty=1, lwd=2)
lines(Omega_adj[8,58:nPeriods]-Omega_adj[1,58:nPeriods],type="l", col=6,lty=1, lwd=2)
lines(Omega_adj[2,58:nPeriods]-Omega_adj[1,58:nPeriods],type="l", col="orange",lty=1, lwd=2)
lines(Omega_adj[9,58:nPeriods]-Omega_adj[1,58:nPeriods],type="l", col="grey",lty=1, lwd=2)
lines(Omega_adj[10,58:nPeriods]-Omega_adj[1,58:nPeriods],type="l", col="purple",lty=2, lwd=2)
lines(Omega_adj[12,58:nPeriods]-Omega_adj[1,58:nPeriods],type="l", col="pink",lty=1, lwd=2)
legend("topleft",c("Higher reserve requirement","Government spending ","Monetisation", "Policy rate cut", "Quantitative easing", "Job guarantee*", "Tax cut", "Job guarantee**", "Currency devaluation"),  bty = 'n', cex=0.9, lty=c(1,1,2,1,1,1,1,2,1), lwd=c(2,2,2,2,2,2,2,2,2), col = c(5,2,3,4,6,"orange","grey","purple","pink"), box.lty=0)