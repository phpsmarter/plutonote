
using CairoMakie

x = range(0, 10, length=100)
y = sin.(x)
fig=scatter(x, y)
display(fig);