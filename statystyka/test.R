library("ggplot2")
library("dplyr")
library("ggpubr")

dane <- read.csv(file= "MZM.csv", header=T, sep=";");

p1 <- ggplot() +
  geom_point(data=dane, mapping=aes(x=data, y=razem, colour="blue"), alpha=.5, size=2) +  geom_point(data=dane, mapping=aes(x=data, y=krajowi, colour="green"), alpha=.5, size=2) +  
  ylab(label="sales [ths]") +
  theme(legend.title=element_blank()) 

p2 <- ggplot() +
geom_line(data=dane, mapping=aes(x=as.Date(data), 
   y=razem, colour="blue"), alpha=.5, size=2) +  
geom_line(data=dane, mapping=aes(x=as.Date(data), y=krajowi, colour="green"), alpha=.5, size=2) +  
  ylab(label="sales [ths]") +
  theme(legend.title=element_blank()) 

ggarrange(p1, p2, ncol = 2, nrow = 1)
