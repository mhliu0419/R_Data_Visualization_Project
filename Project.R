# Data Visualization Project

# load data&library
df <- read.csv('~/Desktop/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training\ Exercises/Capstone\ and\ Data\ Viz\ Projects/Data\ Visualization\ Project/Economist_Assignment_Data.csv')
library(ggplot2)
library(dplyr)

df <- select(df, -1)

head(df)

# To create a scatter plot of x=CPI and y=HDI

pl <- ggplot(df, aes(x=CPI, y=HDI, color = Region)) + geom_point()
pl

# Change the points to be larger empty circles.
# use "shape = " inside the geom_point to change the point shape

pl1 <- ggplot(df, aes(x=CPI, y=HDI, color = Region)) + geom_point(size=5, shape = 1)
pl1

# Add a trend line

pl2 <- pl1 + geom_smooth(aes(group = 1))
pl2

# To edit this trend line

pl3 <- pl1 + geom_smooth(aes(group = 1), method = 'lm', formula = y ~ log(x), se = FALSE, color = 'red')
pl3

# To add text labels on the scatter points

pl4 <- pl3 + geom_text(aes(label = Country))
pl4

# To show only the selected countries label we want

selected_Country_Label <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl5 <- pl3 + geom_text(aes(label = Country), color = 'gray20',
                      data = subset(df, Country %in% selected_Country_Label),
                      check_overlap = T)
pl5

# Change theme

pl6 <- pl5 + theme_bw()
pl6


# To modify scale of Variable X, CPI, and scale of Variable Y, HDI

pl7 <- pl6 + scale_x_continuous(name = 'Corruption Perceptions Index, 2011 (10 = Least Corrupt)',
                                limits = c(0.9,10.5), breaks = 1:10)
pl7

pl8 <- pl7 + scale_y_continuous(name = 'Human Development Index, 2011 (1 = Best)',
                                limits = c(0.2,1))
pl8


# Add a title

pl9 <- pl8 + ggtitle('Corruption and Human Development')
pl9





