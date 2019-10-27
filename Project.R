# Data Visualization Project

# load data&library
df <- read.csv('Economist_Data.csv')
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



