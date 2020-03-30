#enable ability to clone packages from github.
install.packages("devtools")
install.packages("usethis")
library(devtools)
install_github("datastorm-open/visNetwork")
library("visNetwork")
#Set working directory to place zip file.
library(dplyr)
#library(geomnet)
library(igraph)
setwd(dir="~/github-repositories/risk_network") 

#download zip file to directory using hte clone zip button.
download.file(url = "https://github.com/datastorm-open/visNetwork/archive/master.zip", destfile = "visNetwork-repository.zip")

#unzip file
unzip(zipfile = "visNetwork-repository.zip")

#set working directory to visnetwork-repository.
setwd(dir="~/github-repositories/risk_network/visNetwork-master/")

#Examine the files in the directory.
list.files()


