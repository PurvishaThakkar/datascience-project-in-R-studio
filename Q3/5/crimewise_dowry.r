library(dplyr)
library(ggplot2)
table=read.csv("E:/project/crimes.csv")
View(table)
number_of_Dowry.Deathss=table %>% summarise(number_of_Dowry.Deathss = sum(Dowry.Deaths))
head(number_of_Dowry.Deathss)
data2=table %>% group_by(STATE.UT) %>%  summarise(number_of_Dowry.Deathss = sum(Dowry.Deaths))
View(data2)


#========================ggplot of the data which is grouped by STATES for Dowry.Deaths case.=======================
IrisPlot <- ggplot(data2, aes(data2$number_of_Dowry.Deathss,data2$STATE.UT,label=data2$number_of_Dowry.Deathss)) + geom_point() +geom_text(hjust=0.1,vjust=1)
print(IrisPlot)

