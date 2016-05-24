	# assign and compute the required data, 
	# R awaits the steps of the function. 
	# Copy-paste the entire function into R:
bland_altman_plot <- function(test1=test1,test2=test2,
	xlab="Average test result", 
	ylab="Deviation of experimental test")
{
	mean <- ((test1 + test2)/2)
	diff <- test1-test2
	plot(diff ~ mean,pch=22,col=4,
		ylim=c(min(min(diff)-0.2*abs(min(diff)),mean(diff)-2.2*sd(diff)),
			max(max(diff)+0.2*abs(max(diff)),mean(diff)+2.2*sd(diff))),
		xlab=xlab,ylab=ylab)
	abline(h=mean(diff)-c(-2,0,2)*sd(diff),lty=c(1,2,1),lwd=2,col=c(4,2,4))
}
# call the function:
# bland_altman_plot(test1=,test2=)
# library(ResearchMethods) 