price_data <- df %>%
  mutate(
    bin = case_when(
      is.na(Price) ~ NA_character_,
      Price <= 100 ~ "0 - 100",
      Price <= 200 ~ "100-200",
      Price <= 500 ~ "200-500",
      Price <= 1000 ~ "500-1,000",
      Price > 1000 ~ "1,000+",
    )
) %>%
  filter(!is.na(bin)) %>%
  mutate(bin = factor(bin, levels = c("0 - 100", "100-200", "200-500", "500-1,000", "1,000+")))

levels(price_data$bin)

ggplot(price_data, aes(x = bin)) +
  geom_histogram(
    stat = "count",
    color = "black",
    linewidth=0.3,
    fill = "lightskyblue1",
    width=1,
    ) +
  ggtitle("Mission prices") +
  labs(x="Price in millions of USD", y="Count") +
  theme_ipsum()

