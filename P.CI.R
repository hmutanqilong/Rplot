## 不同样本含量的95%CI的宽度
#pdf("temp.pdf")
#par(cex=1.2,font=1.5,col=1)
plot(1, xlim = c(0, nrow(rr)), ylim = c(0,60), 
  type = "n", xlab = "City", ylab = "Rate", main ="", xaxt = "n",frame = FALSE)
  for (i in 1:nrow(rr)) {	
    arrows(i, rr[i,2], i, rr[i,3], length = 0.05, angle = 90, code = 3,col=2,lwd=2)
    points(i, rr[i,1],pch=20,col=4,cex=1)
    #Sys.sleep(0.1) 
  }
axis(1,at=c(1:nrow(rr)),labels=rownames(rr),cex.axis=0.7)
#dev.off()