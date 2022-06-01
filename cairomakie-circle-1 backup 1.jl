### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ bab76e0b-52ce-413c-a0e5-3d2d9722d78b
begin
	using CairoMakie, Makie.GeometryBasics
end


# ╔═╡ 378bca1c-d4b1-11ec-144c-ef6ccaf37a63
md"# cairomakie circle"

# ╔═╡ 2cbbc96a-2dc0-4bc5-b22b-20e5be985745
md"used for test"

# ╔═╡ 64d89c8c-8627-4559-9eda-5bb10d24d291
let
	x = range(0, 10, length=100)
	y1 = sin.(x)
	y2 = cos.(x)
	
	lines(x, y1, color = (:red,0.5))
	lines!(x, y2, color = (:blue,0.7))
	current_figure()
end

# ╔═╡ 5342e86d-1b24-4a71-8f8a-884eed7717c5
begin
	
end

# ╔═╡ Cell order:
# ╠═378bca1c-d4b1-11ec-144c-ef6ccaf37a63
# ╠═bab76e0b-52ce-413c-a0e5-3d2d9722d78b
# ╠═2cbbc96a-2dc0-4bc5-b22b-20e5be985745
# ╠═64d89c8c-8627-4559-9eda-5bb10d24d291
# ╠═5342e86d-1b24-4a71-8f8a-884eed7717c5
