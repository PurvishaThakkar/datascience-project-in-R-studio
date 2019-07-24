library(dplyr)
library(ggplot2)
table=read.csv("E:/project/crimes.csv")
View(table)
number_of_Insult.to.modesty.of.Womens=table %>% summarise(number_of_Insult.to.modesty.of.Womens = sum(Insult.to.modesty.of.Women))
head(number_of_Insult.to.modesty.of.Womens)
data2=table %>% group_by(STATE.UT) %>%  summarise(number_of_Insult.to.modesty.of.Womens = sum(Insult.to.modesty.of.Women))
View(data2)


#========================ggplot of the data which is grouped by STATES for Insult.to.modesty.of.Women case.=======================
IrisPlot <- ggplot(data2, aes(data2$number_of_Insult.to.modesty.of.Womens,data2$STATE.UT,label=data2$number_of_Insult.to.modesty.of.Womens)) + geom_point() +geom_text(hjust=0.1,vjust=1)
print(IrisPlot)


