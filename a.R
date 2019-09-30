library(tidyverse)
library(gridExtra)

# Set global ggplot theme
theme_set(theme_light())

# Set seed for reproducibility 
set.seed(1972)

# generate data
alignData <- tibble(
  x = factor(c(1:6)),
  x_lab = c("Long label one", "Long label two", "Long label three","Long label one", "Long label two", "Long label three"),
  y = c(2, 1, 1.14, 1.4, 1.2, 1.7),
  low = c(1, 0.2, 0.5, 1.1, 0.5, 1.1),
  hi = c(3, 2, 4, 2.4, 2, 3.3))



a <- alignData %>%
  ggplot(aes(
    x = x,
    y = y,
    ymin = low,
    ymax = hi
  )) +
  geom_point(size = 7) +
  geom_linerange(size = 1) +
  theme(
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank()
  ) +
  ggtitle("Horizontal")


b <- alignData %>% 
  ggplot(aes(
    x = x,
    y = y,
    ymin = low,
    ymax = hi
  )) +
  geom_point(size = 7) +
  geom_linerange(size = 1) +
  coord_flip() +
  theme(
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  ) +
  ggtitle("Vertical")

# plot side by side
grid.arrange(a, b, nrow = 1)
