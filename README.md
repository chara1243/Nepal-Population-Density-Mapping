# Nepal Population Density Mapping

## Project Overview

This project uses R and geospatial data to visualize population density across Nepal using WorldPop gridded population data.

The analysis uses raster processing, spatial masking, and thematic mapping to generate population density maps.

## Objectives

- Map population density across Nepal.
- Clip population raster data to the Nepal administrative boundary.
- Classify population density into different categories.
- Generate high-resolution thematic maps.

## Software and Packages

- R
- terra
- sf
- ggplot2
- dplyr

## Data Requirements

1. Nepal administrative boundary shapefile.
2. WorldPop population density raster.

Place the input files inside the `data/` directory.

## Repository Structure

```text
Nepal-Population-Density-Mapping/
│
├── data/
│   ├── nepal.shp
│   ├── nepal.shx
│   ├── nepal.dbf
│   ├── nepal.prj
│   └── nepal_population.tif
│
├── output/
│
├── Nepal_Population_Density.R
├── README.md
└── .gitignore
```

## Installation

Install the required R packages:

```r
install.packages(c(
  "terra",
  "sf",
  "ggplot2",
  "dplyr"
))
```

## Running the Analysis

1. Clone or download this repository.
2. Place the required spatial datasets inside the `data/` directory.
3. Open `Nepal_Population_Density.R` in RStudio.
4. Run the script.
5. Find the generated maps inside the `output/` directory.

## Outputs

- `nepal_population_density.png`
- `nepal_population_density1.png`

## Data Source

WorldPop population datasets.

https://www.worldpop.org/

## License

MIT License (subject to the licensing conditions of the input datasets).
