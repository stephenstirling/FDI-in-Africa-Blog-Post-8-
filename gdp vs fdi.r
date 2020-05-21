setwd("C:\\Users\\nymos\\Dropbox\\Coding Training\\BLOG POSTS\\# 8")
library(ggplot2)

economies <- read.csv("FDI To Use.csv")
fdi <- economies$FDI.Inflow..Adjusted.
gdp <- economies$GDP.Per.Capita
country <- economies$ï..Country


# working plot

the_plot <-  ggplot(economies, aes(x=fdi, y=gdp, label=country)) + geom_point() #+ geom_text(aes(label=country),hjust=0, vjust=0)
the_plot #+ scale_x_discrete(name ="Dose (mg)", 
       #                   limits=c("1", "1000","2000", "3000", "4000", "5000", "6000"))



# testing

countries <- country[c("Angola", "Chad")]
countries

the_plot <-  ggplot(economies, aes(x=fdi, y=gdp, label=countries)) + geom_point() + geom_text(aes(label=countries),hjust=0, vjust=0)
the_plot
