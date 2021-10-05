#Calculations: baseline
ya0=matrix(data=0,nrow=1,ncol=nPeriods)    #Average GDP
ysd0=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of GDP
yu0=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of GDP
yl0=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of GDP
for (i in 2:nPeriods){
  ya0[i] = mean(y0[,i])
  ysd0[i] = sd(y0[,i])
}
yu0 = ya0+2*ysd0  
yl0 = ya0-2*ysd0

pa0=matrix(data=0,nrow=1,ncol=nPeriods)    #Average price level
psd0=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of price level
pu0=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of price level
pl0=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of price level
for (i in 2:nPeriods){
  pa0[i] = mean(p0[,i])
  psd0[i] = sd(p0[,i])
}
pu0 = pa0+2*psd0  
pl0 = pa0-2*psd0

una0=matrix(data=0,nrow=1,ncol=nPeriods)    #Average unemployment rate
unsd0=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of unemployment rate
unu0=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of unemployment rate
unl0=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of unemployment rate
for (i in 2:nPeriods){
  una0[i] = mean(un0[,i])
  unsd0[i] = sd(un0[,i])
}
unu0 = una0+2*unsd0  
unl0 = una0-2*unsd0

defa0=matrix(data=0,nrow=1,ncol=nPeriods)    #Average deficit/GDP ratio
defsd0=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of deficit/GDP ratio
defu0=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of deficit/GDP ratio
defl0=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of deficit/GDP ratio
for (i in 2:nPeriods){
  defa0[i] = mean(def0[,i])
  defsd0[i] = sd(def0[,i])
}
defu0 = defa0+2*defsd0  
defl0 = defa0-2*defsd0

tba0=matrix(data=0,nrow=1,ncol=nPeriods)    #Average TB/GDP ratio
tbsd0=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of TB/GDP ratio
tbu0=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of TB/GDP ratio
tbl0=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of TB/GDP ratio
for (i in 2:nPeriods){
  tba0[i] = mean(tb0[,i])
  tbsd0[i] = sd(tb0[,i])
}
tbu0 = tba0+2*tbsd0  
tbl0 = tba0-2*tbsd0

leva0=matrix(data=0,nrow=1,ncol=nPeriods)    #Average leverage ratio
levsd0=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of leverage ratio
levu0=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of leverage ratio
levl0=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of leverage ratio
for (i in 2:nPeriods){
  leva0[i] = mean(lev0[,i])
  levsd0[i] = sd(lev0[,i])
}
levu0 = leva0+2*levsd0  
levl0 = leva0-2*levsd0

omegaa0=matrix(data=0,nrow=1,ncol=nPeriods)    #Average wage share
omegasd0=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of wage share
omegau0=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of wage share
omegal0=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of wage share
for (i in 2:nPeriods){
  omegaa0[i] = mean(omega0[,i])
  omegasd0[i] = sd(omega0[,i])
}
omegau0 = omegaa0+2*omegasd0  
omegal0 = omegaa0-2*omegasd0

omegaa0_adj=matrix(data=0,nrow=1,ncol=nPeriods)    #Average adjusted wage share
omegasd0_adj=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of adjusted wage share
omegau0_adj=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of adjusted wage share
omegal0_adj=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of adjusted wage share
for (i in 2:nPeriods){
  omegaa0_adj[i] = mean(omega0_adj[,i])
  omegasd0_adj[i] = sd(omega0_adj[,i])
}
omegau0_adj = omegaa0_adj+2*omegasd0_adj  
omegal0_adj = omegaa0_adj-2*omegasd0_adj

bsa0=matrix(data=0,nrow=1,ncol=nPeriods)    #Average debt
bssd0=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of debt
bsu0=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of debt
bsl0=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of debt
for (i in 2:nPeriods){
  bsa0[i] = mean(bs0[,i])
  bssd0[i] = sd(bs0[,i])
}
bsu0 = bsa0+2*bssd0  
bsl0 = bsa0-2*bssd0

#Additional calculations: scenario 10
pa10=matrix(data=0,nrow=1,ncol=nPeriods)    #Average price level
psd10=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of price level
pu10=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of price level
pl10=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of price level
for (i in 2:nPeriods){
  pa10[i] = mean(p10[,i])
  psd10[i] = sd(p10[,i])
}
pu10 = pa10+2*psd10  
pl10 = pa10-2*psd10

una10=matrix(data=0,nrow=1,ncol=nPeriods)    #Average unemployment rate
unsd10=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of unemployment rate
unu10=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of unemployment rate
unl10=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of unemployment rate
for (i in 2:nPeriods){
  una10[i] = mean(un10[,i])
  unsd10[i] = sd(un10[,i])
}
unu10 = una10+2*unsd10  
unl10 = una10-2*unsd10

defa10=matrix(data=0,nrow=1,ncol=nPeriods)    #Average deficit/GDP ratio
defsd10=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of deficit/GDP ratio
defu10=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of deficit/GDP ratio
defl10=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of deficit/GDP ratio
for (i in 2:nPeriods){
  defa10[i] = mean(def10[,i])
  defsd10[i] = sd(def10[,i])
}
defu10 = defa10+2*defsd10  
defl10 = defa10-2*defsd10

tba10=matrix(data=0,nrow=1,ncol=nPeriods)    #Average TB/GDP ratio
tbsd10=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of TB/GDP ratio
tbu10=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of TB/GDP ratio
tbl10=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of TB/GDP ratio
for (i in 2:nPeriods){
  tba10[i] = mean(tb10[,i])
  tbsd10[i] = sd(tb10[,i])
}
tbu10 = tba10+2*tbsd10  
tbl10 = tba10-2*tbsd10

leva10=matrix(data=0,nrow=1,ncol=nPeriods)    #Average leverage ratio
levsd10=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of leverage ratio
levu10=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of leverage ratio
levl10=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of leverage ratio
for (i in 2:nPeriods){
  leva10[i] = mean(lev10[,i])
  levsd10[i] = sd(lev10[,i])
}
levu10 = leva10+2*levsd10  
levl10 = leva10-2*levsd10

omegaa10=matrix(data=0,nrow=1,ncol=nPeriods)    #Average wage share
omegasd10=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of wage share
omegau10=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of wage share
omegal10=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of wage share
for (i in 2:nPeriods){
  omegaa10[i] = mean(omega10[,i])
  omegasd10[i] = sd(omega10[,i])
}
omegau10 = omegaa10+2*omegasd10  
omegal10 = omegaa10-2*omegasd10

#Calculations: other scenarios 4 to 12
pa4=matrix(data=0,nrow=1,ncol=nPeriods)    #Average price level
psd4=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of price level
pu4=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of price level
pl4=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of price level
for (i in 2:nPeriods){
  pa4[i] = mean(p4[,i])
  psd4[i] = sd(p4[,i])
}
pu4 = pa4+2*psd4  
pl4 = pa4-2*psd4

pa5=matrix(data=0,nrow=1,ncol=nPeriods)    #Average price level
psd5=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of price level
pu5=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of price level
pl5=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of price level
for (i in 2:nPeriods){
  pa5[i] = mean(p5[,i])
  psd5[i] = sd(p5[,i])
}
pu5 = pa5+2*psd5  
pl5 = pa5-2*psd5

pa6=matrix(data=0,nrow=1,ncol=nPeriods)    #Average price level
psd6=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of price level
pu6=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of price level
pl6=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of price level
for (i in 2:nPeriods){
  pa6[i] = mean(p6[,i])
  psd6[i] = sd(p6[,i])
}
pu6 = pa6+2*psd6  
pl6 = pa6-2*psd6

pa7=matrix(data=0,nrow=1,ncol=nPeriods)    #Average price level
psd7=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of price level
pu7=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of price level
pl7=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of price level
for (i in 2:nPeriods){
  pa7[i] = mean(p7[,i])
  psd7[i] = sd(p7[,i])
}
pu7 = pa7+2*psd7  
pl7 = pa7-2*psd7

pa8=matrix(data=0,nrow=1,ncol=nPeriods)    #Average price level
psd8=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of price level
pu8=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of price level
pl8=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of price level
for (i in 2:nPeriods){
  pa8[i] = mean(p8[,i])
  psd8[i] = sd(p8[,i])
}
pu8 = pa8+2*psd8  
pl8 = pa8-2*psd8

pa9=matrix(data=0,nrow=1,ncol=nPeriods)    #Average price level
psd9=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of price level
pu9=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of price level
pl9=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of price level
for (i in 2:nPeriods){
  pa9[i] = mean(p9[,i])
  psd9[i] = sd(p9[,i])
}
pu9 = pa9+2*psd9  
pl9 = pa9-2*psd9

pa11=matrix(data=0,nrow=1,ncol=nPeriods)    #Average price level
psd11=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of price level
pu11=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of price level
pl11=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of price level
for (i in 2:nPeriods){
  pa11[i] = mean(p11[,i])
  psd11[i] = sd(p11[,i])
}
pu11 = pa11+2*psd11  
pl11 = pa11-2*psd11

pa12=matrix(data=0,nrow=1,ncol=nPeriods)    #Average price level
psd12=matrix(data=0,nrow=1,ncol=nPeriods)   #Standard deviation of price level
pu12=matrix(data=0,nrow=1,ncol=nPeriods)    #Upper limit of price level
pl12=matrix(data=0,nrow=1,ncol=nPeriods)    #Lower limit of price level
for (i in 2:nPeriods){
  pa12[i] = mean(p12[,i])
  psd12[i] = sd(p12[,i])
}
pu12 = pa12+2*psd12  
pl12 = pa12-2*psd12