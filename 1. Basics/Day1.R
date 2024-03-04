d <- c(89,32,90,11,54)
d[-1] # all except the first
d[1:3] # element from 1 to 3
d[2] # 2nd element
length(d)

f <- 41:60
print(f)
print(f[9])
print(f[-2])
print(f[c(-2,-11,-12)])
print(f[-c(2,11,12)])

g <- c(3,5,7,12)
class(g)
g <- c(3,5,7,12,'stats')
class(g)
g <- c(3,5,7,12)
3*g+5 ## Vectorization
print(sum(g))

p <- c(1000, 10000, 50000, 25000)
n <- c(4.5, 6, 2, 3.5)
r <- c(7, 7.5, 8, 8.5)
si <- p*n*r/100
paste("Total Interest =",sum(si))
paste("Total Maturity =",sum(p) + sum(si))

a <- c(2, 4, 6, 7, 9, 11)
b <- c(3, 8, 4, 4, 5, 12)
if(length(a) != length(b)){
  print("Calc not possible")
} else {
  print(a*b)
}

###### list
suchi.r <- list(a=4,b=6,c=12,d=9, e="df")
class(suchi.r)
print(suchi.r[2])
print(suchi.r$c)
suchi.r$e

suchi.r$c <- "Box plot"
suchi.r

gdr <- c('m', 'f', 'm', 'm', 'f', 'f', 't', 'f', 't')
class(gdr)
f_gdr <- factor(gdr)
class(f_gdr)
f_gdr
as.integer(f_gdr)

f <- c(23, NA, 90, 45, NA)
is.na(f)
paste("Count of NAs =", sum(is.na(f)))

m <- matrix(c(2,3,4,5,6,7),3,2)
m
m <- matrix(c(2,3,4,5,6,7),3,2, byrow = T)
m

a <- c(3,6,8,9)
b <- 30:40
rbind(a,b)

a <- array(dim = c(4))
a[2] <- 3
a

##############################################################
setwd("C:/Training/Academy/R Course (C-DAC)/Datasets")
cars2018 <- read.csv("cars2018.csv", stringsAsFactors = T)
str(cars2018)
names(cars2018)

pizza <- read.csv("pizza.csv")
str(pizza)

diam <- read.csv2("Diamonds.csv", stringsAsFactors = T)

library(xlsx)
sales <- read.xlsx("Sales.xlsx", sheetIndex = 1)
# OR
library(readxl) # loads the package in the R environment
sales <- read_excel("Sales.xlsx", sheet = 1)

## Exporting a dataframe to a file
write.csv(sales, "sales2.csv")

###### Sub setting
m <- matrix(c(2,3,4,5,6,7),3,2, byrow = T)
m
m[2,1]
m[2,] # entire 2nd row
m[,1] # entire 1st row

dim(cars2018)
cars2018[,14] # 14th column
cars2018[2,]

cars2018$Cylinders

ss_manual <- subset(cars2018, Transmission=="Manual")
ss_ignis <- subset(cars2018, Fuel.injection=='Direct ignition' &
                             MPG > 20,
                   select = c('Model','MPG','Fuel.injection'))

