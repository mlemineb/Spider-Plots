# Load the fmsb library
library(fmsb)

# Create data for the job roles with hypothetical skill proficiency values
# Make sure to transpose the matrix so that rows are job roles and columns are skills
data <- as.data.frame(matrix( 
  c(
    80, 70, 65, 70, 70, 60, 60, 50, 75, # Data Scientist
    90, 50, 50, 70, 70, 50, 50, 50, 90, # Business Scientist
    50, 80, 80, 80, 90, 60, 55, 85, 50, # ML Engineer
    50, 70, 70, 60, 80, 90, 80, 70, 50, # NLP Engineer
    60, 60, 70, 60, 80, 60, 90, 70, 50, # C.V. Engineer
    70, 70, 50, 90, 75, 75, 70, 50, 60  # Research Scientist
  ), 
  nrow=6, byrow=TRUE))

rownames(data) <- c("Data Scientist", "Business Scientist", "ML Engineer", "NLP Engineer", "C.V. Engineer", "Research Scientist")
colnames(data) <- c("Business Insights", "Data Pipelines", "ML Ops", "Stats & Modeling", "ML", "NLP", "C.V", "CI/CD", "Storytelling")

# Add the max and min values for each skill
data <- rbind(rep(100,9) , rep(0,9) , data)

# Define colors for the chart
colors_border <- c(rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9), rgb(0.3,0.5,0.7,0.9), rgb(0.5,0.7,0.2,0.9), rgb(0.6,0.3,0.5,0.9), rgb(0.7,0.4,0.6,0.9))
colors_in <- c(rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4), rgb(0.3,0.5,0.7,0.4), rgb(0.5,0.7,0.2,0.4), rgb(0.6,0.3,0.5,0.4), rgb(0.7,0.4,0.6,0.4))

# Split the screen in 6 parts (for 6 job roles)
par(mar=rep(2, 4))
par(mfrow=c(2, 3))

# Loop for each plot
for(i in 1:6){
  # Custom the radarChart!
  radarchart( data[c(1, 2, i+2), ], axistype=1, 
              
              # Custom polygon
              pcol=colors_border[i] , pfcol=colors_in[i] , plwd=4, plty=1, 
              
              # Custom the grid
              cglcol="grey", cglty=1, axislabcol="grey", axislabels=seq(0,100,20), cglwd=0.8,
              
              # Custom labels
              vlcex=1.2  # Size for skill labels
  )
  
  # Increase title size and make it bold
  title(main=rownames(data)[i+2], cex.main=2, font.main=2)
}

# Reset par to default
par(mfrow=c(1, 1))