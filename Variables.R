#DEFINE VARIABLES

############################################################################

#STEP 2: Define the number of periods and scenarios

#Number of periods
nPeriods = 100

#Number of simulations (Monte Carlo simulations starting from simulation 3)
mc=20 


############################################################################

#STEP 3: Set values for parameters and exogenous variables 
betaw=0.03                                                    #Percentage of low skilled workers to total workers
rhol = 0.35                                                   #Ratio of low wage rate to high wage rate
kappa0=matrix(data=1,nrow=mc,ncol=nPeriods)                   #Autonomous capital-output ratio
kappa1=matrix(data=0.1,nrow=mc,ncol=nPeriods)                 #Sensitivity of capital-output ratio to Tobin q 
kappa2=matrix(data=-0.1,nrow=mc,ncol=nPeriods)                #Sensitivity of capital-output ratio to leverage ratio 
lambda10 = 0.15                                               #Parameter in portfolio equation of bills
lambda11 = 0.2                                                #Parameter in portfolio equation of bills
lambda12 = 0                                                  #Parameter in portfolio equation of bills
lambda13 = -0.1                                               #Parameter in portfolio equation of bills
lambda14 = 0                                                  #Parameter in portfolio equation of bills
lambda20 = 0.40                                               #Parameter in portfolio equation of cheque deposits 
lambda21 = -0.05                                              #Parameter in portfolio equation of cheque deposits
lambda22 = 0                                                  #Parameter in portfolio equation of cheque deposits
lambda23 = 0.2                                                #Parameter in portfolio equation of cheque deposits
lambda24 = 0                                                  #Parameter in portfolio equation of cheque deposits
lambda30 = 0.1                                                #Parameter in portfolio equation of firms' securities 
lambda31 = -(lambda11+lambda21)                               #Parameter in portfolio equation of firms' securities
lambda32 = -(lambda12+lambda22)                               #Parameter in portfolio equation of firms' securities
lambda33 = -(lambda13+lambda23)                               #Parameter in portfolio equation of firms' securities
lambda34 = -(lambda14+lambda24)                               #Parameter in portfolio equation of firms' securities
lambdacw = 0.18                                               #Cash to consumption ratio of workers 
lambdacr = 0.18                                               #Cash to consumption ratio of managers and rentiers 
lambdam = 0.50                                                #Share of cheque deposits that households hold following QE 
nu = 0.2                                                      #Speed of adjustment of labour supply to labour demand
gl = 0.02                                                     #Structural rate of growth of labour force
psi1 = 0                                                      #Coefficient of price expectations function
psi2 = 0.01                                                   #Coefficient of price expectations function
chi = 0.001                                                   #Target percentage of investment to be funded by share issues
gammag = 0.4                                                  #Speed of adjustment of JG size to market conditions
m0 = -2.1                                                     #Coefficient of import function
m1 = -0.5                                                     #Coefficient of import function (Propensity to import: 0.22 #Note: UK=0.3; US=0.15)
m2 = 0.5                                                      #Coefficient of import function
m3 = 0                                                        #Coefficient of import function
x1 = 0.5                                                      #Coefficient of export function
x2 = 0.5                                                      #Coefficient of export function
x3 = 0                                                        #Coefficient of export function
gS = 0.03                                                     #Degrowth rate of income growth rate
prf=matrix(data=1,nrow=mc,ncol=nPeriods)              #Labour productivity in private sector
r_star=matrix(data=0.02,nrow=mc,ncol=nPeriods)        #Policy rate
omega1=matrix(data=0.01,nrow=mc,ncol=nPeriods)        #PC coefficient: speed of adjustment of un to nun
nun=matrix(data=0,nrow=mc,ncol=nPeriods)              #Non-inflationary rate of unemployment
alpha0=matrix(data=1.6,nrow=mc,ncol=nPeriods)         #Stochastic component of propensity to consume 
alpha10=matrix(data=1.6,nrow=mc,ncol=nPeriods)        #Autonomous component of propensity to consume 
alpha11=matrix(data=20,nrow=mc,ncol=nPeriods)         #Sensitivity of propensity to consume to interest rate 
alpha12=matrix(data=0.05,nrow=mc,ncol=nPeriods)       #Sensitivity of propensity to consume to unemployment rate 
alpha1=matrix(data=0,nrow=mc,ncol=nPeriods)           #Propensity to consume out of income of workers 
alpha7=matrix(data=0.15,nrow=mc,ncol=nPeriods)        #Propensity to consume out of income of rentiers and managers 
alpha2=matrix(data=0.10,nrow=mc,ncol=nPeriods)        #Propensity to consume out of wealth: cash 
alpha3=matrix(data=0.05,nrow=mc,ncol=nPeriods)        #Propensity to consume out of wealth: cheque deposits 
alpha4=matrix(data=0.025,nrow=mc,ncol=nPeriods)       #Propensity to consume out of wealth: saving deposits 
alpha5=matrix(data=0.01,nrow=mc,ncol=nPeriods)        #Propensity to consume out of wealth: bills
alpha6=matrix(data=0.01,nrow=mc,ncol=nPeriods)        #Propensity to consume out of wealth: shares and other firms' securities
delta=matrix(data=0.1,nrow=mc,ncol=nPeriods)          #Depreciation rate
gamma=matrix(data=0.15,nrow=mc,ncol=nPeriods)         #Reaction speed of adjustment of capital to its target value
kappa=matrix(data=1,nrow=mc,ncol=nPeriods)            #Capital-Output ratio
theta = matrix(data=0.02,nrow=mc,ncol=nPeriods)       #Profit retention rate
tau0 = matrix(data=0,nrow=mc,ncol=nPeriods)           #Autonomous component of tax revenue (shock)
tau1 = matrix(data=0.2,nrow=mc,ncol=nPeriods)         #Tax rate on labour income
tau2 = matrix(data=0.2,nrow=mc,ncol=nPeriods)         #Tax rate on capital income
tau3 = matrix(data=1/200,nrow=mc,ncol=nPeriods)       #Tax revenue rate on wealth
tau4 = matrix(data=2,nrow=mc,ncol=nPeriods)           #Other transfers 
tau5 = matrix(data=5,nrow=mc,ncol=nPeriods)           #Unemployment benefits (relative to unemployment rate) 
sigma0 = matrix(data=5,nrow=mc,ncol=nPeriods)         #Autonomous component of government spending
sigma1 = matrix(data=0.15,nrow=mc,ncol=nPeriods)      #Dependent component of government spending
sigma2 = matrix(data=1.25,nrow=mc,ncol=nPeriods)      #Elasticity of government spending to unemployment
mub0 = matrix(data=0.01,nrow=mc,ncol=nPeriods)        #Coefficient of bills' return rate 
mub1 = matrix(data=0.0025,nrow=mc,ncol=nPeriods)      #Coefficient of bills' return rate 
mub2 = matrix(data=0.015,nrow=mc,ncol=nPeriods)       #Coefficient of bills' return rate  
mul0 = matrix(data=0.02,nrow=mc,ncol=nPeriods)        #Coefficient of loans' interest rate
mul1 = matrix(data=0,nrow=mc,ncol=nPeriods)           #Coefficient of loans' interest rate
mum = matrix(data=0.01,nrow=mc,ncol=nPeriods)         #Mark-up: saving deposits' return rate 
mua = matrix(data=0.005,nrow=mc,ncol=nPeriods)        #Mark-up: CB advances' return rate 
muh = matrix(data=0,nrow=mc,ncol=nPeriods)            #Mark-up: reserves' return rate 
rho1 = matrix(data=0.025,nrow=mc,ncol=nPeriods)       #Reserves to cheque deposits parameter
rho2 = matrix(data=0.005,nrow=mc,ncol=nPeriods)       #Reserves to saving deposits parameter
mup = matrix(data=0.163,nrow=mc,ncol=nPeriods)        #Mark-up over labour cost
pt=matrix(data=1,nrow=mc,ncol=nPeriods)               #Target or natural price level
pit = matrix(data=0,nrow=mc,ncol=nPeriods)            #Target or normal inflation rate
vareps = matrix(data=0,nrow=mc,ncol=nPeriods)         #Target share of bills held by CB
vareps0 = matrix(data=0,nrow=mc,ncol=nPeriods)        #Autonomous component of target share of bills held by CB
vareps1 = matrix(data=0,nrow=mc,ncol=nPeriods)        #Sensitivity of target share of bills to interest rate
beta = matrix(data=0.5,nrow=mc,ncol=nPeriods)         #Share of notional bills held as bills by banks
mulh = matrix(data=0.02,nrow=mc,ncol=nPeriods)        #Mark-up: interest rate on mortgages
phi = matrix(data=0.05,nrow=mc,ncol=nPeriods)         #Loans to disposable income ratio with no imitation
alpha_im = matrix(data=1.5,nrow=mc,ncol=nPeriods)     #Imitative component of consumption 
rep = matrix(data=0.01,nrow=mc,ncol=nPeriods)         #Repayment rate on mortgages
rhog = matrix(data=0.60,nrow=mc,ncol=nPeriods)        #Government wage rate to private sector wage rate
wbg_perc = matrix(data=0.015,nrow=mc,ncol=nPeriods)   #Job guarantee spending to GDP
type_jg = matrix(data=0,nrow=mc,ncol=nPeriods)        #Job guarantee trigger (for experiments)
type_un = matrix(data=0,nrow=mc,ncol=nPeriods)        #Unemployment trigger (Note: 0 = unemployment rate considers public employees; 1 = unemployment rate does not consider public employees, hence no impact of on wage curve) 
alphag = matrix(data=0.005,nrow=mc,ncol=nPeriods)     #JG public goods to total consumption
tar_perc = matrix(data=0.25,nrow=mc,ncol=nPeriods)    #Tariffs to production cost ratio
exr = matrix(data=1,nrow=mc,ncol=nPeriods)            #Exchange rate (quantity of domestic currency per one unit of foreign currency)
x0 = matrix(data=-2.1,nrow=mc,ncol=nPeriods)          #Coefficient of export function
x00 = matrix(data=1,nrow=mc,ncol=nPeriods)            #Stochastic component of export function 
gF = matrix(data=0.053,nrow=mc,ncol=nPeriods)         #Foreign income growth rate
stoc = matrix(data=0,nrow=mc,ncol=nPeriods)           #Stocasticity trigger
TimeIndex = matrix(data=0,nrow=mc,ncol=nPeriods)      #Time index to plot value range

#STEP 4: Define endogenous variables
af=matrix(data=0,nrow=mc,ncol=nPeriods)               #Amortization funds
c=matrix(data=0,nrow=mc,ncol=nPeriods)                #Total demand for consumption
cw=matrix(data=0,nrow=mc,ncol=nPeriods)               #Workers' consumption 
cr=matrix(data=0,nrow=mc,ncol=nPeriods)               #Rentiers' and managers' consumption 
da=matrix(data=0,nrow=mc,ncol=nPeriods)               #Depreciation allowances
k=matrix(data=0,nrow=mc,ncol=nPeriods)                #Stock of capital 
kt=matrix(data=0,nrow=mc,ncol=nPeriods)               #Target stock of capital
lf=matrix(data=0,nrow=mc,ncol=nPeriods)               #Demand for bank loans 
ls=matrix(data=0,nrow=mc,ncol=nPeriods)               #Supply of bank loans 
id=matrix(data=0,nrow=mc,ncol=nPeriods)               #Investment
m1h=matrix(data=0,nrow=mc,ncol=nPeriods)              #Cheque deposits held by households
m1w=matrix(data=0,nrow=mc,ncol=nPeriods)              #Cheque deposits held by workers 
m1r=matrix(data=0,nrow=mc,ncol=nPeriods)              #Cheque deposits held by rentiers and managers 
m1s=matrix(data=0,nrow=mc,ncol=nPeriods)              #Supply of cheque deposits
m2h=matrix(data=0,nrow=mc,ncol=nPeriods)              #Saving deposits held by households
m2s=matrix(data=0,nrow=mc,ncol=nPeriods)              #Supply of saving deposits
nd=matrix(data=0,nrow=mc,ncol=nPeriods)               #Labour demand
ns=matrix(data=0,nrow=mc,ncol=nPeriods)               #Labour supply
nn=matrix(data=0,nrow=mc,ncol=nPeriods)               #Workers who do not have a job in the private sector
wh=matrix(data=0.86,nrow=mc,ncol=nPeriods)            #Wage rate of skilled workers
wl=matrix(data=rhol*wh,nrow=mc,ncol=nPeriods)         #Minimum wage rate
w=matrix(data=(betaw*wl+(1-betaw)*wh),nrow=mc,ncol=nPeriods) #Average wage rate
wb=matrix(data=0,nrow=mc,ncol=nPeriods)               #Wage bill
y=matrix(data=40,nrow=mc,ncol=nPeriods)               #Total income
ydw=matrix(data=0,nrow=mc,ncol=nPeriods)              #Disposable income of workers 
ydr=matrix(data=0,nrow=mc,ncol=nPeriods)              #Disposable income of rentiers and managers 
yd=matrix(data=0,nrow=mc,ncol=nPeriods)               #Total disposal income of households 
ff=matrix(data=0,nrow=mc,ncol=nPeriods)               #Profits of firms
fuf=matrix(data=0,nrow=mc,ncol=nPeriods)              #Undistributed firms profits (retained profits)
fdf=matrix(data=0,nrow=mc,ncol=nPeriods)              #Distributed firms profits (dividends)
tax = matrix(data=0,nrow=mc,ncol=nPeriods)            #Total tax revenue
taxw = matrix(data=0,nrow=mc,ncol=nPeriods)           #Taxes paid by workers 
taxr = matrix(data=0,nrow=mc,ncol=nPeriods)           #Taxes paid by rentiers and managers 
gov = matrix(data=tax,nrow=mc,ncol=nPeriods)          #Government spending
def = matrix(data=tax,nrow=mc,ncol=nPeriods)          #Government deficit
fb = matrix(data=0,nrow=mc,ncol=nPeriods)             #Bank profits
bs = matrix(data=0,nrow=mc,ncol=nPeriods)             #Bills issued by the Treasury
vh = matrix(data=0,nrow=mc,ncol=nPeriods)             #Household wealth
vw = matrix(data=0,nrow=mc,ncol=nPeriods)             #Workers' wealth (gross of loans) 
nvw = matrix(data=0,nrow=mc,ncol=nPeriods)            #Workers' net wealth 
vr = matrix(data=0,nrow=mc,ncol=nPeriods)             #Rentiers' and managers' wealth 
bh = matrix(data=0,nrow=mc,ncol=nPeriods)             #Household holdings of bills
bcb = matrix(data=0,nrow=mc,ncol=nPeriods)            #CB holdings of bills 
hs = matrix(data=0,nrow=mc,ncol=nPeriods)             #Supply of cash
as = matrix(data=0,nrow=mc,ncol=nPeriods)             #Supply of advances from CB (reserves if < 0)
ad = matrix(data=0,nrow=mc,ncol=nPeriods)             #Demand for advances (reserves if < 0)
hw = matrix(data=0,nrow=mc,ncol=nPeriods)             #Workers' holdings of cash 
hr = matrix(data=0,nrow=mc,ncol=nPeriods)             #Rentiers' and managers' holdings of cash 
hh = matrix(data=0,nrow=mc,ncol=nPeriods)             #Total holdings of cash 
mub = matrix(data=0,nrow=mc,ncol=nPeriods)            #Mark-up: bills' return rate 
mul = matrix(data=0.02,nrow=mc,ncol=nPeriods)         #Mark-up: loans' interest rate
rb = matrix(data=r_star+mub,nrow=mc,ncol=nPeriods)    #Return rate on bills 
rl=matrix(data=r_star+mul,nrow=mc,ncol=nPeriods)      #Rate of interests on banks loans
rm=matrix(data=r_star+mum,nrow=mc,ncol=nPeriods)      #Rate of interests on saving deposits
ra=matrix(data=r_star+mua,nrow=mc,ncol=nPeriods)      #Rate of interests on CB advances
rh=matrix(data=r_star+muh,nrow=mc,ncol=nPeriods)      #Rate of interests on reserves
fcb = matrix(data=0,nrow=mc,ncol=nPeriods)            #Central bank profit
hbd = matrix(data=0,nrow=mc,ncol=nPeriods)            #Reserve requirement: demand
hbs = matrix(data=0,nrow=mc,ncol=nPeriods)            #Reserve requirement: supply
bb = matrix(data=0,nrow=mc,ncol=nPeriods)             #Bills held by commercial banks
bb_not = matrix(data=0,nrow=mc,ncol=nPeriods)         #Notional amount of bills held by banks
p = matrix(data=1,nrow=mc,ncol=nPeriods)              #General price level
pf = matrix(data=1,nrow=mc,ncol=nPeriods)             #Unit price of private output
ep = matrix(data=1,nrow=mc,ncol=nPeriods)             #Expected price level
un = matrix(data=0,nrow=mc,ncol=nPeriods)             #Unemployment rate
eh = matrix(data=0,nrow=mc,ncol=nPeriods)             #Firms' shares held by househoulds
esr = matrix(data=0,nrow=mc,ncol=nPeriods)            #Number of shares issued by firms
ehr = matrix(data=0,nrow=mc,ncol=nPeriods)            #Number of shares held by households
re = matrix(data=r_star,nrow=mc,ncol=nPeriods)        #Return rate on firms' shares
pe = matrix(data=1,nrow=mc,ncol=nPeriods)             #Unit price of firms' shares
cg = matrix(data=0,nrow=mc,ncol=nPeriods)             #Capital gains on firms' shares
pi = matrix(data=0,nrow=mc,ncol=nPeriods)             #Inflation rate
epi = matrix(data=0,nrow=mc,ncol=nPeriods)            #Expected inflation rate: regressive expectations
bpr = matrix(data=1,nrow=mc,ncol=nPeriods)            #Share of bills purchased by private sector
bpcb = matrix(data=0,nrow=mc,ncol=nPeriods)           #Share of bills purchased by central bank 
hbd_star = matrix(data=0,nrow=mc,ncol=nPeriods)       #Extra reserves demanded by banks
hbs_star = matrix(data=0,nrow=mc,ncol=nPeriods)       #Extra reserves supplied by the CB
hbs_tot = matrix(data=0,nrow=mc,ncol=nPeriods)        #Total reserves
Omega = matrix(data=0,nrow=mc,ncol=nPeriods)          #Wage share to total income
Omega_adj = matrix(data=0,nrow=mc,ncol=nPeriods)      #Adjusted wage share to total income 
Omega_r = matrix(data=0.5,nrow=mc,ncol=nPeriods)      #Managers' share of wage and salaries 
lh = matrix(data=0,nrow=mc,ncol=nPeriods)             #Mortgages to households
rlh = matrix(data=r_star+mulh,nrow=mc,ncol=nPeriods)  #Interest rate on mortgages
nvh = matrix(data=0,nrow=mc,ncol=nPeriods)            #Household net wealth
tr = matrix(data=0,nrow=mc,ncol=nPeriods)             #Total transfers 
q = matrix(data=0.8,nrow=mc,ncol=nPeriods)            #Valuation ratio (Tobin q) 
lev = matrix(data=1,nrow=mc,ncol=nPeriods)            #Leverage ratio of firms 
wg = matrix(data=rhog*w,nrow=mc,ncol=nPeriods)        #Wage rate paid by the government
ng = matrix(data=0,nrow=mc,ncol=nPeriods)             #People hired by the government (job guarantee)
ng0 = matrix(data=0.98,nrow=mc,ncol=nPeriods)         #Coefficient defining share of unemployed hired by the government 
wbg = matrix(data=0,nrow=mc,ncol=nPeriods)            #Job guarantee wage bill
def_ratio = matrix(data=0,nrow=mc,ncol=nPeriods)      #Government deficit to GDP ratio
deb_ratio = matrix(data=0,nrow=mc,ncol=nPeriods)      #Government debt to GDP ratio
tar = matrix(data=0,nrow=mc,ncol=nPeriods)            #Tariffs associated with JG goods
im = matrix(data=0,nrow=mc,ncol=nPeriods)             #Import
x = matrix(data=0,nrow=mc,ncol=nPeriods)              #Export
fr = matrix(data=0,nrow=mc,ncol=nPeriods)             #Foreign reserves
tb = matrix(data=0,nrow=mc,ncol=nPeriods)             #Trade balance
tb_ratio = matrix(data=0,nrow=mc,ncol=nPeriods)       #Trade balance to GDP
yF = matrix(data=40,nrow=mc,ncol=nPeriods)            #Foreign income
type_gov = matrix(data=0,nrow=mc,ncol=nPeriods)       #Government spending trigger 
wh0 = 0.86                                            #Initial value of skilled workers wage rate 
wh1 = 0.5                                             #Inertia coefficient of skilled workers wages (note: named gamma_w in main text)