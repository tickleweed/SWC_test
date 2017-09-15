df <- read.csv("Metadata.csv")

# which variables?
str(df) # lists variables and their object type

#start plotting
library("ggplot2")

# make first plot
ggplot (data = df, aes(x = Timepoint, y = ph )) + #only tells ggplot what you want to see, not to plot it!
geom_point()
#tell ggplot to color based on some tag --listed by colnames (df)
ggplot (data = df, aes(x = Timepoint, y = ph, fill = Reactor.cycle)) + #only tells ggplot what you want to see, not to plot it!
geom_point(shape = 21)
# right now the gradient is wrong because you only have two-- R thinks its a continuous variable
# change the reactor.cycle to afactor variable

# remove grey background
ggplot (data = df, aes(x = Timepoint, y = ph, fill = Reactor.cycle)) + #only tells ggplot what you want to see, not to plot it!
  geom_point(shape = 21) +
  theme_bw()

# add line

ggplot (data = df, aes(x = Timepoint, y = ph, fill = Reactor.cycle)) + #only tells ggplot what you want to see, not to plot it!
geom_point(shape = 21) +
theme_bw() +
geom_line() 

# store ggplot object
p1 <- ggplot (data = df, aes(x = Timepoint, y = ph,fill = Reactor.cylcle ))
p1 <- ggplot (data = df, aes(x = Timepoint, y = ph,fill = Reactor.phase))
p1 <- p1 + geom_point(shape = 21, size = 4, alpha = .5)
p2 <- p1 + theme_bw() + geom_line()

#what is inside reactor phase
df$Reactor.phase
levels(df$Reactor.phase)

p4 <- p2 + facet_grid(Reactor.phase~Reactor.cycle) #~ is also used a lot in R for other things

p4

# alternative way
p4 + geom_line()
p4 + geom_line(aes(color = Reactor.phase))
# challenge time
### right side: conductivity
### middle: diversity DO
### left cell density (me)