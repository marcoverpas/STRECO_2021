#DEFINE EQUATIONS

# STEP 5: MODEL AND ITERATIONS                    

#Run Monte Carlo simulations
for (j in 1:mc){
  
  #Define the time loop
  for (i in 2:nPeriods){
    
    #Define iterations
    for (iterations in 1:100){
      
      #Define alternative scenarios
      
      #Positive shock to JG I (endogenous wage rate)
      if (shock==2){
      if (i>=60 && j>=2){      
        type_jg[j,i]=1
      }}
      
      #Positive shock to government spending (to be compared with 2)
      if (shock==3){
      if (i>=60 && j>=2){      
        sigma0[j,i]=5+0.015*y[1,59]  #Note: 0.015 = wbg_perc
      }}  
      #Note: wbg=wbg_perc*y[j,59], where: wbg_perc=0.015
      
      #Positive shock to government spending
      if (shock==4){
      if (i>=60 && j>=2){
        sigma0[j,i]=8 
      }}
      
      #Positive shock to government spending and monetization
      if (shock==5){
      if (i>=60 && j>=2){
        sigma0[j,i]=8 
        vareps0[j,i]=0.5
      }}
      
      #Negative shock to policy rate
      if (shock==6){
      if (i>=60 && j>=2){
        r_star[j,i]=0.01 
      }}
      
      #Negative shock to reserve requirement
      if (shock==7){
      if (i>=60 && j>=2){      
        rho1[j,i]=0
        rho2[j,i]=0
      }}
      
      #Positive shock to monetary policy (QE)
      if (shock==8){
      if (i>=60 && j>=2){      
        vareps0[j,i]=0.5
      }}
      
      #Positive shock to taxes
      if (shock==9){
      if (i>=60 && j>=2){      
        tau0[j,i]=-3
      }}
      
      #Positive shock to JG II (endogenous employees + flatter PC)
      if (shock==10){
      if (i>=60 && j>=2){      
        type_jg[j,i]=2
        #type_un[j,i]=0
      }} 
      
      #Positive shock to JG III (endogenous wage rate + flatter PC)
      if (shock==11){
      if (i>=60 && j>=2){      
        type_jg[j,i]=1
        #type_un[j,i]=0
      }}
      
      #Positive shock to exchange rate
      if (shock==12){
      if (i>=60 && j>=2){      
        exr[j,i]=1.5
      }}
      
      #Negative shock to demand if JG next year
      if (shock==13){
        if (i>=60 && j>=2){      
          x0[j,i]=-12.6 #from -2.1
          }
        if (i>=61 && j>=2){      
          type_jg[j,i]=1
        }}
      
      #Negative shock to demand if government spending next year
      if (shock==14){
        if (i>=60 && j>=2){
          x0[j,i]=-12.6 #from -2.1
          }
        if (i>=61 && j>=2){
          sigma0[j,i]=5+0.015*y[1,59]
        }}
      
      #Positive shock to government spending: until full employment is achieved 
      if (shock==15){
        if (i>=60 && j>=2){      
          sigma0[j,i]=8 
          type_gov[j,i]=1  
          }} 
      
      #Positive shock to JG IV: until full employment is achieved (and no charges) 
      if (shock==16){
        if (i>=60 && j>=2){      
          type_jg[j,i]=3
          #type_un[j,i]=0
          tar_perc[j,i]=0
        }}
      
      
      
      ###########################################
      
      #Make it stochastic (activate Monte Carlo simulations) 
      if (j>=3){
        stoc[j,i]=1
      }
      
      #MODEL EQUATIONS      
      
      #Change seed of pseud-random numbers generator
      set.seed(j)                                                         
      
      #Set stochastic components
      alpha0[j,i] = stoc[j,i]*(runif(1,min = -0.05, max = 0.05))          #Propensity to consume out of income
      kappa0[j,i] = 1 + stoc[j,i]*(runif(1,min = -0.05, max = 0.05))      #Coefficient of capital to output ratio
      kappa1[j,i] = 0.1 + stoc[j,i]*(runif(1,min = -0.05, max = 0.05))    #Coefficient of capital to output ratio
      kappa2[j,i] = -0.1 + stoc[j,i]*(runif(1,min = -0.05, max = 0.05))   #Coefficient of capital to output ratio
      omega1[j,i] = 0.01 + stoc[j,i]*runif(1,min=-0.005,max=0.005)        #Wage function
      x00[j,i] = 1 + stoc[j,i]*(runif(1,min = -0.05, max = 0.05))         #Total export
      Omega_r[j,i] = 0.5 + stoc[j,i]*(runif(1,min = -0.05, max = 0.05))   #Share of managerial labour income (Omega_r)
      ng0[j,i] = runif(1,min = 0.96, max = 1)                             #Share of unemployed hired through JG
      tar_perc[j,i] = 0.25 + stoc[j,i]*(runif(1,min = -0.05, max = 0.05)) #Tariffs to production cost ratio
      rhog[j,i] = 0.60 + stoc[j,i]*(runif(1,min = -0.10, max = 0.10))     #Government wage rate to private sector wage rate
      
      #Non-financial firms
      y[j,i] = c[j,i] + id[j,i] + gov[j,i] + tb[j,i]                      #National income identity (GDP)
      kt[j,i] = kappa[j,i]*y[j,i-1]/ep[j,i]                               #Target capital stock
      da[j,i] = delta[j,i]*k[j,i-1]*p[j,i]                                #Depreciation allowances
      af[j,i] = da[j,i]                                                   #Amortization funds
      id[j,i] = gamma[j,i]*(kt[j,i] - k[j,i-1])*p[j,i] + da[j,i]          #Demand for investment: conventional
      kappa[j,i] = kappa0[j,i]+kappa1[j,i]*q[j,i-1]+kappa2[j,i]*lev[j,i-1]   #Capital-output ratio
      k[j,i] = k[j,i-1] + (id[j,i] - da[j,i])/p[j,i]                      #Accumulation of capital - Investment behaviour
      ff[j,i] = y[j,i] - rl[j,i-1]*lf[j,i-1] - af[j,i] - wb[j,i]          #Firms profits (residual) 
      fdf[j,i] = (1-theta[j,i])*ff[j,i-1]                                 #Distributed profits 
      fuf[j,i] = ff[j,i] - fdf[j,i]                                       #Retained profits 
      lf[j,i] = lf[j,i-1] + id[j,i] - af[j,i] - fuf[j,i] - (esr[j,i]-esr[j,i-1])*pe[j,i]  #Demand for bank loans
      if (i<5) {esr[j,i] = 10}
      else {esr[j,i] = esr[j,i-1] + chi*id[j,i]/pe[j,i]}                  #Number of shares (equity, shares and bonds) issued by the firms
      
      #Households
      ydw[j,i] = wb[j,i]*(1-Omega_r[j,i]) - rlh[j,i-1]*lh[j,i-1] + tr[j,i] - taxw[j,i] + wbg[j,i] - tar[j,i] #Disposable income of workers
      ydr[j,i] = wb[j,i]*Omega_r[j,i] + rm[j,i-1]*m2h[j,i-1] + rb[j,i-1]*bh[j,i-1] + fdf[j,i] + fb[j,i] - taxr[j,i] #Disposable income of rentiers and managers 
      yd[j,i] = ydw[j,i] + ydr[j,i]                                                         #Total disposable income
      if (cr[j,i-1]>0 && cw[j,i-1]>0){cw[j,i] = (alpha1[j,i]*ydw[j,i-1]+alpha2[j,i]*hw[j,i-1]+alpha3[j,i]*m1w[j,i-1])*p[j,i]/ep[j,i]+alpha_im[j,i]*(cr[j,i-1]/cw[j,i-1])*p[j,i] }        
      else{cw[j,i] = (alpha1[j,i]*ydw[j,i-1]+alpha2[j,i]*hw[j,i-1]+alpha3[j,i]*m1w[j,i-1])*p[j,i]/ep[j,i]}  #Workers' consumption    
      cr[j,i] = (alpha7[j,i]*ydr[j,i-1]+alpha2[j,i]*hr[j,i-1]+alpha3[j,i]*m1r[j,i-1]+alpha4[j,i]*m2h[j,i-1]+alpha5[j,i]*bh[j,i-1]+alpha6[j,i]*eh[j,i-1])*p[j,i]/ep[j,i] #Rentiers' and managers' consumption
      c[j,i] = cw[j,i] + cr[j,i]                                                            #Total consumption
      alpha1[j,i] = alpha10[j,i] - alpha11[j,i]*rlh[j,i-1] - alpha12[j,i]*un[j,i-1] + alpha0[j,i] #Endogenous propensity to consume
      nvw[j,i] = nvw[j,i-1] + ydw[j,i] - cw[j,i]                                            #Workers' wealth net of loans
      vw[j,i] = nvw[j,i] + lh[j,i]                                                          #Workers' (gross) wealth
      vr[j,i] = vr[j,i-1] + ydr[j,i] + cg[j,i] - cr[j,i]                                    #Rentiers' and managers' wealth
      vh[j,i] = vw[j,i] + vr[j,i]                                                           #Total household wealth
      cg[j,i] = esr[j,i-1]*(pe[j,i] - pe[j,i-1])                                            #Capital gains
      Omega[j,i]=(wb[j,i] + wbg[j,i])/yd[j,i]                                               #Labour income share to total disposable income
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
      if (type_gov[j,i]==1 && un[j,i-1]>0){                                #Government spending based on unemployment
          gov[j,i] = sigma0[j,i] + sigma1[j,i]*y[j,i-1] + sigma2[j,i]*(ns[j,i-1]-nd[j,i-1])*prf[j,i-1]*p[j,i-1]}                                                                
      else{gov[j,i] = sigma0[j,i] + sigma1[j,i]*y[j,i-1]}                  #Government spending: purchase of goods and services
      
      #A) Job guarantee with endogenous wg/w and exogenous employees (Scenario 2)
      if (type_jg[j,i]==1){
        if (ng[j,i]==0){wg[j,i]=0}
        else {wg[j,i] = wbg[j,i]/ng[j,i]}                               #Wage rate paid under the JG programme
        nn[j,i] = ns[j,i] - nd[j,i]                                     #Workers who do not have a job in the private sector
        ng[j,i] = min(ng[j,i-1]+gammag*(nn[j,i]-ng[j,i-1]),nn[j,i])     #Workers hired under JG programme
        wbg[j,i] = wbg_perc[j,i]*y[j,59]                                #Total spending for the JG programme
        tar[j,i] = tar_perc[j,i]*wbg[j,i]                               #Charges
      }
      else {
        wg[j,i] = 0
        ng[j,i] = 0
        nn[j,i] = ns[j,i] - nd[j,i]
        wbg[j,i] = 0      
      }    
      
      #B) Job guarantee with endogenous employees and exogenous wg/w (Scenario 10)
      if (type_jg[j,i]==2){
        wg[j,i] = rhog[j,i]*w[j,i-1]                                    #Wage rate paid under JG
        wbg[j,i] = wbg_perc[j,i]*y[j,59]                                #Total spending for the JG programme  
        nn[j,i] = ns[j,i] - nd[j,i]                                     #Workers who do not have a job in the private sector
        ng[j,i] = min(wbg[j,i]/wg[j,i],nn[j,i])                         #Workers hired under JG programme
        tar[j,i] = tar_perc[j,i]*wbg[j,i]                               #Charges
        }
      
      #C) Job guarantee with endogenous employees, exogenous wg/w and no ceiling (scenario 16)
      if (type_jg[j,i]==3){
        wg[j,i] = rhog[j,i]*w[j,i]  
        wbg[j,i] = wg[j,i]*ng[j,i]                                      #Total spending for the JG programme (with no ceiling)
        nn[j,i] = ns[j,i] - nd[j,i]                                     #Workers who do not have a job in the private sector
        ng[j,i] = ng0[j,i]*nn[j,i]                                      #Workers hired under JG programme (approximately 98% of those not employed by private firms)
        tar[j,i] = tar_perc[j,i]*wbg[j,i]                               #Charges
        }
      
      def[j,i] = gov[j,i] + tr[j,i] + rb[j,i-1]*bs[j,i-1] - tax[j,i] - fcb[j,i] + wbg[j,i] - tar[j,i] #Government deficit
      bs[j,i] = bs[j,i-1] + def[j,i]                                      #Supply of bills
      
      #Portfolio decisions
      ehr[j,i] = esr[j,i]                                                 #Number of shares held by households
      eh[j,i] = ehr[j,i]*pe[j,i]                                          #Nominal amount of shares demanded by households
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
      x[j,i] = (exp(x0[j,i] + x1*log(exr[j,i-1]) + x2*log(yF[j,i-1]) + x3*log(p[j,i-1])))*x00[j,i] #Export 
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
      else {re[j,i] = (fdf[j,i]+cg[j,i])/eh[j,i-1]}                       #Return rate on firms' shares
      rb[j,i] = r_star[j,i] + mub[j,i]                                    #Return rate on bills
      rl[j,i] = r_star[j,i] + mul[j,i]                                    #Interest rate on loans
      rlh[j,i] = r_star[j,i] + mulh[j,i]                                  #Interest rate on mortgages
      rm[j,i] = r_star[j,i] + mum[j,i]                                    #Return rate on saving deposits
      ra[j,i] = r_star[j,i] + mua[j,i]                                    #Interest rate on CB advances
      rh[j,i] = r_star[j,i] + muh[j,i]                                    #Return rate on reserves
      mul[j,i] = mul0[j,i] + mul1[j,i]*lev[j,i-1]                         #Mark-up of interest rate on loans: endogenous (Minsky)
      
      if ((shock==5 || shock==8) && i>=60) {mub[j,i] = mub0[j,i] - mub2[j,i]*(bpcb[j,i-1])}  
      else{mub[j,i] = mub0[j,i] - mub1[j,i]*(bpr[j,i-1])}                 #Mark-up of bills yield
      bpr[j,i] = (bh[j,i] + bb[j,i])/bs[j,i]                              #Share of bills demanded by private sector
      bpcb[j,i] = bcb[j,i]/bs[j,i]                                        #Share of bills demanded by CB under QE program
      
      #Labour market
      wb[j,i] = w[j,i]*nd[j,i]                                            #Wage bill  
      nd[j,i] = (y[j,i]-wbg[j,i])/(prf[j,i]*p[j,i])                       #Employment (labour demand)
      if (i<3) {ns[j,i] = 45}
      else{ ns[j,i] = ns[j,i-1]*(1+gl) + nu*(nd[j,i-1]-ns[j,i-1])}        #Labour force (labour supply)
      if (ns[j,i]<nd[j,i]) {ns[j,i]=nd[j,i]}                              #un>=0 condition
      if (type_un[j,i]==0) {un[j,i] = 1-((nd[j,i]+ng[j,i])/ns[j,i])}      #Unemployment rate considering public employees
      else{un[j,i] = 1-(nd[j,i]/ns[j,i])}                                 #Unemployment rate without public employees
      if (i<3) {wh[j,i] = wh0}
      else{wh[j,i] = wh1*wh0 + (1-wh1)*((1 - omega1[j,i]*(un[j,i-1] - nun[j,i]))*ep[j,i]*wh[j,i-1]/p[j,i-1])} #Nominal wage rate of skilled workers (linear)
      w[j,i] = betaw*wl[j,i] + (1-betaw)*wh[j,i]                          #Average wage rate across workers
      if (type_jg[j,i]==2 || type_jg[j,i]==3){                            #|| type_jg[j,i]==1){
      wl[j,i] = wg[j,i]}  else {wl[j,i]=rhol*w[j,i]}                      #Minimum wage rate
      
      #Prices and expectations
      pf[j,i] = (w[j,i]/prf[j,i])*(1+mup[j,i])                            #Unit price of private output
      if (type_jg[j,i]==0 && j!=11) {p[j,i] = pf[j,i]}                     #General price level
      else {p[j,i] = p[j,i-1]+(pf[j,i]-pf[j,i-1])*(1-(wbg[j,i-1]/y[j,i-1])) + (tar[j,i]-tar[j,i-1])*(wbg[j,i-1]/y[j,i-1])}    #General price level
      pi[j,i] = (p[j,i]/p[j,i-1])-1                                       #Inflation rate
      if (i<3) {epi[j,i] = pi[j,i]}
      else {epi[j,i] = pi[j,i-1] + psi1 + psi2*(pit[j,i-1]-pi[j,i-1])}    #Expected inflation rate: regressive expectations
      ep[j,i] = p[j,i-1]*(1+epi[j,i])                                     #Expected price level
      
      #Debt ratios
      q[j,i] = (esr[j,i]*pe[j,i] + lf[j,i])/(p[j,i]*k[j,i])               #Valuation ratio (Tobin q)
      lev[j,i] = lf[j,i]/(esr[j,i]*pe[j,i] + lf[j,i])                     #Leverage ratio of firms
      def_ratio[j,i] = def[j,i]/y[j,i]                                    #Goverment deficit to GDP ratio
      deb_ratio[j,i] = bs[j,i]/y[j,i]                                     #Goverment debt to GDP ratio
      tb_ratio[j,i] = tb[j,i]/y[j,i]                                      #Trade balance to GDP ratio
      
      #Redundant equation
      #hh[j,i] = hs[j,i]
      
      
    }
  }
}