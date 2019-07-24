table=read.csv("E:/project/crimes.csv")
View(table)
number_of_rapes=table %>% summarise(number_of_rapes = sum(Rape))
head(number_of_rapes)
data2=table %>% group_by(STATE.UT,DISTRICT) %>%  summarise(number_of_rapes = max(sum(Rape)))
print(data2)
df=data.frame(data2)
print(df)
rape_min=df[which.min(df$number_of_rapes), ]
rape_max=df[which.max(df$number_of_rapes), ]

print(rape_min)
print(rape_max)
