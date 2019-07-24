library(dplyr)
library(ggplot2)
table=read.csv("E:/project/crimes.csv")
View(table)
number_of_Cruelty.by.Husband.or.his.Relatives=table %>% summarise(number_of_Cruelty.by.Husband.or.his.Relatives = sum(Cruelty.by.Husband.or.his.Relatives))
head(number_of_Cruelty.by.Husband.or.his.Relatives)
data2=table %>% group_by(STATE.UT) %>%  summarise(number_of_Cruelty.by.Husband.or.his.Relatives = sum(Cruelty.by.Husband.or.his.Relatives))
View(data2)


#========================ggplot of the data which is grouped by STATES for Cruelty.by.Husband.or.his.Relatives case.=======================
IrisPlot <- ggplot(data2, aes(data2$number_of_Cruelty.by.Husband.or.his.Relatives,data2$STATE.UT,label=data2$number_of_Cruelty.by.Husband.or.his.Relatives)) + geom_point() +geom_text(hjust=0.1,vjust=1)
print(IrisPlot)

