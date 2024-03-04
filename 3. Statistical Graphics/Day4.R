setwd("C:/Training/Academy/R Course (C-DAC)/Datasets")
library(ggplot2)
autoc <- read.csv("AutoCollision.csv", stringsAsFactors = T)
ggplot(data = autoc, aes(x=Severity,y=Claim_Count, color=Vehicle_Use))+
  geom_point()

ggplot(data = autoc, 
       aes(x=Vehicle_Use, y=Claim_Count,fill=Vehicle_Use))+
  geom_boxplot()

orns <- read.csv("Ornstein.csv", stringsAsFactors = T)
ggplot(data = orns, aes(x=nation, fill=sector))+
  geom_bar()
ggplot(data = orns, aes(x=nation, fill=sector))+
  geom_bar(position='dodge')

ggplot(data = orns, 
       aes(x=assets,y=interlocks,color=sector))+
  geom_point()+facet_grid(.~nation)

data("mtcars")
mtcars$gear <- factor(mtcars$gear)
ggplot(data = mtcars, aes(x=disp,y=mpg,color=gear))+
  geom_point()

#########################################
library(RMySQL)
con <- dbConnect(MySQL(),
                 user = 'root',
                 password = 'root',
                 host = 'localhost',
                 dbname = 'sakila')

dbListTables(con)
film <- dbReadTable(con, "film")
staff <- dbReadTable(con, "staff")

########### XML ###############
library(XML)
result <- xmlParse(file = "books.xml")
print(result)

rootnode <- xmlRoot(result)
print(rootnode[1])

df_book <- xmlToDataFrame("books.xml")

################ JSON ####################
library(jsonlite)
result <- read_json("Movie_Stars.json", simplifyVector = T)
print(result)
