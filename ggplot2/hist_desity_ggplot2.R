require(ggplot2)
require(gridExtra)
## data
dat <- data.frame(RACE=c(rep(1,100),rep(2,100)),tg=c(rnorm(100,mean=50,sd=3),rnorm(100,mean=45,sd=2)))
dat$RACE <- factor(dat$RACE); levels(dat$RACE) <- c("Whites","Blacks")

### ggplot
g1 <- ggplot(dat, aes(x=tg,colour=RACE,fill=RACE)) + geom_density(alpha=.1)

g2 <- ggplot(dat, aes(x=tg,cex.lab=3)) + geom_histogram(aes(y =..density..),binwidth=1, colour="black", fill="white") + 
  geom_density(alpha=.1) + facet_grid(RACE ~ .)

grid.arrange(g1, g2, nrow=2, ncol=1)
