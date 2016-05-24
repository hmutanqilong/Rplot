# Cox regression
library(survival)
model2 <- coxph(Surv(start, stop, event) ~ transplant:year + year + strata(transplant), data=jasa1)
plot(survfit(model2), conf.int=TRUE, lty=1:2, xlab="Time (days)", ylab="Survival")