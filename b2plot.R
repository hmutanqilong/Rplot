
b2plot <- function(xx=xx1) {
  nc <- ncol(xx)
  par(mfrow = c(nc, nc))#,mai=c(0.1,0.5,0.2,0.5))
  for (i in 1:nc) {
    for (j in 1:nc) {
      if (i>=j) {plot(1:10,1:10,col="white"),xlab="",ylab=""}
      else {
        plot(xx[,i],xx[,j],pch=19)
        abline(h=-log10(0.05),v=-log10(0.05),col=2,lty=2)
      }
    }
  }
}

xx1 <- cbind(rbmi1,rbmi2,rins1,rins2)
dim(xx1)
pdf("temp.pdf")
b2plot(-log10(xx1))
dev.off()
