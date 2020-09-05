# Jessica Embury
# 594 Lab 2
# San Diego County Melanoma Dataset

#set dir
setwd("C:/Users/jesse/GitProjects/GEOG594-Embury/594-lab02")

#### load required libraries
library(ggplot2)

### Read csv data into R dataframe
melanoma_data <- read.csv("data/Melanoma.csv")

### list all the field names (Variables in the dataset)
names(melanoma_data)

### Subset data by specific column
## subset only the year 2017
data_2017 <- melanoma_data[melanoma_data$Year == 2017,]

### Generate some statistics
### aggregate by region names, make pie chart showing total cases by region
totals_region <- aggregate(data_2017[, c("Total")], by=list(Region = data_2017$Region), FUN=sum, na.rm=TRUE)
colnames(totals_region)[2]  <- "Total"
print(totals_region)

### Make a visual plot ! aes: aesthetic mappings, geom_bar: rectangle bars
totals_bar <- ggplot(totals_region, aes(x=Region,y=Total)) + geom_bar(stat="identity",aes(fill= factor(Region)), width=0.5) +
ggtitle("Melanoma in San Diego by Regions (Total Cases)")+
ylab("Total Cases") +
xlab("Regions of San Deigo") +
theme(legend.position="right") +
theme(axis.text.x = element_text(angle=70, vjust=1, hjust=1))+
list()

## show the plot & save it to file
totals_bar
ggsave("output/Melanoma_Totals_barchart.png", width = 12, height = 6)

#pie chart of totals - first make barplot then convert to pie
# Barplot
barplot <- ggplot(totals_region, aes(x=" ", y=Total, fill=Region))+
geom_bar(width = 1, stat = "identity")
barplot

#pie formatting
blank_theme <- theme_minimal()+
  theme(
  axis.title.x = element_blank(),
  axis.title.y = element_blank(),
  panel.border = element_blank(),
  panel.grid=element_blank(),
  axis.ticks = element_blank(),
  plot.title=element_text(size=14, face="bold")
  )

#Convert to pie
totals_pie <- barplot + coord_polar("y", start=0) + theme_minimal() + blank_theme + ggtitle("Melanoma in San Diego by Regions (Total Cases)") 
totals_pie

#save
ggsave("output/Melanoma_Totals_piechart.png", width = 12, height = 6)
