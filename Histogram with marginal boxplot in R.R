#Histogram with marginal boxplot in R

set.seed(123)
data <- rnorm(1000)
nf <- layout(mat = matrix(c(1,2),2,1, byrow=TRUE),  height = c(1,3))
par(mar=c(5.1, 4.1, 1.1, 2.1))
boxplot(data, horizontal=TRUE,  outline=FALSE,ylim=c(-4,4))
hist(data,xlim=c(-4,4))
