### 制作了一个金字塔图 ###
# data数据是假想的人口统计一组数
# string数据对应的不同部落的数据 
mypyramid=function(data,string) { 
  plot(0,type='n',xlab='',ylab='',axes=F,xlim=c(-1.5,1.5),ylim=c(0,1)) 
  data=data[order(data[,1]),] 
  for(i in 1:dim(data)[1]) { 
    segments(-1.2,1-1/dim(data)[1]/2-1/dim(data)[1]*(i-1),1.2, 
    1-1/dim(data)[1]/2-1/dim(data)[1]*(i-1),lty=2) 
    rect(-data[i,1]/max(data),1-1/dim(data)[1]*i,data[i,2]/max(data), 
    1-1/dim(data)[1]*(i-1),col='white') 
    text(-1.2,1-1/dim(data)[1]/2-1/dim(data)[1]*(i-1),string[i,1],adj=1) 
    text(1.2,1-1/dim(data)[1]/2-1/dim(data)[1]*(i-1),string[i,2],adj=0) 
  } 
  label=strsplit(as.character(round(max(data),0)),'') 
  num=10^length(label[[1]][-1])*as.numeric(label[[1]][1]) 
  s=num/max(data) 
  axis(1,at=seq(-s,s,len=5),labels=abs(seq(-num,num,len=5)),max(data)) 
  abline(v=0,col='gray')
  title("人口金字塔图") 
}
data <- cbind(rnorm(175,10,15),rnorm(160,10,15)) 
string <- data.frame(man=paste('man',1:15,sep=''),men=paste('women',1:15,sep='')) 
mypyramid(data,string)