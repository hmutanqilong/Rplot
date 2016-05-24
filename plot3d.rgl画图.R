##### data
rnorm(10000, mean=3,sd=1)->tu1
rnorm(10000, mean=2,sd=0.75)->tu2
rnorm(10000, mean=2.3,sd=0.81)->tu3
density(tu1)->inter1
density(tu2)->inter2
density(tu3)->inter3

y<-as.double(c(rep(8,length(inter1$x)),
	rep(12,length(inter1$x)),
	rep(16,length(inter1$x))))
x<-c(inter1$x, inter2$x, inter3$x)
z<-c(inter1$y, inter2$y, inter3$y)

###density lines
library(rgl)
open3d()
plot3d(x, y, z, ylim=c(7,18), box=F, xlim=c(1,5),zlim=c(0,1))

###lines
rep(seq(-1,6,length.out=20),3)->addx
addy<-as.double(rep(c(8.0,12.0,16.0),each=20))
addz<-as.double(rep(0.0,length(addx)))
plot3d(addx, addy, addz, type="p",col="blue",add=TRUE,lty=2)

###lines2
which.max(inter1$y)->which.1
plot3d(c(inter1$x[which.1], inter1$x[which.1]),as.double(c(8,8)),
	c(0, inter1$y[which.1]),col="red",add=TRUE,lty=1, type="l")

which.max(inter2$y)->which.1
plot3d(c(inter2$x[which.1], inter2$x[which.1]),as.double(c(12,12)),
	c(0, inter2$y[which.1]),col="red",add=TRUE,lty=1, type="l")

which.max(inter3$y)->which.1
plot3d(c(inter3$x[which.1], inter3$x[which.1]),as.double(c(16,16)),
	c(0, inter3$y[which.1]),col="red",add=TRUE,lty=1, type="l")