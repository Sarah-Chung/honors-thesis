# This script creates bar graph of the total US population, stacked bar chart

b<-read.csv("TotalUSPopulation.csv")
View(b)
b1<-data.frame(b)
colnames(b1)<-c("Year","Total_Pop","Total_Chinese","Percentage_Chinese","Total_Foreign","Percentage_Foreign")
library(tidyverse)
library(ggthemes)
library(magrittr)

b1 %>%
  ggplot(b1,mapping=aes(x=Year,y=Total_Chinese)) +
    geom_bar(stat="identity", position = "stack")+
    theme(axis.text.x = element_text(angle = 90, vjust=4))+
    labs(title = "Chinese Population in the United States (Thousands), 1840-1960",x="",y="")+
    scale_y_continuous(name = "", breaks = c(0, 50000, 100000, 150000, 200000), labels = c("0", "50", "100","150","200"))+
    scale_x_continuous(labels = b1$Year, breaks = b1$Year)+
    scale_color_colorblind()+
    geom_text(aes(label = Total_Chinese), vjust = -0.5, color = "black", size = 3)+
    theme_minimal()
