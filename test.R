library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)
dbListFields(MyDataBase, 'City')
DataDB <- dbGetQuery(MyDataBase, "select * from City")
class(DataDB)
dim(DataDB)
head(DataDB)

pop.mean <- mean(DataDB$Population)  # Media a la variable de población
pop.mean 

pop.3 <- pop.mean *3   # Operaciones aritméticas
pop.3

library(dplyr)
pop50.mex <-  DataDB %>% filter(CountryCode == "MEX" ,  Population > 50000)   # Ciudades del país de México con más de 50,000 habitantes

head(pop50.mex)

unique(DataDB$CountryCode)   # Países que contiene la BDD