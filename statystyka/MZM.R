library("ggplot2")
library("dplyr")
library("tidyr")
library("ggpubr")

dane <- read.csv(file= "MZM.csv", header=T, sep=";");

p1 <- ggplot() +
  geom_point(data=dane, mapping=aes(x=as.Date(data), 
                  y=razem, colour="blue"), alpha=.5, size=2) +  
  geom_point(data=dane, mapping=aes(x=as.Date(data), 
                      y=krajowi, colour="green"), alpha=.5, size=2) +  
  ylab(label="sales [ths]") +
  theme(legend.position="top") +
  theme(legend.title=element_blank()) 

p2 <- ggplot() +
geom_line(data=dane, mapping=aes(x=as.Date(data), y=razem, colour="blue"), alpha=.5, size=1) +  
  geom_line(data=dane, mapping=aes(x=as.Date(data), y=krajowi, colour="green"), alpha=.5, size=1) +  
  ylab(label="sales [ths]") +
  theme(legend.position="top") +
  theme(legend.title=element_blank()) 

p3 <- ggplot() +
geom_bar(data=dane, mapping=aes(x=as.Date(data), y=razem, fill="razem", stat = 'identity'), stat = 'identity', alpha=.5, size=1) +  
geom_bar(data=dane, mapping=aes(x=as.Date(data), y=krajowi, fill="krajowi", stat = 'identity'), stat = 'identity', alpha=.5, size=1) +  
  ylab(label="sales [ths]") +
  theme(legend.position="top") +
  theme(legend.title=element_blank()) 

daneC <- dane %>% gather(kat, liczba, razem:krajowi) %>% as.data.frame

daneC

p4 <- ggplot(data=daneC, aes(x=as.Date(data), y=liczba, fill=kat)) +
   geom_bar(stat = 'identity', position=position_dodge(), alpha=.5, size=1) +  
  ylab(label="sales [ths]") +
  theme(legend.position="top") +
  theme(legend.title=element_blank()) 


ggarrange(p1, p2, p3, p4, ncol = 2, nrow = 2)

