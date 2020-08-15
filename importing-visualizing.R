## SETUP
getwd()

library(readxl)
library(tidyverse)
library(grid)
library(gridExtra)
library(ggplot2)

## DATA IMPORT & DISPLAY

# DATA IMPORT
data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv")

# DISPLAY
data
head(data)
glimpse(data)
options(dplyr.width = Inf)
data$COUNTRY

# CREATE SMALL DATA
smalldata <- data[order(data$'GDP..BILLIONS.', decreasing = TRUE),][1:20,]

# CREATE PLOTS
s <- smalldata %>% 
  ggplot()+
  geom_bar(mapping=aes(x=COUNTRY, y=GDP..BILLIONS., fill = GDP..BILLIONS.), stat = 'identity') + 
  coord_flip() +
  ylab("GDP ($, billions)") +
  xlab('Country') +
  ggtitle('Top 30 GDP by Country in 2014') +
  theme(
    plot.title = element_text(color="red", size=14, face="bold.italic"),
    axis.title.x = element_text(color="blue", size=14, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )

p <- smalldata %>% 
  ggplot()+
  geom_bar(mapping=aes(x=reorder(COUNTRY, GDP..BILLIONS.), y=GDP..BILLIONS., fill = GDP..BILLIONS.), stat = 'identity') +
  coord_flip() +
  ylab("GDP ($, billions)") +
  xlab('Country') +
  ggtitle('Top 30 GDP by Country in 2014') +
  theme(
    plot.title = element_text(color="red", size=14, face="bold.italic"),
    axis.title.x = element_text(color="blue", size=14, face="bold"),
    axis.title.y = element_text(color="blue", size=14, face="bold")
  )


