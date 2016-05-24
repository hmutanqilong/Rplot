## box-dotplot 散点和箱式图的合体
no.sample <- 50
y <- factor(c(rep("ctrl",no.sample),rep("treat",no.sample)))
x <- c(rnorm(no.sample,mean=0,sd=1),rnorm(no.sample,mean=2,sd=1))

## 最牛的方法
#install.packages("beeswarm")
require(beeswarm)
data(breast)
beeswarm(x ~ y,method = 'swarm',pch = 16)
boxplot(x ~ y,add = T,names = c("",""),col="#0000ff22")

## 方法1
boxplot(x ~ y, border=4, outline=F, boxwex=0.5)
points(jitter(rep(1:2, each=no.sample), 1),unlist(split(x, y)),col=2,cex=0.5, pch=16)
## 两组样本不均衡的时候，需要更改jitter
#jitter(1:4,c(6,6,7,7))

#其他方法
library(ggplot2)
qplot(y,x,geom="jitter")

##方法2
dat <- data.frame(x=c(rnorm(20),rnorm(20,1.5)),group=gl(2,20,labels=LETTERS[1:2]))
boxplot(x~group,dat,outpch=NA)
stripchart(x~group,vertical=T,data=dat,method="jitter",add=T,pch=21)

#方法3
library(ggplot2)
attach(mtcars)
qplot(factor(cyl), wt, geom=c("boxplot", "jitter"))


##方法4
library(ggplot2)
dd = data.frame(values=runif(21), type = c("Control", "Treated", "Treated + A"))

#Next change the default theme:
  
theme_set(theme_bw())
#Now we build the plot. 

#Construct a base object - nothing is plotted:
  
g = ggplot(dd, aes(type, values))
#Add on the points: adjust the default jitter and change glyph according to type:
g = g + geom_jitter(aes(pch=type), position=position_jitter(width=0.1))
#Add on the "box": calculate where the box ends. In this case, I've chosen the average value. If you don't want the box, just omit this step.

g = g + stat_summary(fun.y = function(i) mean(i), 
                     geom="bar", fill="white", colour="black")Add on some error bars: calculate the upper/lower bounds and adjust the bar width:
  
  g  = g + stat_summary(
    fun.ymax=function(i) mean(i) + qt(0.975, length(i))*sd(i)/length(i), 
    fun.ymin=function(i) mean(i) - qt(0.975, length(i)) *sd(i)/length(i),
    geom="errorbar", width=0.2)Display the plot

g