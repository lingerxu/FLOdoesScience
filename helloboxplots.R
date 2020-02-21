# install.packages("tidyverse")

library(ggplot2)
library(readr)

# read data from a csv file with correct format
sampledata <- read_csv("sampledata.csv")

# display the first fiew rows of this data frame
head(sampledata)

# plot life expectancy data grouped by continent
ggplot(sampledata,aes(x=continent, y=lifeExp, fill=continent)) +
  geom_boxplot() +
  geom_jitter(width=0.1, alpha=0.2)

