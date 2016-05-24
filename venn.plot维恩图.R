#安装gplots包
#install.packages("gplots")
#载入gplots包
library(gplots)
oneName <- function() paste(sample(LETTERS,5,replace=TRUE),collapse="")
geneNames <- replicate(1000, oneName())
GroupA <- sample(geneNames, 400, replace=FALSE)
GroupB <- sample(geneNames, 750, replace=FALSE)
GroupC <- sample(geneNames, 250, replace=FALSE)
GroupD <- sample(geneNames, 300, replace=FALSE)
input  <-list(GroupA,GroupB,GroupC,GroupD)
venn(input)

#安装venneuler包
#install.packages("venneuler")
#如果遇到rJava安装失败的问题，Ubuntu用户尝试可以通过以下方式解决
#sudo apt-get install r-cran-rjava
#载入venneuler包
library(venneuler)

m <- data.frame(elements=c("1","2","2","2","3"), sets=c("A","A","B","C","C"))
v <-  venneuler(m)
plot(v)

m <- as.matrix(data.frame(A=c(1.5, 0.2, 0.4, 0, 0), B=c(0  , 0.2, 0  , 1, 0), C=c(0  , 0  , 0.3, 0, 1)))
# without weights
v <-  venneuler(m > 0)
plot(v)
# with weights
v <-  venneuler(m)
plot(v)

#安装VennDiagram包
#install.packages("VennDiagram")

#载入VennDiagram包
library(VennDiagram)
venn.diagram(list(A=1:10,B=3:8,C=6:9), fill=c("red","green","blue"), 
             alpha=c(0.5,0.5,0.5), cex=2, cat.fontface=4, fontfamily=3, filename="VennDiagram.tiff")
