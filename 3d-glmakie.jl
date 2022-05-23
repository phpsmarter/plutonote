### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ 94e189e0-d4cf-11ec-20f5-c59770b3e5a0
begin
	using GLMakie,CairoMakie.GeometryBasics
	GLMakie.activate!()

    fig = Figure(resolution = (800, 800), fontsize = 14,lightposition = Vec3f(0, 0, 0.8), ambient = Vec3f(0.6, 0.6, 0.6),
        backlight = 2.0f0)
    azimuth = 0.1pi
    elevation = 0.1pi
    xs = LinRange(0, 10, 100)
    ys = LinRange(0, 10, 100)
    zs = [cos(x) * sin(y) for x in xs, y in ys]
    ax = Axis3(fig[1,1],elevation = elevation, azimuth = azimuth)
    tspan=LinRange(0, 2*π, 100)
	r=radius=4
	x1(t)=0
	y1(t)=radius*cos(t)
	z1(t)=radius*sin(t)
	x2(t)=radius*cos(t)
	y2(t)=radius*sin(t)
	z2(t)=0
	xs1=x1.(tspan)
	ys1=y1.(tspan)
	zs1=z1.(tspan)
	xs2=x2.(tspan)
	ys2=y2.(tspan)
	zs2=z2.(tspan)
	
	lines!(xs1,ys1,zs1)
	lines!(xs2,ys2,zs2)
	fig
    
end

# ╔═╡ Cell order:
# ╠═94e189e0-d4cf-11ec-20f5-c59770b3e5a0
