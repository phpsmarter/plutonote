using StatsPlots,DataFrames,RDatasets,Interact,Blink
gr(size = (600, 500))
data =dataset("datasets", "iris")

@df data corrplot(cols(1:4), grid = false)
  