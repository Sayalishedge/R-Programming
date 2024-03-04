setwd("C:/Training/Academy/R Course (C-DAC)/Datasets")
library(dplyr)
library(tibble)

cars2018 <- read.csv("cars2018.csv", stringsAsFactors = T)
grp_trns <- group_by(cars2018, Transmission)
summarise(grp_trns, avg_mpg = mean(MPG, na.rm=T))
#OR
cars2018 %>% 
  group_by(Transmission) %>% 
  summarise(avg_mpg = mean(MPG, na.rm=T))

survey <- read.csv("survey.csv", stringsAsFactors = T)

MaleNonSmokers <- survey %>% filter(Sex=='Male' & Smoke=="Never")
PulseGT80 <-survey %>% 
              filter(Pulse>80) %>% 
              select(Sex, Exer, Smoke, Pulse)
RtHand <- survey %>% 
            mutate(survey, Ratio_Hnd=Wr.Hnd/NW.Hnd) %>% 
            select(Ratio_Hnd, Clap, Age)
DescStats <- survey %>% 
                summarise(avg_age = mean(Age, na.rm=T),
                       sd_age = sd(Age, na.rm = T))
DescGrp <- survey %>% 
              group_by(Sex) %>% 
              summarise(avg_age = mean(Age, na.rm=T),
                         sd_age = sd(Age, na.rm = T))

##############################################################

courses <- read.csv("Courses.csv", stringsAsFactors = T)
crs_sch <- read.csv("CourseSchedule.csv", stringsAsFactors = T)

crs_all <- courses %>% 
              rename(CourseCode = CourseID) %>% 
              full_join(crs_sch, by='CourseCode')
# OR
courses <- rename(courses,CourseCode = CourseID)
crs_all <- full_join(courses, crs_sch,  by='CourseCode' )

items <- read.csv("Items.csv", stringsAsFactors = T)
orders <- read.csv("Orders.csv", stringsAsFactors = T)
ord_det <- read.csv("Ord_Details.csv", stringsAsFactors = T)

item_all <- orders %>% 
              full_join(ord_det, by="Order.ID") %>% 
              full_join(items, by='Item.ID')
##########################################################
library(tidyr)
table4a
gather(table4a, `1999`, `2000`, key='Year', value='Cases')
#OR
pivot_longer(table4a, cols = c(`1999`, `2000`),
             names_to = "Year", values_to = "Cases")

table2
spread(table2, key = "type", value = "count")

df <- data.frame(Name=c("A","A","A","B","B","B"),
                 Subj=c("Phy","chem","Maths","Phy","chem","Maths"),
                 Marks=c(78,78,90,68,90,78))
df2 <- spread(df, key='Subj', value = 'Marks')
#gather(df2, c(chem ,Maths, Phy), key="Subj", value="Marks")
#OR
pivot_wider(df, names_from = "Subj", values_from = "Marks")



table3
separate(table3, rate, into = c('rate','pop'),convert = T)

comb1 <- read.csv("comb1.csv", stringsAsFactors = T)
pivot_longer(comb1, c(Highlighter,Marker,Pen,Refill),
             names_to = "ItemType", values_to = "qty")
#OR
pivot_longer(comb1, -c(District),
             names_to = "ItemType", values_to = "qty")

#########################################################
barplot(c(34,89,24,90))
pie(c(34,89,24,90),labels = c('a','b','c','d'))

barplot( table(cars2018$Transmission),
         col = 'blue', main = "Bar Chart")

hist(cars2018$Displacement)
boxplot(cars2018$Displacement)    
plot(density(cars2018$Displacement))

a <- c(2,4,6,7,8)
b <- c(34,12,10,6,4)
plot(a,b)

library(ggplot2)
ggplot(data = cars2018, aes(x=Displacement,y=MPG))+
  geom_point()
ggplot(data = cars2018, 
       aes(x=Displacement,y=MPG,color=Transmission))+
  geom_point()
ggplot(data = cars2018, 
       aes(x=Displacement,y=MPG,color=Aspiration))+
  geom_point()
ggplot(data = cars2018, 
       aes(x=Displacement,y=MPG))+
  geom_point()+facet_grid(Aspiration~.)
ggplot(data = cars2018, 
       aes(x=Displacement,y=MPG,color=Aspiration))+
  geom_point()+facet_grid(.~Aspiration)
ggplot(data = cars2018, 
       aes(x=Displacement,y=MPG,color=Aspiration))+
  geom_point()+facet_grid(Transmission~Aspiration)

ggplot(data = cars2018, 
       aes(x=Displacement,y=MPG,color=Cylinders))+
  geom_point()

coal <- read.csv("Coal Consumption.csv")
ggplot(data = coal, aes(x=Month,y=Amount))+
  geom_line()
bnk <- read.csv("bnk.csv")
ggplot(data=bnk, aes(x=Date, y=Value))+
  geom_line()

ggplot(data = cars2018, aes(x=Displacement))+
  geom_histogram(fill='darkmagenta')
print(colors())
ggplot(data = cars2018, aes(x=Displacement))+
  geom_density(fill='darkmagenta')

ggplot(data = cars2018, aes(x=Displacement,y=MPG))+
  geom_point() + geom_smooth()
ggplot(data = cars2018, aes(x=Displacement,y=MPG))+
  geom_point() + geom_smooth(method = 'lm')

ggplot(data = cars2018, aes(y=Displacement))+
  geom_boxplot(fill='darkmagenta')

ggplot(data = cars2018, aes(y=Displacement, fill=Transmission))+
  geom_boxplot()

ggplot(data = cars2018, aes(x=Transmission))+
  geom_bar(fill='pink', color='red')

ggplot(data = cars2018, aes(x=Transmission, fill=Aspiration))+
  geom_bar()
ggplot(data = cars2018, aes(x=Transmission, fill=Aspiration))+
  geom_bar(position = 'dodge')

####### Exercise #################
autoc <- read.csv("AutoCollision.csv", stringsAsFactors = T)
ggplot(data = autoc, aes(x=Severity,y=Claim_Count, color=Vehicle_Use))+
  geom_point()

ggplot(data = autoc, 
       aes(x=Vehicle_Use, y=Claim_Count,fill=Vehicle_Use))+
  geom_boxplot()
