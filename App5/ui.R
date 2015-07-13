library(shiny)
library(leaflet)
#library(rCharts)

shinyUI(fluidPage(
  titlePanel("<HKS Field Lab Tool>"),
    tabsetPanel(
      id = "inTabset", 
      tabPanel("Map", h2(" "),
        h2("Navigable Priority Map with Demo Data"),
        h5("(real addresses, fake data)"),
        h5(" "),
#        demomap
        leaflet() %>% addTiles() %>% setView(-71.033635, 42.389832, zoom = 16) %>%
          addCircleMarkers(-71.02741, 42.39079, popup = "Prop1", color = "red") %>%
          addCircleMarkers(-71.03621, 42.40008, popup = "Prop2", color = "red") %>%
          addCircleMarkers(-71.03278, 42.38852, popup = "Prop2", color = 'red') %>% 
          addCircleMarkers(-71.04795, 42.38980, popup = "Prop3", color = 'red') %>%
          addCircleMarkers(-71.04310, 42.42948, popup = "Prop4", color = 'green') %>%
          addCircleMarkers(-71.029445, 42.38865, popup = "Prop5", color = "green") %>%
          addCircleMarkers(-71.037005, 42.388851, popup = "Prop6", color = "green") %>%
          addCircleMarkers(-71.032065, 42.389005, popup = "Prop7", color = "green") %>%
          addCircleMarkers(-71.047954, 42.389797, popup = "Prop8", color = "blue") %>%
          addCircleMarkers(-71.030046, 42.38953, popup = "Prop9", color = "blue") %>%
          addCircleMarkers(-71.029973, 42.389725, popup = "Prop10", color = "blue") %>%
          addCircleMarkers(-71.034574, 42.390013, popup = "Prop11", color = "blue") %>%
          addCircleMarkers(-71.029371, 42.390026, popup = "Prop12", color = "red") %>%
          addCircleMarkers(-71.039943, 42.390398, popup = "Prop13", color = "green"),
  #        addLegend(position = "bottomright",color="blue", title = "Red = distressed", 
  #           opacity =1, labels, className="info legend")
          code("Red = Distressed",span(" | ",style="color:black"), span("Blue = Distress Likely", style = "color:blue")
               ,span(" | ",style="color:black"),span("Green = Distress Unlikely", style = "color:green")
          )),
      tabPanel("Demo Data", p("Sortable data. Click column headings for options or use 
                               the search bar under each column to track down a record."),    
          actionButton("calcRisk", "Calculate risk scores"),
          h5(" "),
          textOutput("text1"),
          h1("Sample data"),
          dataTableOutput("table1")
        ),
      tabPanel("New data", h2(" "),
        sidebarLayout(position = "right",
          sidebarPanel(
            fileInput('file2', 'Choose CSV File',
            accept=c('text/csv',
              'text/comma-separated-values,text/plain',
              '.csv.')),
            tags$hr(),
            checkboxInput('header','Header', TRUE),
            radioButtons('sep', 'Separator',
              c(Comma=',',
              Semicolon=';',
              Tab='\t'),
              ','),
            radioButtons('quote', 'Quote',
              c(None='',
              'Double Quote'='"',
              'Single Quote'="'"),
              '"')
            ),
          mainPanel(
            actionButton("calcRisk2", "Calculate risk scores"),
            h5(" "),
            h1("Uploaded data"),
            dataTableOutput("table2")
            )
         )
      ),
      tabPanel("About",h2(" "),
               sidebarLayout(position = "right",
                             sidebarPanel(
                               img(src = "DesignPhase.jpg", height = 150, width = 230),
                               h2(" "),
                               
                               img(src = "Chelsea.jpg", height = 230, width = 170),
                               h2(" "),

                               img(src = "Lawrence.jpg", height = 170, width = 230)
                             ),
                
                mainPanel(               
                h2("The Tool"),
                p("The Field Lab Tool is really a suite of methods
                  that city government employees use to make decisions
                  in a more collaborative, data-driven way. Various
                  agencies contribute data to a single platform
                  which generates the score-card, dashboard, and
                  pattern analysis output that officials use to
                  review progress. The data also drives an early-warning
                  system and visualization interface that help city task
                  forces prioritize actions and direct resources most effectively."),
                h2("Example Use"),
                p("The Problem Properties task force in City “X” meets
                  on a regular basis do discuss the status of homes
                  and other properties that have become issues for
                  the communities around them. The list of properties
                  acts as their agenda. Sometimes the home has fallen
                  into disrepair, sometimes it poses a fire hazard,
                  other times police are often called in connection
                  with complaints about the address, or the owner has
                  failed to pay taxes owed. The definition of ‘Problem
                  Property’ is ill-defined, and wide-reaching in City X.
                  As such, each week that the task force meets, new
                  properties are on the agenda—they have been added
                  by inspectors who noticed something in their rounds,
                  reported by community members, or made it onto the
                  list due to some informal rumor that a task force
                  member overheard. 
                  The vague definition and various channels that end up
                  with a property being added on the list are not intrinsically
                  problematic, but the result is a nonsystematic approach
                  to expending city resources on fixing problems. Should
                  a property be seized by the city? Should the property
                  owner be taken to court? Will a ticket in the mail 
                  suffice? Should inspectors visit and demand fire safety
                  improvements? Different situations, of course, require
                  different approaches, but without comprehensive analysis,
                  who is to say which approaches have worked best in which
                  contexts in the past? Furthermore, when a new problem 
                  property comes to the attention of the task force, 
                  what priority should it have? When a property that was 
                  previously dealt with returns to the list, how should 
                  the task force react, which method will do a better job 
                  of turning the property into a community-enhancing fixture 
                  in a sustainable, long-lasting way?
                  This task force is just one example of where city governments 
                  can improve. All too often, would-be helpful information lies 
                  in the individual siloes of different agencies. Code inspectors 
                  would benefit from police data, and the finance department 
                  could get clues on tax behavior from the planning department, 
                  and so on. Open collaboration, pooling of data, and 
                  technology-driven learning represent the biggest shortcomings 
                  and, at the same time, opportunities for city governments across the US.
                 "),
               h2("The Team"),
               p("The Innovation Field Lab is a partnership effort consisting of 
                 30 graduate students from around the world and city staff in 
                 several Massachusetts gateway cities, facilitated by a Harvard 
                 Kennedy School professor and the Mayor of Somerville.")
               ))),
        tabPanel("The Code",h2(" "),p("Built using a variety of software, made 
                                      available on the web with rstudio's shiny app language.",br(),
                                      code("need to insert github link here")

))
    )))
  

