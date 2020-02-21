# install.packages("tidyverse")

library(ggplot2)












data(midwest)

ggplot(midwest, aes(x=area, y=poptotal)) + geom_point()

# create a plot variable g, in this plot, x axis is the area
# y axis is the total population of this county
# The data will be plot as individual points and a smoothing 
# function is added to see the overall trend
g <- ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point() + 
  geom_smooth(method="lm") 

plot(g)




# Zoom in without deleting the points outside the limits. 
# As a result, the line of best fit is the same as the original plot.
g1 <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))  # zooms in
plot(g1)







# Add Title and Labels
g1 + labs(title="Area Vs Population", 
          subtitle="From midwest dataset", 
          y="Population", 
          x="Area", 
          caption="Midwest Demographics")




# the full function call to create the plot 
g2 <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=1) + 
  geom_smooth(method="lm") + 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", 
       subtitle="From midwest dataset", 
       y="Population", 
       x="Area", 
       caption="Midwest Demographics")
plot(g2)




# Set color to vary based on state categories.
ggplot(midwest, aes(x=area, y=percbelowpoverty)) + 
  geom_point(aes(col=state), size=1) + 
  geom_smooth(method="lm") + 
  labs(title="Area Vs Below Poverty Percentage", 
       y="Below Poverty Percentage", 
       x="Area", 
       caption="Midwest Demographics")
plot(g3)


# Set color to vary based on state categories.
ggplot(midwest, aes(x=percbelowpoverty, y=percollege)) + 
  geom_point(aes(col=state), size=1) +
  geom_smooth(method="lm") + 
  labs(title="Below Poverty Percentage vs College Educated Percentage", 
       y="College Educated Percentag", 
       x="Below Poverty Percentage", 
       caption="Midwest Demographics")
plot(g3)


# saving th lastest plot, width and height are in inches
ggsave("population6.png", width = 8, height = 6)





