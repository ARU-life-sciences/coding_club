# clean up the microplastics data

mp <- read.csv(
  "./Wu_et_al_2024_Spatial_distribution_of_small_microplastics_in_the_Norwegian_Coastal_Current.csv", 
  na.strings = c("-", "-"),
)

# Concentrations of small microplastics varied, notably higher in surface seawater.
