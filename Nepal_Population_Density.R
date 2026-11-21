install.packages(c("terra","sf","ggplot2","dplyr"))

library(terra)
library(sf)
library(ggplot2)
library(dplyr)

setwd("C:/Users/L E N O V O/Downloads/nepal")

nepal <- st_read("nepal.shp")

pop <- rast("nepal_population.tif")

getwd()
list.files()


nepal_vect <- vect(nepal)

pop_crop <- crop(pop, nepal_vect)

pop_mask <- mask(pop_crop, nepal_vect)



pop_df <- as.data.frame(pop_mask, xy = TRUE)

colnames(pop_df) <- c("x","y","population")

pop_df <- pop_df %>%
  filter(!is.na(population))


pop_df <- pop_df %>%
  mutate(class = case_when(
    population < 25 ~ "<25",
    population >= 25 & population < 50 ~ "25–50",
    population >= 50 & population < 100 ~ "50–100",
    population >= 100 & population < 200 ~ "100–200",
    population >= 200 ~ ">200"
  ))


map <- ggplot() +
  
  geom_raster(
    data = pop_df,
    aes(x = x, y = y, fill = class)
  ) +
  
  geom_sf(
    data = nepal,
    fill = NA,
    color = "black",
    linewidth = 0.4
  ) +
  
  scale_fill_manual(
    values = c(
      "<25" = "#9ecae1",
      "25–50" = "#a1d99b",
      "50–100" = "#ffffb2",
      "100–200" = "#fdae6b",
      ">200" = "#de2d26"
    ),
    name = "People per km²"
  ) +
  
  coord_sf() +
  
  labs(
    title = "Population Density of Nepal",
    subtitle = "WorldPop 1 km Grid",
    caption = "Source: WorldPop"
  ) +
  
  theme_minimal() +
  
  theme(
    plot.title = element_text(size=20, face="bold"),
    legend.position = "bottom"
  )

print(map)


ggsave(
  "nepal_population_density.png",
  map,
  width = 10,
  height = 8,
  dpi = 300
)












nepal_vect <- vect(nepal)

pop_crop <- crop(pop, nepal_vect)

pop_mask <- mask(pop_crop, nepal_vect)


pop_df <- as.data.frame(pop_mask, xy = TRUE)

colnames(pop_df) <- c("x","y","population")

pop_df <- pop_df %>%
  filter(!is.na(population))


# Modified population classes
pop_df <- pop_df %>%
  mutate(class = case_when(
    population < 5 ~ "<5",
    population >= 5 & population < 10 ~ "5–10",
    population >= 10 & population < 20 ~ "10–20",
    population >= 20 & population < 50 ~ "20–50",
    population >= 50 & population < 100 ~ "50–100",
    population >= 100 & population < 200 ~ "100–200",
    population >= 200 & population < 500 ~ "200–500",
    population >= 500 ~ ">500"
  ))


map <- ggplot() +
  
  geom_raster(
    data = pop_df,
    aes(x = x, y = y, fill = class)
  ) +
  
  geom_sf(
    data = nepal,
    fill = NA,
    color = "black",
    linewidth = 0.4
  ) +
  
  # Modified professional color scale
  scale_fill_manual(
    values = c(
      "<5" = "#f7fbff",
      "5–10" = "#deebf7",
      "10–20" = "#c6dbef",
      "20–50" = "#9ecae1",
      "50–100" = "#6baed6",
      "100–200" = "#fdcc8a",
      "200–500" = "#fc8d59",
      ">500" = "#d7301f"
    ),
    name = "People per km²"
  ) +
  
  coord_sf() +
  
  labs(
    title = "Population Density of Nepal",
   
    caption = "Source: WorldPop"
  ) +
  
  theme_bw() +
  
  theme(
    plot.title = element_text(size=20, face="bold", hjust=0.5),
    plot.subtitle = element_text(hjust=0.5),
    legend.position = "bottom"
  )

print(map)


ggsave(
  "nepal_population_density1.png",
  map,
  width = 10,
  height = 8,
  dpi = 600
)


