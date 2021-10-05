#RUN THE WHOLE CODE

#Note: download all the files and then run this

###########################################

#1)Run each single experiment

#Baseline
r_code_001<-paste0("Scenario 0.R")
source(r_code_001)

#Increase in government spending
r_code_001<-paste0("Scenario 4.R")
source(r_code_001)

#Spending and monetisation
r_code_001<-paste0("Scenario 5.R")
source(r_code_001)

#Interest rate cut
r_code_001<-paste0("Scenario 6.R")
source(r_code_001)

#Lower reserve requirement
r_code_001<-paste0("Scenario 7.R")
source(r_code_001)

#Quantitative easing
r_code_001<-paste0("Scenario 8.R")
source(r_code_001)

#Tax cut
r_code_001<-paste0("Scenario 9.R")
source(r_code_001)

#Job guarantee (endogenous employees)
r_code_001<-paste0("Scenario 10.R")
source(r_code_001)

#Job guarantee (endogenous wage rate and no impact on employment and wages)
r_code_001<-paste0("Scenario 11.R")
source(r_code_001)

#Job guarantee (devaluation)
r_code_001<-paste0("Scenario 12.R")
source(r_code_001)

###########################################

#2) Diagnostic
r_code_001<-paste0("Validation.R")
source(r_code_001)

###########################################

#3) Run the model
r_code_001<-paste0("STRECO model 2021.R")
source(r_code_001)
