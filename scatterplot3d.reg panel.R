library(scatterplot3d)
data(trees)
attach(trees)

o <- order(trees$Volume)
myplot <- scatterplot3d(Girth, Height, Volume, type="h", angle=60)
model <- lm(Volume ~ Girth + Height)
myplot$plane3d(model,col=2)
