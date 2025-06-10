install.packages("tidyverse")
library(tidyverse)
library(lubridate) 

netflix <- read_csv("netflix_titles.csv")

# Filtrar apenas filmes
filmes <- netflix %>%
  filter(type == "Movie", !is.na(listed_in))

# Separar múltiplos gêneros por vírgula
generos <- filmes %>%
  separate_rows(listed_in, sep = ", ") %>%
  count(listed_in, sort = TRUE) %>%
  top_n(10, n)

# Gráfico de barras
ggplot(generos, aes(x = reorder(listed_in, n), y = n)) +
  geom_col(fill = "aquamarine") +
  coord_flip() +
  labs(
    title = "Top 10 Gêneros de Filmes na Netflix",
    x = "Gênero",
    y = "Quantidade"
  ) +
  theme_minimal()

