library(dplyr)
library(ggplot2)
table=read.csv("E:/project/crimes.csv")
View(table)
number_of_Assault.on.women.with.intent.to.outrage.her.modestys=table %>% summarise(number_of_Assault.on.women.with.intent.to.outrage.her.modestys = sum(Assault.on.women.with.intent.to.outrage.her.modesty))
head(number_of_Assault.on.women.with.intent.to.outrage.her.modestys)
data2=table %>% group_by(STATE.UT) %>%  summarise(number_of_Assault.on.women.with.intent.to.outrage.her.modestys = sum(Assault.on.women.with.intent.to.outrage.her.modesty))
View(data2)


#========================ggplot of the data which is grouped by STATES for Assault.on.women.with.intent.to.outrage.her.modesty case.=======================
IrisPlot <- ggplot(data2, aes(data2$number_of_Assault.on.women.with.intent.to.outrage.her.modestys,data2$STATE.UT,label=data2$number_of_Assault.on.women.with.intent.to.outrage.her.modestys)) + geom_point() +geom_text(hjust=0.1,vjust=1)
print(IrisPlot)

