library(ThemePark)
library(tidyverse)

d = read_csv("https://raw.githubusercontent.com/lukepilling/lukepilling.github.io/main/files/jane_twitter.csv")

cor(d$x, d$y)^2

ggplot(d, aes(x = x, y = y)) +
  geom_smooth(method = 'lm', 
              color  = barbie_theme_colors["dark"],
              fill   = barbie_theme_colors["light"]) +
  geom_point(color = barbie_theme_colors["medium"]) +
  labs(title = "",
       caption  = "R^2 = 0.0486",
       x = "x",
       y = "y") +
  xlim(c(0,1)) +
  ylim(c(0,1)) +
  theme_barbie()



