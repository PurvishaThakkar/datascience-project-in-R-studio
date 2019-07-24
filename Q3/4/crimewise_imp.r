library(dplyr)
library(ggplot2)
table=read.csv("E:/project/crimes.csv")
View(table)
number_of_Importation.of.Girlss=table %>% summarise(number_of_Importation.of.Girlss = sum(Importation.of.Girls))
head(number_of_Importation.of.Girlss)
data2=table %>% group_by(STATE.UT) %>%  summarise(number_of_Importation.of.Girlss = sum(Importation.of.Girls))
View(data2)


#========================ggplot of the data which is grouped by STATES for Importation.of.Girls case.=======================
IrisPlot <- ggplot(data2, aes(data2$number_of_Importation.of.Girlss,data2$STATE.UT,label=data2$number_of_Importation.of.Girlss)) + geom_point() +geom_text(hjust=0.1,vjust=1)
print(IrisPlot)


