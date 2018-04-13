library(tidyverse)

mtcars %>% head

theme_set(theme_light())

my_ggsave <- function(plot, filename, height = 11.4, width = 11.4, units = "cm", ...){
    ggsave(filename = filename,
           plot = plot,
           height = height,
           width = width,
           units = units,
           dpi = 300,
           ...)
}

p1 <- ggplot(mtcars, aes(x = wt, y = mpg, col = as.factor(cyl))) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)

my_ggsave(p1, "scat.png")

fit <- lm(mpg ~ wt * cyl, data = mtcars)
tb1 <- stargazer(fit)
kable(tb1)


p2 <- ggplot(mtcars, aes(x = gear, y = mpg, fill = as.factor(gear))) +
  geom_boxplot()

my_ggsave(p2, "boxp.png")


mtcars$`car name` <- rownames(mtcars)  # create new column for car names
mtcars$mpg_z <- round((mtcars$mpg - mean(mtcars$mpg))/sd(mtcars$mpg), 2)  # compute normalized mpg
mtcars$mpg_type <- ifelse(mtcars$mpg_z < 0, "below", "above")  # above / below avg flag
mtcars <- mtcars[order(mtcars$mpg_z), ]  # sort
mtcars$`car name` <- factor(mtcars$`car name`, levels = mtcars$`car name`)  # convert to factor to retain sorted order in plot.

# Diverging Barcharts
p3 <- ggplot(mtcars, aes(x=`car name`, y=mpg_z, label=mpg_z)) +
  geom_bar(stat='identity', aes(fill=mpg_type), width=.5)  +
  scale_fill_manual(name="Mileage",
                    labels = c("Above Average", "Below Average"),
                    values = c("above"="#00ba38", "below"="#f8766d")) +
  labs(subtitle="Normalised mileage from 'mtcars'",
       title= "Diverging Bars") +
  coord_flip()

my_ggsave(p3, "div_bar.png")
