info1 <- data_info[c(2:50,52:63),] 
pdf("temp.pdf")
for (i in 1:nrow(info1)) {
  if (info1$format[i]=="N") boxplot(mdata[,info1$var[i]]~mdata$path2,outline=F,
                                    main=paste0(info1$var[i],"\n") )
}

dev.off()


p <- ggplot(aes(x=path2, fill=GENDER), data=mdata)
p + geom_bar(position='fill') + 
  scale_fill_discrete("Legend Title") + 
  labs(x="X Label", y="Y Label", title="An Example Stacked Column Percentage Chart")