
#=====================================================================================
rap_crime=table %>% summarise(rap_crime = sum(Rape))
kidnap_crime=table %>% summarise(kidnap_crime = sum(Kidnapping.and.Abduction))
dowry_crime=table %>% summarise(dowry_crime = sum(Dowry.Deaths))
assult_crime=table %>% summarise(assult_criupme = sum(Assault.on.women.with.intent.to.outrage.her.modesty))
insult_crime=table %>% summarise(insult_crime = sum(Insult.to.modesty.of.Women))
by_rel_crime=table %>% summarise(by_rel_crime = sum(Cruelty.by.Husband.or.his.Relatives))
imp_crime=table %>% summarise(imp_crime = sum(Importation.of.Girls))
all_crimes=c(rap_crime,kidnap_crime,dowry_crime,assult_crime,insult_crime,by_rel_crime,imp_crime)
tr_crimes=as.numeric(paste(all_crimes))
header=c("Rape","Kidnapping.and.Abduction","Dowry.Deaths","Assault.on.women.with.intent.to.outrage.her.modesty","Insult.to.modesty.of.Women","cruelty.by.Husband.or.his.Relatives","Importation.of.Girls")
my_tree=cbind(header,tr_crimes)
df=data.frame(header,tr_crimes)
str(df)
transform(df,all_crimes=as.numeric(all_crimes))
str(df)
print(df)
treemap(df,index = "header",vSize = "tr_crimes",type = "index",fontface.labels = 4,bg.labels = "transparent",title = "treemap about all crimes",title.legend = "tr_crimes")

#==========================================================================


# Data Prep
data("mtcars")  # load data
mtcars$`car name` <- rownames(mtcars)  # create new column for car names
mtcars$mpg_z <- round((mtcars$mpg - mean(mtcars$mpg))/sd(mtcars$mpg), 2)  # compute normalized mpg
mtcars$mpg_type <- ifelse(mtcars$mpg_z < 0, "below", "above")  # above / below avg flag
mtcars <- mtcars[order(mtcars$mpg_z), ]  # sort
mtcars$`car name` <- factor(mtcars$`car name`, levels = mtcars$`car name`)  # convert to factor to retain sorted order in plot.

# Diverging Barcharts
ggplot(mtcars, aes(x=`car name`, y=mpg_z, label=mpg_z)) + 
  geom_bar(stat='identity', aes(fill=mpg_type), width=.5)  +
  scale_fill_manual(name="Mileage", 
                    labels = c("Above Average", "Below Average"), 
                    values = c("above"="#00ba38", "below"="#f8766d")) + 
  labs(subtitle="Normalised mileage from 'mtcars'", 
       title= "Diverging Bars") + 
  coord_flip()
#===============================================================================
library(ggplot2)
theme_set(theme_bw())  


library(dplyr)
library(ggplot2)
table=read.csv("E:/project/crimes.csv")
View(table)
#all_crimes=table %>% summarise(all_crimes= sum(Rape))
#head(number_of_rapes)
data2=table %>% group_by(STATE.UT)  %>% summarise(all_crimes=sum(Rape,Kidnapping.and.Abduction,Dowry.Deaths,Assault.on.women.with.intent.to.outrage.her.modesty,Insult.to.modesty.of.Women,Cruelty.by.Husband.or.his.Relatives,Importation.of.Girls))
print(data2$STATE.UT)
data=data.frame(data2)
data$DISTRICT = rownames(data)
data$avg = round((data$all_crimes - mean(data$all_crimes))/sd(data$all_crimes),2)
data$chart_type = ifelse(data$avg < 0,"below","above")
data=data[order(data$avg),]
#data$`DISTRICT` = factor(data$`DISTRICT`,levels = data$`DISTRICT`)

ggplot(data,aes(x=DISTRICT,y=avg))+
  geom_bar(stat = 'identity',aes(fill=chart_type),width = 0.5)+
  scale_fill_manual(name="crimes",labels=c("above avg","below avg"),
                    values = c("above"="#00ba38","below"="#f8766d"))+
  labs(subtitle = "normlized crimes in ANDHRA PRADESH",
       title = "DIverging Bars")+
  coord_flip()
print(data2)
#================================================================================================================

library(dplyr)
library(ggplot2)
table=read.csv("E:/project/crimes.csv")
#View(table)
#all_crimes=table %>% summarise(all_crimes= sum(Rape))
#head(number_of_rapes)
data2=table %>% group_by(DISTRICT) %>% filter(STATE.UT == "ANDHRA PRADESH") %>% summarise(all_crimes=sum(Rape,Kidnapping.and.Abduction,Dowry.Deaths,Assault.on.women.with.intent.to.outrage.her.modesty,Insult.to.modesty.of.Women,Cruelty.by.Husband.or.his.Relatives,Importation.of.Girls))
#View(data2)
data=data.frame(data2)
data$DISTRICT = rownames(data)
avg=sum(all_crimes)/nrow(data2)
print(ag)
data$chart_type = ifelse(data$all_crimes < avg,"below","above")
data=data[order(data$chart_type),]


ggplot(data,aes(x=DISTRICT,y=all_crimes,label=all_crimes))+
  geom_bar(stat = 'identity',aes(fill=chart_type),width = 0.5)+
  scale_fill_manual(name="crimes",labels=c("above avg","below avg"),
                    values = c("above"="#00ba38","below"="#f8766d"))+
  labs(subtitle = "normlized crimes in ANDHRA PRADESH",
       title = "DIverging Bars")+
  coord_flip()

