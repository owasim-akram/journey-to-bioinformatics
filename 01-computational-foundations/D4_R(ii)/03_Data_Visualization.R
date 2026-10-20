# install pakages
pak::pkg_install(c("ggsci", "ggthemes", "hrbrthemes"))
# Load the pakage
library(tidyverse)
library(ggsci)
library(ggthemes)
library(hrbrthemes)
# Load dataset
penguins_data <- penguins

# data visualization template
# ggplot(data, aes(x = , y = )) + geom_type()


# histogram
basic <- ggplot(penguins_data, aes(x= body_mass)) +
  geom_histogram() +
  labs(
    x = "Body_Mass",
    y = "Frequency",
    title = "Distribution of body mass",
    subtitle = "A subtitle",
    caption = " Data Source: RStudio"
  )
basic

# themes
basic + theme_economist()
basic + theme_bw()
basic + theme_ipsum_pub()

# journal color Theme
basic + scale_fill_npg()
basic + scale_fill_lancet()

# Density Plot
ggplot(penguins_data, aes(x= body_mass)) +
  geom_density()

# boxplot
ggplot(penguins_data, aes(x = sex, y = body_mass)) +
  geom_boxplot()

#bar chart
# penguins_data |>
  filter(sex != "NA") |> 
  ggplot(aes(sex)) +
    geom_bar()

# color by category or group
penguins_data |> 
  filter(sex!="NA") |> 
  ggplot(aes(body_mass, fill = sex)) +
  geom_density() +
  facet_wrap(~sex)
