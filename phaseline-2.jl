### A Pluto.jl notebook ###
# v0.19.0

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 84388088-c42d-11ec-249b-4db2ebc98d5b
begin
	using  CairoMakie, ForwardDiff,PlutoUI,ForwardDiff
	import PlutoUI:Slider
    
end

# ╔═╡ 67be87c3-ccaa-4c54-94c0-be6a24471043
function phaseline(xr,yr,us,vs)
	     strength = vec(sqrt.(us .^2 .+ vs .^2))
	     cmap = :gnuplot
	    fig = Figure(resolution = (600, 400))
	    ax = Axis(fig[1,1], xlabel = "x", ylabel = "y", aspect = DataAspect())
	    arrows!(ax, xr, yr, us, vs, arrowsize = 10, lengthscale = 0.1,
	        arrowcolor = strength, linecolor = strength, colormap = cmap)
	    Colorbar(fig[1,2], limits =(minimum(strength), maximum(strength)),
	        nsteps =100, colormap = cmap, ticksize=15, width = 15, tickalign=1)
	    limits!(ax, -4,4,-4,4)
	    colsize!(fig.layout, 1, Aspect(1, 1.0))
   return fig
end

# ╔═╡ 3f51d43c-921b-407a-96f6-a1984c88ab79
function vectorfileds(xr,yr,us,vs) # 和上面的函数其实一样
	     strength = vec(sqrt.(us .^2 .+ vs .^2))
	     cmap = :gnuplot
	    fig = Figure(resolution = (600, 400))
	    ax = Axis(fig[1,1], xlabel = "x", ylabel = "y", aspect = DataAspect())
	    arrows!(ax, xr, yr, us, vs, arrowsize = 10, lengthscale = 0.5,
	        arrowcolor = strength, linecolor = strength, colormap = cmap)
	    Colorbar(fig[1,2], limits =(minimum(strength), maximum(strength)),
	        nsteps =100, colormap = cmap, ticksize=15, width = 15, tickalign=1)
	    limits!(ax, -4,4,-4,4)
	    colsize!(fig.layout, 1, Aspect(1, 1.0))
   return fig
end

# ╔═╡ 923f3a66-fc41-4672-b0da-40b7c720c593
function vectorfileds2(xr,yr,us,vs) # 去掉强度
	    
	     cmap = :gnuplot
	    fig = Figure(resolution = (600, 400))
	    ax = Axis(fig[1,1], xlabel = "x", ylabel = "y", aspect = DataAspect())
	    arrows!(ax, xr, yr, us, vs, arrowsize = 10, lengthscale = 0.5, colormap = cmap)
	   
	    limits!(ax, -4,4,-4,4)
	    colsize!(fig.layout, 1, Aspect(1, 1.0))
   return fig
end

# ╔═╡ 36d1a402-de17-432e-b2dd-ec8880eb15c7
begin
range=-3:3
@bind p Slider(range; default=0, show_value=true)
end

# ╔═╡ 98767b85-6371-45c6-8822-48cdb25234a1
let
	f(p)=p[1]^2+2*p[2]^2
	#f1(p)=p[1]  #返回数组第一个元素,如果直接返回 0,就得到 phaseline
	fx(p)=0
	fy(p)=p[2]  #返回数组第二个元素
    xr = LinRange(p+0.0001, p+0.00011, 2)  #取极小区间
    yr = LinRange(-3, 3, 20)
    ps = [[x,y] for x in xr, y in yr]
    temp = [ForwardDiff.gradient(f, p) for p in ps] # 中间变量用于计算梯度向量
	us=fx.(temp)
	vs=fy.(temp)
    fig=phaseline(xr,yr,us,vs)
   

end

# ╔═╡ b6efecfe-5daa-419e-8a76-1bc0e77bc0e5
let
	f(p)=p[1]^2+2*p[2]^2
	#f1(p)=p[1]  #返回数组第一个元素,如果直接返回 0,就得到 phaseline
	fx(p)=0
	fy(p)=p[2]  #返回数组第二个元素
    xr = LinRange(-5, 5, 20) 
    yr = LinRange(-5, 5, 20)
    # 中间变量用于计算梯度向量
	 ps = [[x,y] for x in xr, y in yr]
	temp = [ForwardDiff.gradient(f, p) for p in ps]
	us=fx.(temp)
	vs=fy.(temp)
    fig=phaseline(xr,yr,us,vs)
   

end

# ╔═╡ 3a89db02-cf60-40d2-9066-5c399c11899e
let
	
    xspan = LinRange(-4, 4, 21)  #取极小区间
    yspan = LinRange(-4, 4, 21)
    us = [0  for x in xspan, y in yspan]  # 梯度要求导数
    vs = [cos(y)  for x in xspan, y in yspan]
    fig=vectorfileds(xspan,yspan,us,vs) 
end

# ╔═╡ a9576e89-4680-4c67-bb46-ca14de29d17e
let
	f(p)=sin(p[2])
	#f1(p)=p[1]  #返回数组第一个元素,如果直接返回 0,就得到 phaseline
	fx(p)=p[1]
	fy(p)=p[2]  #返回数组第二个元素
    xr=yr = LinRange(-4,4, 21)  #取极小区间
    ps = [[x,y] for x in xr, y in yr]
    temp = [ForwardDiff.gradient(f, p) for p in ps] # 中间变量用于计算梯度向量
	us=fx.(temp)
	vs=fy.(temp)
    fig=vectorfileds2(xr,yr,us,vs)
   

end

# ╔═╡ Cell order:
# ╟─84388088-c42d-11ec-249b-4db2ebc98d5b
# ╠═67be87c3-ccaa-4c54-94c0-be6a24471043
# ╠═3f51d43c-921b-407a-96f6-a1984c88ab79
# ╠═923f3a66-fc41-4672-b0da-40b7c720c593
# ╟─36d1a402-de17-432e-b2dd-ec8880eb15c7
# ╠═98767b85-6371-45c6-8822-48cdb25234a1
# ╠═b6efecfe-5daa-419e-8a76-1bc0e77bc0e5
# ╠═3a89db02-cf60-40d2-9066-5c399c11899e
# ╠═a9576e89-4680-4c67-bb46-ca14de29d17e
