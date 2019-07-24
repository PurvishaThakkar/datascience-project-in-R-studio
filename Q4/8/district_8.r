#========================normlized crime in D & N HAVELI =====================
library(ggplot2)
theme_set(theme_bw())  
library(dplyr)
library(ggplot2)
table=read.csv("E:/project/crimes.csv")
data2=table %>% group_by(DISTRICT) %>% filter(STATE.UT == "D & N HAVELI") %>% summarise(all_crimes=sum(Rape,Kidnapping.and.Abduction,Dowry.Deaths,Assault.on.women.with.intent.to.outrage.her.modesty,Insult.to.modesty.of.Women,Cruelty.by.Husband.or.his.Relatives,Importation.of.Girls))
#View(data2)
data=data.frame(data2)
print(data2)
data$avg = round((data$all_crimes - mean(data$all_crimes))/sd(data$all_crimes),2)
data$chart_type = ifelse(data$avg < 0,"below","above")
data=data[order(data$avg),]

ggplot(data,aes(x=DISTRICT,y=avg))+
  geom_bar(stat = 'identity',aes(fill=chart_type),width = 0.5)+
  scale_fill_manual(name="crimes",labels=c("above avg","below avg"),
                    values = c("above"="#00ba38","below"="#f8766d"))+
  labs(subtitle = "normlized crimes in D & N HAVELI",
       title = "DIverging Bars")+
  coord_flip()

