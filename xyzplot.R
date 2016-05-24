## plot(x~y|z)
xyzplot <- function(x=x,y=y,z=z,se=se,ebar=1){
  
  ny <- names(table(y))
  nz <- names(table(z))
  ebar=1
  plot(min(x),ylim=c(min(x)*0.90,max(x)*1.1),xlim=c(1,length(ny)*length(nz)),
       yaxt="n",xaxt="n",xlab="",ylab="",col="white")
  for (i in 1:length(nz)){#z
    #i=1
    xp <- x[z==nz[i]]; yp <- y[z==nz[i]]
    xlim <- c(1:length(ny)+length(ny)*(i-1))
    points(xp~xlim,col=i,pch=1,lwd=2.5)
    if (ebar==1){
      sep <- se[z==nz[i]]
      arrows(xlim,xp-sep,xlim,xp+sep,length=0.05,angle=90,code=3,col=i,lwd=2.5)
    }
    axis(1,at=xlim,label=paste(nz[1],ny,sep="_"))
  }
  axis(2,at=seq(floor(min(x)*0.90),max(x)*1.1,length.out=6))
}

x1 <- rnorm(9,10,1);
y1 <- rep(1:3,3)
z1 <- rep(c("A","B","C"),each=3)
se1 <- x1*0.05

xyzplot(x=x1,y=y1,z=z1,se=se1,ebar=1)
