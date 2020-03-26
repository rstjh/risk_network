#enable ability to clone packages from github.
install.packages("devtools")
install.packages("usethis")
library("usethis")
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

# Load nodes data from CSV
nodeData <- read.csv("~/github-repositories/risk_network/ORG-NODES.csv", header = TRUE)
nodes <- as.data.frame(nodeData)

# Load edges from CSV
edgeData <- read.csv("~/github-repositories/risk_network/ORG-EDGES.csv", header = TRUE)
edges <- as.data.frame(edgeData)

# Create graph for Louvain Community Detection (LCD)
# https://arxiv.org/pdf/0803.0476.pdf

visNetwork(nodes, edges, height = "500px", width = "100%" ) %>% visPhysics(stabilization = TRUE) %>% visOptions(highlightNearest = TRUE) %>%  visOptions(nodesIdSelection = TRUE) %>% visLegend() %>% visOptions(manipulation = TRUE)
network <- visNetwork(nodes, edges)
#visSave(network, file = "network.html", background = "white")
visExport(network, type = "png", name = "network")
