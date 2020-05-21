setwd("C:\\Users\\nymos\\Dropbox\\Coding Training\\BLOG POSTS\\# 8")
install.packages("gcookbook")
library(gcookbook)
library(ggpubr)
library(plotly)
install.packages("grid")
library(reshape2)

economies <- read.csv("World Bank Economic Indicators To Use.csv")
year <- economies$ï..Year
gdp <- economies$GDP.growth..annual...
fdi <- economies$Foreign.direct.investment..net.inflows....of.GDP.
imports <- economies$Imports.of.goods.and.services....of.GDP.
edu <- economies$Government.expenditure.on.education..total....of.GDP.

data <- data.frame(year, gdp, fdi, imports, edu)

gdpplot <-  ggplot(data, aes(x=year, y=gdp)) +
              geom_line(aes(y=gdp-.5), colour="grey50", linetype="dotted", size=.8) +
              geom_line(aes(y=gdp+.5), colour="grey50", linetype="dotted", size=.8) +
              geom_line(size =1, linetype ="solid") +
              ggsave("cairo.png", type = "cairo")  # cario is a library that smooths out the plot


#### Testing

data.long <- melt(data, id = "year", measure = c("gdp", "fdi"))
newplot <- ggplot(data.long, aes(year, value, colour = variable)) + geom_line(size=1) 


newplot2 <- newplot + geom_line(colour="grey50", linetype="dotted", size=.8) + ggsave("fdi_gdp.png", type = "cairo")

newplot3 <- newplot2 + xlab("Year") + ylab("Percentage") +
  ggtitle("FDI as a Percent of GDP") +
  theme(axis.title.x = element_text(color="Black", size=20),
        axis.title.y = element_text(color="Red", size = 20),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        legend.position = c(1,1),    
        legend.justification = c(1,1),
        plot.title = element_text(color="DarkRed", size = 15, family="Courier", hjust = 0.5),
        plot.subtitle = element_text(color = "DarkRed", size = 15, hjust = 0.4))

newplot3
        
newplot3 + scale_color_manual(name = "Variable", labels =c("GDP Growth", "FDI as a Percent of GDP"), 
                              values = c("gdp" = "#0066cc", "fdi" = "#cc0033"))  + ggsave("fdi_gdp.png", type = "cairo")

