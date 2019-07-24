andh_pdshz=nrow(dataset[dataset$STATE.UT=="ANDHRA PRADESH",])
arun_padr=nrow(dataset[dataset$STATE.UT=="ARUNACHAL PRADESH",])
A&N=nrow(dataset[dataset$STATE.UT=="A & N ISLANDS",])

aggregate(dataset$Rape, by=list(state=dataset$STATE.UT), FUN=sum)
all_states=group_by(dataset$STATE.UT)

df=data.frame(aggregate(dataset$STATE.UT))
View(df)
filter(dataset,dataset$STATE.UT=="ANDHRA PRADESH")
require(sqldf)
table=read.csv("E:/project/crimes.csv")
query=sqldf('select "STATE.UT" from "table" group by "STATE.UT"')
View(query)
count_rape=sqldf('select count("Rape") from "table" group by "STATE.UT"')
View(count_rape)

barplot(dataset$STATE.UT,names.arg=dataset$count("Rape"),xlab="states",ylab="rape",col="blue",
        main="nothing",border="blue")

hist(c(34,45,45,45,4,5),xlab = "Weight",col = "yellow",border = "blue")

View(table)
library(dplyr)
number_of_rapes=table %>% summarise(number_of_rapes = sum(Rape))
head(number_of_rapes)
data2=table %>% group_by(STATE.UT) %>%  summarise(number_of_rapes = sum(Rape))
View(data2)

class(data2)
library(ggplot2)
qplot(data2$number_of_rapes,data2$STATE.UT,data = data2) + geom_point() + geom_text()

ggplot(data2,aes)

#=================================================================================
IrisPlot <- ggplot(data2, aes(data2$number_of_rapes,data2$STATE.UT,label=data2$number_of_rapes)) + geom_point() +geom_text(hjust=0.1,vjust=1)
print(IrisPlot)
#=============================================================================================
library(ggplot2)
theme_set(theme_bw())  

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
avg=sum(mtcars$mpg)/nrow(mtcars)
print(avg)
print(mtcars$mpg_z)



