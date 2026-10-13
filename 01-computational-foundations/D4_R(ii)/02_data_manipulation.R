# install pakages
install.packages("pak")
pak::pkg_install("tidyverse")

# load pakage
library(tidyverse)

# import data
data<-read.csv("data/annotations_ahb.csv")
# built in dataset
data()

penguins_data <- penguins

# data exploration
head(penguins_data, n=10)
tail(penguins_data, n=10)
names(penguins_data)
# dimension
dim(penguins_data)
nrow(penguins_data)
ncol(penguins_data)

# Sampling
sample(penguins_data)
sample_n(penguins_data,20)
sample_frac(penguins_data, .20)

# missing values
is.na(penguins_data)
sum(is.na(penguins_data))
colSums(is.na(penguins_data))

# Duplicate
duplicated(penguins_data)
sum(duplicated(penguins_data))

# Data manipulation
# dplyr_function(data, do_something)

# 1. select columns (subset column)
# - select single column
# - select multiple columns
# - select range of columns
select(penguins_data, sex)
select(penguins_data, species, sex)
select(penguins_data, 1:4)
select(penguins_data, c(1,3,5))

# 2. filter rows
# - filtering data based on criteria
body_3000 <- filter(penguins_data, body_mass > 3000)
penguins_male_data <- filter(penguins_data, sex == "male")

# 3. Creating new Column
new_data <- mutate(penguins_data, status = ifelse(body_mass > 4050, "high", "low"))

# P pipe operator ( |> , CLT+SHIFT+M): chaining method
# Step 1. select
select_columns <- select(penguins_data, species, sex, body_mass)
# Step 2. Filter 
filter(select_columns, body_mass > 4000)

# Chaining Method
penguins_data |> 
  select(species, sex, body_mass) |> 
  filter(body_mass > 4000)

# AND
and_data <- penguins_data |>
  select(species, sex, body_mass) |>
  filter(sex == "male" & body_mass > 4000)

# OR
or_data <- penguins_data |>
  select(species, sex, body_mass) |>
  filter(sex == "male" | body_mass > 4000)

# Data summary
glimpse(penguins_data)

summary(penguins_data)
