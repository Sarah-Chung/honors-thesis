# Plotting Number of Immigrants Arriving From China, 1840-1960
a <- read.csv("ImmigrantsByCountry.csv")
View(a)
library(ggplot2)
library(magrittr)
colnames(a)<-c("Year","Number_of_Immigrants", "Cumulative_Sum")
a1<-data.frame(a)
a1$Number_of_Immigrants <- as.numeric(a1$Number_of_Immigrants)
head(a1)

annotation <- data.frame(
  x = c(1903),
  y = c(39800),
  label = c("Chinese Exclusion Act of 1882"))

#,color="#8FC9E3" ,color="#F494AE"

a1 %>%
  ggplot(aes(Year))+
  geom_line(aes(y=Number_of_Immigrants),color="#d10061",size = 1, na.rm=TRUE)+
  #geom_line(aes(y=Cumulative_Sum/10,color = "Cumulative"), size = 1,na.rm=TRUE)+
  annotate("pointrange", x = 1882, y = 39579, ymin = 0, ymax = 0,colour = "#665756", size = 2, alpha=0.4)+
  #annotate("pointrange", x = 1943, y = 65, ymin = 0, ymax = 0,colour = "#665756", size = 2, alpha=0.4)+ # Repeal of Expulsion, 1943
  geom_label(data=annotation, aes( x=x, y=y, label=label), 
             color="#d10061", 
             size=3, fontface="bold")+
  scale_y_continuous(name = "", labels = c("0", "10,000", "20,000","30,000","40,000"))+
      #sec.axis = sec_axis(~.*10, name="Cumulative Number of Chinese Immigrants",breaks = c(0,100000,200000,300000,400000),labels=c("0", "100", "200","300","400"))) +
  theme_minimal()+
  labs(title = "Chinese Immigration to the United States (Thousands), 1840-1960",color="")

# might be more helpful to graph it against the growing chinese population in the united states?
  
  