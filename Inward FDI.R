setwd("C:\\Users\\nymos\\Dropbox\\Coding Training\\Blog Posts\\# 8")

crisis <- read.csv("Africa FDI.csv")
inflation <- crisis$US.dollars.at.current.prices.in.millions
year <- crisis$ï..Year
region <- crisis$Economy.Label
gdp <- crisis$Percentage.of.Gross.Domestic.Product

library(ggplot2)
library(scales)


inflation <- inflation / 1000
year




 
sp <- ggplot(data=crisis, aes(x=year, y=inflation, color=region)) + geom_point(shape = 21, fill = "white", size = 2.5, stroke=1.5)
sp

sp <- sp + xlab("Year") + ylab("USD in Billions") +
  ggtitle("Inward FDI to Africa by Region") +
  theme(axis.title.x = element_text(color="Red", size=20),
        axis.title.y = element_text(color="Red", size = 20),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        panel.background = element_rect(fill = "#f0f0f5", colour = "#c2c2d6", size = 2, linetype = "solid"),
        panel.grid.major = element_line(size = 0.8, linetype = 'solid',colour = "white"),
        legend.position = c(1,1),    
        legend.justification = c(1,1),
        plot.title = element_text(color="DarkRed", size = 22, family="Courier", hjust = 0.5))


sp



spx <- sp + xlab("Year") + ylab("USD in Billions") +
  ggtitle("Inward FDI to Africa by Region") +
  theme(axis.title.x = element_text(color="Red", size=20),
        axis.title.y = element_text(color="Red", size = 20),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        panel.background = element_rect(fill = "#f0f0f5", colour = "#c2c2d6", size = 2, linetype = "solid"),
        panel.grid.major = element_line(size = 0.8, linetype = 'solid',colour = "white"),
        legend.position = c(1,1),    
        legend.justification = c(1,1),
        plot.title = element_text(color="DarkRed", size = 22, family="Courier", hjust = 0.5))

spx + scale_y_continuous(labels = label_dollar())

  

