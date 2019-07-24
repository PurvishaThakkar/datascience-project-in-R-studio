library(dplyr)
library(ggplot2)
table=read.csv("E:/project/crimes.csv")
View(table)
number_of_Kidnapping.and.Abductions=table %>% summarise(number_of_Kidnapping.and.Abductions = sum(Kidnapping.and.Abduction))
head(number_of_Kidnapping.and.Abductions)
data2=table %>% group_by(STATE.UT) %>%  summarise(number_of_Kidnapping.and.Abductions = sum(Kidnapping.and.Abduction))
View(data2)


#========================ggplot of the data which is grouped by STATES for Kidnapping.and.Abduction case.=======================
IrisPlot <- ggplot(data2, aes(data2$number_of_Kidnapping.and.Abductions,data2$STATE.UT,label=data2$number_of_Kidnapping.and.Abductions)) + geom_point() +geom_text(hjust=0.1,vjust=1)
print(IrisPlot)

