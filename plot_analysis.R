getwd()
library(ggplot2)
library(dplyr)

#1.
data(Orange)

head(Orange)

#2.
na_check <- any(is.na(Orange))
if (!na_check) {
  print("No NA values are present in the dataset.")
} else {
  print("NA values are present in the dataset.")
}

#3.
ggplot(Orange, aes(x = age, y = circumference, color = as.factor(Tree))) +
  geom_point(size = 3) +
  geom_line() +
  labs(
    title = "Tree Growth: Age vs Circumference",
    x = "Age (days)",
    y = "Circumference (mm)",
    color = "Tree ID"
  ) +
  theme_minimal()


ggplot(Orange, aes(x = as.factor(Tree), y = circumference, fill = as.factor(Tree))) +
  geom_boxplot() +
  labs(
    title = "Distribution of Circumference by Tree",
    x = "Tree ID",
    y = "Circumference (mm)",
    fill = "Tree ID"
  ) +
  theme_minimal()

#4.
avg_circumference <- Orange %>%
  group_by(Tree) %>%
  summarise(avg_circum = mean(circumference))

print(avg_circumference)

Orange_new <- Orange %>%
  mutate(circumference_cm = circumference / 10)

head(Orange_new)
