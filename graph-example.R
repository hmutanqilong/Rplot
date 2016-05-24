################################################
bitmap(file = "profiles.jpeg", type = "jpeg", res=300)	## 高清图
opar <- par(mfrow=c(2,1),cex=1.2,font=1,font.main=1,font.axis=1)
plot(seqs,oob1,type="b",ylim=c(0,0.5),col=2,lty=1,lwd=2,pch=16,
	xlab="Number of Noise",ylab="OOB Error Rate")
lines(seqs,oob2,type="b",col=4,lty=2,lwd=2,pch=5)
	legend("bottomright",col=c(2,4),pch=c(16,5),lwd=2,cex=1,
		legend=c("交互变量","单变量"))
par(opar)
dev.off() ##