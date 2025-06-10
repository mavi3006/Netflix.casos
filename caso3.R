install.packages("tidyverse")
library(tidyverse)
library(lubridate) 

netflix <- read_csv("netflix_titles.csv")
# Limpar países
paises <- netflix %>%
  filter(!is.na(country)) %>%
  separate_rows(country, sep = ", ") %>%
  count(country, sort = TRUE) %>%
  top_n(10, n)

# Gráfico
ggplot(paises, aes(x = reorder(country, n), y = n)) +
  geom_col(fill = "pink") +
  coord_flip() +
  labs(
    title = "Top 10 Países com Mais Títulos na Netflix",
    x = "País",
    y = "Quantidade de Títulos"
  ) +
  theme_minimal()

