### A Pluto.jl notebook ###
# v0.17.5

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

# ╔═╡ 922d0781-b72d-45b2-95fa-4abc0b8053e2
begin
	using Plots,PlutoUI
	
end

# ╔═╡ 976273ce-8a30-11ec-05af-3948a202815a
md"# make a cubic"

# ╔═╡ 046adce5-d2bf-4526-9851-fdd36c0c0732
md"## 1.fisrt  let us plot a square!"

# ╔═╡ d93a970e-9d5d-473f-bc0e-cdac3615a329
let 
	
	x=[0,10,10,10,0,0,0]
	yp(m)=[m,m,m,m,m,m,m]  #所有点的y轴坐标
	z=[0,0,10,20,20,10,0]
	scatter(x,yp(0),z, color = :bluesreds)
	plot!(x,yp(0),z)
	 
	
	
end

# ╔═╡ 98537cfa-ed83-4faf-ac35-0373fcf8f511
md"## 2.second  step let us plot behind  square!
   cause  two square's y coordriant is difference
   so is make  new array of y coord!
"

# ╔═╡ d84e6ea2-50f6-4cad-913a-9cb2ebd5b68f
let 
 md""" 
  yp(m)=[m,m,m,m,m,m,m] 
  eg.  yp(0)  we  get [0,0,0,0,0,0]
       yp(2)  we  get [2,2,2,2,2,2]
   you can see we get a array  with 6 elements and value is m 
   how  make a function to get a different length arr with same value?
 """
	
	x=[0,10,10,10,0,0,0]
	yp(m)=[m,m,m,m,m,m,m]  #所有点的y轴坐标
	z=[0,0,10,20,20,10,0]
	  
	  scatter(x,yp(0),z,)
	  plot!(x,yp(0),z)
	  scatter!(x,yp(10),z)
	  plot!(x,yp(10),z)
	
	
end

# ╔═╡ db5eb9af-d4ec-4873-aea6-d66bc14ee01c
md"## 3.lets plot upper square and bottom square"

# ╔═╡ 07becb5e-b5d0-4033-97fc-d2037dc171cd
let 
	unit=20    #公用变量, 这里定义为沿着y轴的景深,或者正方形的厚度
	#make two square front-behind
	x=[0,10,10,10,0,0,0]
	yp(m)=[m,m,m,m,m,m,m]  #所有点的y轴坐标
	z=[0,0,10,20,20,10,0]
	  scatter(x,yp(0),z)
	  plot!(x,yp(0),z)
	  scatter!(x,yp(unit),z)
	  plot!(x,yp(unit),z)
	# make  upper square
	  upper_x=[0,10,10,0,0]
	  upper_y=[0,0,20,20,0]
	  upper_z=[20,20,20,20,20]
	  plot!(upper_x,upper_y,upper_z)
	#make  bottom square
	 bottom_x=[0,10,10,0,0]
	 bottom_y= [0,0,20,20,0]
	 bottom_z= [0,0,0,0,0]
	 plot!(bottom_x,bottom_y,bottom_z)
	# you find upper and bottom square has same _x and _y , _z si difference
	# so wo can make it better!
end

# ╔═╡ 265c5bfa-78c9-42a7-a4da-4ff39806411f
let
	origin1= [0,0,0]
	origin2=[0,0,10]
	
	#origin3=[5,5,5]
	size= [10,10,0]

	# define a function accept origin and size
	# return a array with x,y,z series
	# so  we can use series to plot a square,or more so
	function rectangle_from_coords(origin,size)
		x,y,z=origin
		w,h,l=size
		 [
			 [x,x+w,x+w,x,x],
			 [y,y,y,y,y],
			 [z,z,z+h,z+h,z]
		 ]
	 end
	rect1=rectangle_from_coords(origin1,size)
	rect2=rectangle_from_coords(origin2,size)
	#rect3=rectangle_from_coords(origin3,size)
    plot!(rect1[:1],rect1[:2],rect1[:3],label = "rect1")
	plot!(rect2[:1],rect2[:2],rect2[:3],label = "rect2")
	
	
end

# ╔═╡ 25a26791-5cc3-4d3c-8ed5-ca67010845d4
# let
#   range=-10:.5:10
#   md"""
# 	size  $(@bind size Slider(5:1:25; default=10, show_value=true))
# 	margin $(@bind margin Slider(range; default=0.0, show_value=true))
#    """
# end


# ╔═╡ 32536470-8295-4c4b-aded-fa6520cf38b1
@bind size_out Slider(5:1:25; default=10, show_value=true)

# ╔═╡ a20a046f-81a8-4453-aa56-554d929dc9d3
@bind margin_out Slider(-10:.5:10; default=0.0, show_value=true)

# ╔═╡ be929620-1161-494e-87bb-4eaad224f2d4
md"## 4. we find coords has some common so wo  make better"

# ╔═╡ 62826f0a-a342-4037-a95c-a05ae4e9e67f
let
	size=10
	margin=2
	origin1= [0,0,0]
	origin2=[0,0,size+margin]
	origin3=[size+margin,0,0]
	origin4=[size+margin,0,size+margin]
	
	#origin3=[5,5,5]
	size= [10,10,10]
	function rectangle_from_coords(origin,size)
		x,y,z=origin
		w,h,l=size
		 [
			 [x,x+w,x+w,x,x],
			 [y,y,y,y,y],
			 [z,z,z+h,z+h,z]
		 ]
	 end
	rect1=rectangle_from_coords(origin1,size)
	rect2=rectangle_from_coords(origin2,size)
	rect3=rectangle_from_coords(origin3,size)
	rect4=rectangle_from_coords(origin4,size)
    p1=plot!(rect1[:1],rect1[:2],rect1[:3],label = "rect1")
	p2=plot!(rect2[:1],rect2[:2],rect2[:3],label = "rect2")
	p3=plot!(rect3[:1],rect3[:2],rect3[:3],label = "rect3")
	p4=plot!(rect4[:1],rect4[:2],rect4[:3],label = "rect4")
	#plot!(rect3[:1],rect3[:2],rect3[:3],label = "rect3")
	#plot!(p1,p2,p3,p4,layout =4, legend = false)
end

# ╔═╡ 7925a6aa-9d6c-41a9-8c1d-30104662fbf1
md"## 5. seperate functional blocks
    there two parts to make a plots 
  1. form  plots series 
  2. use data to plots
    so  we  get two function 
"

# ╔═╡ ffa5ab5c-42c4-49e3-af49-7d88c7a27cd0
function rectangle_from_data(origin,size)
		x,y,z=origin
		w,h,l=size
		 [
			 [x,x+w,x+w,x,x],
			 [y,y,y,y,y],
			 [z,z,z+h,z+h,z]
		 ]
	 end

# ╔═╡ 8bc05241-9b03-442d-bf3d-8a7dd55af452
begin 
	

	function Rect(title::String="Rect",origin=[0,0,0],size=[10,10,10])
	  
	  rect=rectangle_from_data(origin,size)
	  plot!(rect[:1],rect[:2],rect[:3],label = `$(title)`)
	end

    
end

# ╔═╡ d469fbd8-4987-42e0-bf93-188038244b2f
begin
	p1=Rect("rect1")
	p2=Rect("rect2",[10,0,0])
	p3=Rect("rect3", [0,0,10])
    p4=Rect("rect4", [10,0,10])
end


# ╔═╡ a93a4239-c53f-465b-8914-3da530a610fc
begin
	#x=[10,0,0,10,10,0]
	#y=[0,0,0,0,0,0,0]
	#z=[0,0,10,10,20,20]
end

# ╔═╡ Cell order:
# ╟─976273ce-8a30-11ec-05af-3948a202815a
# ╠═922d0781-b72d-45b2-95fa-4abc0b8053e2
# ╠═046adce5-d2bf-4526-9851-fdd36c0c0732
# ╠═d93a970e-9d5d-473f-bc0e-cdac3615a329
# ╟─98537cfa-ed83-4faf-ac35-0373fcf8f511
# ╠═d84e6ea2-50f6-4cad-913a-9cb2ebd5b68f
# ╟─db5eb9af-d4ec-4873-aea6-d66bc14ee01c
# ╠═07becb5e-b5d0-4033-97fc-d2037dc171cd
# ╠═265c5bfa-78c9-42a7-a4da-4ff39806411f
# ╟─25a26791-5cc3-4d3c-8ed5-ca67010845d4
# ╠═32536470-8295-4c4b-aded-fa6520cf38b1
# ╠═a20a046f-81a8-4453-aa56-554d929dc9d3
# ╠═be929620-1161-494e-87bb-4eaad224f2d4
# ╠═62826f0a-a342-4037-a95c-a05ae4e9e67f
# ╠═d469fbd8-4987-42e0-bf93-188038244b2f
# ╠═7925a6aa-9d6c-41a9-8c1d-30104662fbf1
# ╠═8bc05241-9b03-442d-bf3d-8a7dd55af452
# ╠═ffa5ab5c-42c4-49e3-af49-7d88c7a27cd0
# ╟─a93a4239-c53f-465b-8914-3da530a610fc
