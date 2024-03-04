setwd("C:/Training/Academy/R Course (C-DAC)/Datasets")
cars2018 <- read.csv("cars2018.csv", stringsAsFactors = T)
str(cars2018)
unique(cars2018$Aspiration) # distinct values
table(cars2018$Aspiration)
table(cars2018$Recommended.Fuel)
table(cars2018$Recommended.Fuel, cars2018$Aspiration)
addmargins(table(cars2018$Aspiration, cars2018$Transmission))

######################################
marks <- c(12, 34, 20, 10, 35, 24, 15)

res = array(dim=length(marks))
i = 1
for (m in marks){
  if(m >= 16) {
    res[i] <- "Pass"
  } else {
    res[i] <- "Fail"
  }
  i <- i + 1
}
result <- ifelse(marks>=16,"Pass" ,"Fail")

## Added a column in a dataframe
cars2018$milage <- ifelse(cars2018$MPG<=40, "<=40", ">40")
table(cars2018$milage)

v <- c(NA, 23, 56, 89, 21, 99, 34, NA)
mean(v, na.rm = T)
sd(v, na.rm = T)
summary(v)

attach(cars2018)
table(Transmission)
mean(MPG)

######################################
g <- function(x){
  3*x + 5
}
g(2.3)
v <- c(NA, 23, 56, 89, 21, 99, 34, NA)
g(v)


mean_sd <- function(x) {
  m <- mean(x, na.rm = T)
  s <- sd(x, na.rm = T)
  smy <- data.frame(am = m,std_dev=s)
  smy
}

e <- mean_sd(cars2018$MPG)
class(e)

#######
data("airquality")
data("ChickWeight")

lstdf <- list(df1=airquality, df2=cars2018, df3=ChickWeight)
lstdf$df1
lstdf$df2


summary(airquality$Ozone)
summary(airquality)

library(writexl)
write_xlsx(airquality, 'air_quality.xlsx')

save.image("C:/Training/Academy/R Course (C-DAC)/1. R Programming Basics/first.RData")

load("C:/Training/Academy/R Course (C-DAC)/1. R Programming Basics/first.RData")


#############################################################
library(dplyr)
library(tibble)

class(airquality)
tbl_air <- as_tibble(airquality)
class(tbl_air)

######################################
data("mtcars")

s_mtcars <- arrange(mtcars, gear, mpg)
s_mtcars <- arrange(mtcars, cyl, desc(mpg))

select(mtcars, 1:4)
select(mtcars, mpg:wt)
select(mtcars, contains("t"))

manual <- filter(cars2018, Transmission=="Manual")

ss <- filter(cars2018, Cylinders %in% c(4,8))

s1 <- rename(cars2018, cyl = Cylinders)

summarise(cars2018, avg_mpg = mean(MPG, na.rm=T))

grp_trns <- group_by(cars2018, Transmission)
summarise(grp_trns, avg_mpg = mean(MPG, na.rm=T))

############Exercise####################
setwd("C:/Training/Academy/R Course (C-DAC)/Datasets")
library(dplyr)
library(tibble)
survey <- read.csv("survey.csv", stringsAsFactors = T)

MaleNonSmokers <- filter(survey, Sex=='Male' & Smoke=="Never")
PulseGT80 <- select(filter(survey, Pulse>80),Sex, Exer, Smoke, Pulse)
RtHand <- select(mutate(survey, Ratio_Hnd=Wr.Hnd/NW.Hnd),
                 Ratio_Hnd, Clap, Age)
DescStats <- summarise(survey, avg_age = mean(Age, na.rm=T),
                       sd_age = sd(Age, na.rm = T))
grp_sex <- group_by(survey, Sex)
DescGrp <- summarise(grp_sex, avg_age = mean(Age, na.rm=T),
                     sd_age = sd(Age, na.rm = T))
