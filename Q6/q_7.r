table=read.csv("E:/project/crimes.csv")
data2=table %>% group_by(Year) %>% summarise(all_crimes=sum(Rape,Kidnapping.and.Abduction,Dowry.Deaths,Assault.on.women.with.intent.to.outrage.her.modesty,Insult.to.modesty.of.Women,Cruelty.by.Husband.or.his.Relatives,Importation.of.Girls))
#View(data2)
data=data.frame(data2)
print(data2)
x=(data2$Year)
y=(data2$all_crimes)
plot(x,y,type = "o",col="red",xlab = "YEAR",ylab = "CRIMES",main = "CHART ABOUT YEARLY CRIME REPORT")

