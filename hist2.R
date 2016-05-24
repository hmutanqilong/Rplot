## 根据分组，就像boxplot一样给出分布的描述
## plot=F 就无法使用prob=T
## 对单变量强的使用上下的直方图funciion描述
hist2 <- function(x=x,y=y,main="histgram",ylim=c(-20,20)) {
	if (is.factor(y)){
		# breaks=seq(min(x),max(x),(max(x)-min(x))/100)
		hist(x[y==levels(y)[1]],xlim=c(min(x),max(x)),breaks=seq(min(x),max(x),(max(x)-min(x))/50),
			ylim=ylim,col="blue",main=main,xlab=NULL,ylab=NULL)
		hist=hist(x[y==levels(y)[2]],breaks=seq(min(x),max(x),(max(x)-min(x))/50),plot=F)
		hist$counts= -hist$counts 
		lines(hist,col="red")
	}
	else stop("y must be a factor/t")
}
	# hist2(neg3.x[,1029],yy2)