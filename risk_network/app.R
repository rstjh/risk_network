require(shiny)
require(visNetwork)
require(magrittr)
require(dplyr)

# Load nodes data from CSV
nodeData <- read.csv("~/github-repositories/risk_network/ORG-NODES.csv", header = TRUE)
nodes <- as.data.frame(nodeData)

# Load edges from CSV
edgeData <- read.csv("~/github-repositories/risk_network/ORG-EDGES.csv", header = TRUE)
edges <- as.data.frame(edgeData)



ui <- fillPage(
    titlePanel("Risk Assessment - Cyber Topology"),
    #create two tabs
    tabsetPanel(id="theTabs", 
                #Add the Cyber Assets Tab.
               tabPanel("Cyber Assets", tableOutput("AssetList"), value = "table"),
                #Add the Risk View topography Tab.
               tabPanel("Risk View", visNetworkOutput("network_proxy_nodes"), value = "network_proxy_nodes")
                ))

server <- function(input, output) {

#Create a reactive variable.
network <- reactive({nodes %>% select(label, group, group.label)
})

#Fill the reactive variable.
output$AssetList = renderTable({
    network()
})

  output$network_proxy_nodes <- renderVisNetwork({
                                visNetwork(nodes, edges) %>% visPhysics(stabilization = TRUE) %>% visOptions(highlightNearest = TRUE) %>%  visOptions(nodesIdSelection = TRUE) %>% visLegend() %>% visOptions(manipulation = TRUE)
                                })
}

shinyApp(ui = ui, server = server) 
