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

# ╔═╡ 4ea09c13-a7ea-4d0d-98bc-90c9a8fdf28d
begin
using CairoMakie,CSV,DataFrames,PlutoUI
	
using  AlgebraOfGraphics
	   #set_aog_theme!()
end

# ╔═╡ 411103c8-8636-11ec-2150-89fe0acea2d4
md"# NBA shot stat"

# ╔═╡ 31eeacf4-d096-44d6-8082-97f7ec2129a8
begin
   url="/Users/apple/Public/Github/Pluto-hub/计算思维-notebooks/shot.csv"
   url2="http://127.0.0.1:8081/penguins.csv"
   df = DataFrame(CSV.File(url))
end


# ╔═╡ 4aa4730d-cceb-45e4-8297-86b878810eb9
begin
	using AlgebraOfGraphics:density
   axis = (type = Axis3, width =600, height = 600)
   layer = density() * visual(Wireframe, linewidth=0.05)
  plt = data(df)* layer* mapping(:x,:y) 
   draw(plt; axis)
end

# ╔═╡ bb12842f-52e3-441e-a5a0-f84b2c547300
dataSet=[[-10,16,1],[46,94,0],[-52,245,0],[-10,61,0],[13,15,0],[-26,64,0],[-25,10,1],[-19,250,1],[-150,201,1],[-114,220,1],[170,206,0],[-8,16,1],[-4,129,0],[58,248,0],[42,267,1],[-6,263,0],[-7,18,1],[-18,25,0],[-165,84,1],[-16,74,0],[-9,11,1],[-2,112,0],[141,227,0],[-3,259,0],[128,212,1],[81,85,1],[-50,29,0],[-11,74,0],[-3,33,0],[-138,209,0],[160,194,0],[-29,11,1],[4,273,0],[193,165,0],[67,242,0],[-13,262,0],[-8,10,1],[-65,242,0],[74,248,1],[-152,199,1],[-101,231,1],[-13,11,1],[-37,243,0],[147,211,0],[-49,29,0],[92,76,1],[116,217,0],[-24,5,1],[-14,2,1],[-170,230,1],[10,96,0],[-49,248,0],[-18,12,1],[42,253,0],[-177,196,1],[29,268,1],[32,260,1],[-163,220,1],[-180,207,0],[-9,282,0],[-15,252,0],[-3,262,0],[171,189,1],[-60,25,0],[75,243,1],[139,57,0],[-152,218,0],[-7,20,1],[-142,244,0],[-11,28,0],[-28,18,0],[-164,279,1],[-11,18,1],[-3,16,1],[-141,235,0],[-8,13,1],[-8,4,1],[-18,267,0],[-11,37,1],[104,276,0],[-73,173,0],[-125,230,0],[20,13,0],[-24,65,0],[11,269,0],[-24,143,1],[-29,6,1],[-14,8,1],[69,6,0],[-149,46,1],[-20,17,1],[10,8,1],[-41,41,0],[30,253,0],[179,170,1],[-8,21,0],[-16,-1,1],[-160,193,0],[-64,250,0],[-36,271,1],[-165,215,0],[201,205,0],[-18,25,1],[43,27,0],[17,271,0],[-4,4,1],[77,253,0],[-4,16,1],[103,132,0],[-69,247,1],[-78,258,1],[-20,8,0],[-9,17,1],[-11,21,1],[-58,258,0],[-83,309,0],[-27,385,0],[135,222,0],[176,188,1],[-46,158,0],[-13,295,1],[226,62,0],[-2,11,1],[-16,20,1],[97,237,1],[-58,253,0],[168,194,0],[-3,5,0],[85,88,0],[-2,18,1],[-96,232,0],[7,5,0],[-3,-2,1],[23,257,1],[0,9,0],[55,271,0],[-26,117,0],[-93,117,0],[122,241,0],[117,231,0],[100,137,0],[1,3,0],[-150,51,1],[-1,29,1],[-55,74,0],[5,287,1],[-116,241,0],[3,14,1],[-227,46,0],[-92,122,1],[12,268,0],[-19,4,1],[-13,11,0],[-1,257,1],[-208,158,1],[-132,225,0],[-5,11,0],[-20,42,0],[-61,46,0],[-32,28,0],[-29,6,0],[-9,10,0],[164,204,0],[-100,239,0],[201,150,0],[13,257,1],[17,257,0],[120,243,1],[45,126,1],[-111,266,0],[119,250,0],[-19,121,1],[92,253,0],[89,237,1],[-126,268,0],[-11,10,1],[-50,289,1],[-73,158,0],[-126,222,1],[227,59,1],[-57,264,0],[-104,247,0],[-188,168,0],[-105,106,0],[-11,53,1],[114,225,1],[-17,13,0],[65,244,0],[-159,197,1],[-1,256,0],[112,232,1],[147,200,1],[20,248,0],[-20,85,1],[-6,249,0],[-87,243,1],[-179,189,0],[0,27,0],[158,199,1],[57,122,1],[120,224,1],[-21,140,1],[-5,276,1],[17,-4,1],[-40,101,1],[45,273,1],[148,230,1],[161,205,1],[-95,104,1],[33,134,0],[-123,116,0],[6,41,1],[-201,167,1],[-20,32,0],[-14,12,1],[183,174,1],[-11,2,1],[-11,6,1],[3,8,1],[-11,12,1],[-11,17,1],[67,253,0],[-23,104,0],[-139,79,0],[-17,8,1],[-19,264,0],[11,13,1],[211,137,0],[-126,247,1],[135,222,0],[-123,104,0],[79,269,1],[65,268,1],[-138,214,1],[-9,297,0],[0,284,1],[-4,227,0],[-118,260,0],[51,248,1],[-4,13,0],[58,285,0],[0,269,0],[-5,50,0],[-32,261,0],[-95,151,0],[-83,85,0],[-82,109,1],[59,59,0],[129,20,0],[-1,2,1],[-131,221,0],[-130,225,0],[2,6,1],[-149,206,1],[89,231,1],[-5,73,0],[6,262,0],[-2,8,1],[-129,220,1],[2,17,0],[-35,21,0],[-98,230,0],[-9,20,1],[-114,230,1],[160,193,0],[-10,247,1],[-107,227,0],[-87,245,0],[-102,221,1],[139,201,0],[-3,10,1],[1,14,0],[-222,-10,0],[1,24,0],[-2,13,1],[81,260,0],[-40,8,1],[-125,231,1],[-5,14,1],[16,266,1],[81,284,0],[-87,255,0],[162,202,1],[-6,13,0],[-6,189,1],[-164,230,0],[-202,178,0],[141,112,1],[-177,214,0],[-3,293,0],[-67,263,0],[-7,73,0],[103,236,0],[-12,2,1],[48,258,1],[90,242,1],[-9,11,1],[-3,8,1],[-145,209,0],[-141,218,0],[152,212,0],[-11,6,0],[-5,-3,1],[-156,155,0],[-98,129,0],[116,230,0],[-10,0,0],[19,269,0],[-8,5,0],[-92,235,0],[17,6,1],[-46,24,0],[-227,17,1],[-98,226,0],[-13,-5,0],[-5,19,0],[-30,6,1],[-192,161,1],[-125,227,1],[49,15,0],[-10,-7,1],[128,219,1],[-139,216,1],[-27,11,0],[2,13,1],[181,203,1],[12,5,1],[-14,4,0],[139,216,0],[-224,151,0],[-13,7,1],[-219,137,1],[-95,244,0],[151,220,0],[-12,11,1],[-25,28,0],[21,6,0],[200,164,0],[223,16,1],[-117,236,0],[-33,39,0],[-6,11,1],[-73,259,0],[232,100,1],[0,8,0],[-116,233,0],[-3,6,0],[93,239,1],[168,189,0],[96,69,0],[-3,5,0],[204,157,1],[-5,6,1],[138,220,1],[96,239,0],[-131,226,1],[-13,262,0],[3,98,1],[-17,58,0],[-33,36,0],[-11,2,1],[-8,7,1],[-132,23,1],[70,256,0],[76,258,1],[0,6,1],[8,275,0],[-223,75,0],[106,231,0],[-146,222,0],[106,148,0],[2,1,1],[-122,219,0],[2,3,0],[3,267,0],[-2,21,0],[-101,236,0],[-76,63,1],[6,2,1],[190,185,0],[0,107,1],[-45,69,0],[138,248,1],[13,7,1],[-13,285,1],[150,218,0],[165,215,1],[40,108,0],[-3,1,1],[-52,147,1],[-102,100,0],[-80,243,0],[46,273,0],[8,258,1],[109,242,1],[5,5,1],[-193,209,0],[-105,157,0],[210,164,0],[-122,85,0],[50,62,0],[-86,231,1],[-165,-5,1],[-112,229,1],[-48,246,1],[-130,209,1],[-32,246,1],[3,4,1],[185,172,1],[-2,6,0],[9,6,1],[-55,179,0],[-6,2,1],[49,249,0],[-5,13,1],[183,184,1],[103,242,0],[-6,258,0],[226,91,1],[-95,265,0],[177,189,0],[-82,243,0],[20,60,1],[-163,204,0],[-9,36,0],[-14,4,1],[24,268,0],[-19,6,1],[-208,85,0],[-11,11,0],[-32,29,0],[57,251,0],[-10,256,0],[130,82,0],[171,180,0],[-14,6,1],[-120,4,0],[-107,219,1],[-67,239,1],[195,167,1],[-84,287,0],[46,283,0],[-33,257,1],[149,239,0],[-142,230,0],[-11,18,0],[-1,12,1],[-13,15,1],[136,241,1],[3,17,1],[-23,27,1],[157,209,1],[225,107,1],[5,22,1],[-80,151,0],[8,13,1],[-63,137,1],[-4,35,0],[-152,221,0],[-11,11,1],[-101,129,0],[-100,242,0],[-13,31,1],[-136,226,0],[130,222,1],[46,98,0],[68,164,1],[-176,184,0],[-188,163,1],[237,0,0],[180,198,0],[-13,5,0],[-97,90,0],[-16,6,1],[3,14,1],[51,236,0],[-161,214,1],[-185,191,1],[98,230,1],[102,227,0],[5,17,1],[81,289,0],[123,233,0],[-174,205,0],[7,62,0],[0,-6,0],[-79,237,1],[-5,90,1],[180,180,1],[-2,15,1],[-8,31,0],[9,21,0],[65,246,1],[-14,10,0],[95,246,0],[-55,47,0],[-4,6,1],[5,13,1],[-4,24,0],[-10,14,0],[-112,130,1],[-110,162,1],[85,233,0],[114,218,0],[2,80,1],[-22,6,0],[-7,1,1],[-3,8,1],[84,237,1],[-17,5,0],[-11,-5,1],[-12,-5,1],[-7,0,1],[-207,160,1],[-172,195,1],[8,267,0],[10,6,0],[8,15,1],[-17,11,1],[133,214,0],[142,205,0],[25,27,1],[-75,264,0],[11,29,0],[85,242,0],[5,25,1],[14,263,1],[79,247,0],[122,226,1],[0,16,0],[160,199,1],[-5,260,0],[2,136,1],[95,232,0],[-7,6,1],[-104,246,0],[-37,38,1],[-114,2,0],[-16,18,0],[-223,105,0],[-47,170,0],[-6,34,0],[7,3,1],[-19,264,1],[0,4,1],[12,9,0],[220,131,1],[-177,184,0],[92,242,0],[-93,146,0],[114,231,0],[23,-2,0],[-4,1,1],[73,237,0],[-92,231,0],[90,269,0],[198,164,0],[161,189,0],[-70,252,1],[9,252,0],[-81,124,0],[-12,7,0],[-191,185,0],[-58,38,1],[55,241,0],[-131,59,1],[-175,64,1],[-182,226,1],[-193,228,0],[-9,15,1],[101,40,0],[-110,235,1],[-9,8,0],[22,62,0],[-136,233,0],[-202,153,0],[-50,30,0],[-5,18,1],[-25,265,1],[2,18,0],[112,225,0],[1,8,0],[-2,273,0],[11,9,1],[3,58,0],[-127,226,1],[6,11,1],[-169,184,0],[-144,199,1],[-169,243,0],[-100,242,1],[-123,222,0],[187,176,1],[121,230,0],[-19,46,0],[153,100,1],[8,262,0],[-123,92,0],[-225,47,0],[-116,221,1],[-76,264,0],[-170,186,0],[-2,262,0],[-3,10,1],[-96,173,0],[134,232,1],[-18,288,0],[-65,128,1],[129,227,0],[-51,115,0],[-23,8,0],[-13,4,1],[11,11,0],[58,249,0],[-225,16,1],[6,26,1],[-13,46,1],[-11,11,1],[11,8,1],[-16,25,1],[95,243,1],[-13,-4,1],[-2,82,0],[103,236,1],[-4,13,1],[-15,77,0],[-4,8,0],[9,3,0],[-96,111,0],[-11,13,0],[92,109,0],[-87,240,1],[19,9,1],[-4,10,1],[-95,237,1],[-13,253,0],[-9,12,1],[2,-6,1],[-8,257,1],[-14,17,0],[-22,23,0],[36,252,1],[-89,243,1],[-77,239,0],[124,242,0],[58,79,0],[-116,55,1],[-20,259,0],[-3,88,1],[63,247,1],[2,13,1],[-238,20,0],[-2,252,0],[155,206,0],[98,113,0],[-81,59,0],[-11,4,1],[-2,16,1],[-9,4,1],[25,250,1],[-59,252,0],[11,11,1],[98,230,0],[-16,6,0],[-153,209,0],[-3,272,1],[223,1,0],[-94,239,0],[0,39,0],[0,550,0],[130,241,1],[-122,215,1],[-6,5,1],[-149,195,0],[-6,-1,1],[-48,119,0],[94,237,0],[-2,3,1],[-6,0,1],[-38,239,0],[-226,-15,0],[5,13,1],[11,14,1],[19,26,0],[-139,211,0],[1,31,0],[228,57,0],[19,29,0],[-14,274,1],[-57,264,1],[37,273,0],[-6,8,0],[217,122,1],[6,22,0],[4,38,0],[-2,25,0],[-148,262,0],[-11,11,0],[-147,241,0],[44,256,1],[174,195,0],[-19,17,0],[145,215,0],[-185,188,1],[9,34,0],[196,179,0],[71,325,0],[122,271,1],[-22,204,0],[1,11,0],[-14,34,1],[-8,10,1],[-13,8,1],[-14,5,1],[98,235,0],[-28,52,1],[9,259,0],[-7,99,0],[-3,1,1],[-77,270,0],[-11,10,0],[-128,-5,1],[-166,197,1],[-6,15,0],[-3,21,1],[178,173,0],[-29,31,1],[-163,205,0],[-17,15,0],[8,256,0],[46,256,0],[110,48,0],[6,8,0],[1,-1,1],[27,258,1],[-98,137,1],[101,235,0],[96,242,1],[1,51,1],[0,5,1],[3,1,0],[-85,159,0],[-235,90,0],[44,265,0],[-40,73,0],[-15,6,0],[103,64,0],[-11,4,1],[-30,17,1],[120,103,0],[22,271,0],[-11,15,0],[0,256,1],[-92,17,0],[-9,159,0],[-48,264,0],[89,235,1],[109,217,1],[75,249,1],[3,52,1],[-13,21,0],[10,29,0],[146,210,0],[-5,12,1],[-2,17,0],[-2,256,0],[30,248,1],[39,248,0],[117,116,1],[-49,253,0],[171,189,1],[-58,194,0],[-58,59,1],[100,84,0],[-24,54,0],[-1,275,1],[-22,15,1],[15,274,1],[154,226,0],[-235,50,0],[-231,148,0],[-28,22,1],[-36,34,0],[60,215,0],[-25,14,1],[14,266,1],[-6,258,0],[-85,242,0],[-123,227,0],[-40,62,0],[-230,63,1],[-158,234,0],[-38,19,0],[-51,56,0],[-54,285,1],[-139,-1,1],[-8,271,0],[131,85,0],[141,218,1],[171,229,0],[52,242,1],[-62,246,1],[126,219,0],[-9,11,1],[38,163,1],[28,10,0],[-54,255,0],[-8,11,1],[-179,217,0],[-54,251,1],[-47,280,1],[146,170,0],[128,44,0],[211,147,1],[-13,4,1],[-163,176,0],[57,125,1],[226,25,0],[-15,17,0],[34,271,1],[-189,185,0],[47,251,0],[134,215,0],[-30,140,1],[-20,11,0],[154,195,0],[-23,15,1],[-110,237,0],[-22,253,0],[-127,154,0],[-93,260,1],[228,138,0],[-165,200,1],[-30,15,1],[-158,216,0],[24,14,1],[-217,126,0],[-51,260,1],[-9,80,0],[0,-6,0],[-29,16,1],[102,253,0],[-23,22,0],[46,31,0],[0,-6,1],[-39,26,1],[127,235,0],[-214,189,0],[37,13,0],[113,243,0],[216,195,0],[185,173,0],[-5,8,1],[-6,16,1],[-12,5,1],[-9,11,1],[-5,12,1],[-23,257,0],[230,27,0],[211,141,0],[-17,11,1],[-12,10,1],[11,0,1],[154,204,0],[18,257,0],[-29,320,0],[0,125,1],[92,230,1],[17,17,1],[-11,11,1],[88,243,1],[-114,96,0],[153,220,1],[-151,203,1],[14,6,1],[32,83,1],[154,213,0],[-122,281,0],[-11,193,1],[-8,5,0],[120,236,1],[-98,236,1],[0,21,1],[45,150,1],[72,68,1],[-63,252,1],[-57,236,0],[-5,83,1],[94,237,0],[3,14,0],[-133,38,1],[9,80,0],[180,194,0],[-71,253,1],[-109,241,0],[-115,227,0],[-88,264,0],[-82,253,0],[68,153,0],[-125,226,1],[-92,232,1],[1,268,0],[1,10,1],[2,5,1],[-46,245,0],[11,5,1],[66,262,0],[-11,304,0],[231,28,1],[114,225,0],[155,102,1],[6,290,0],[-16,357,0],[57,83,0],[0,314,0],[-158,232,0],[-87,264,0],[180,167,0],[-4,83,0],[-226,1,1],[-25,264,0],[-5,4,1],[9,4,1],[2,113,1],[-33,129,1],[-101,145,0],[-22,10,0],[-32,142,0],[210,127,0],[-30,259,1],[-39,25,1],[223,115,0],[-12,4,1],[-19,7,0],[203,138,1],[-68,260,0],[0,183,0],[-24,-4,1],[-229,8,0],[-99,236,1],[40,36,1],[117,221,1],[204,131,0],[-8,10,1],[-33,52,0],[-13,5,1],[227,29,0],[-6,1,1],[233,59,1],[-20,5,1],[-67,246,0],[81,241,0],[-100,62,0],[-124,43,0],[7,151,1],[16,156,1],[141,221,0],[-85,67,0],[5,252,0],[-18,250,0],[0,4,1],[206,137,1],[16,14,0],[-103,230,1],[198,207,1],[196,151,1],[-2,10,0],[-121,222,1],[117,228,0],[-51,105,0],[-67,100,0],[231,18,0],[113,227,0],[-3,8,1],[-99,239,1],[-5,252,1],[110,242,1],[139,226,0],[136,211,0],[6,9,1],[-201,152,0],[117,231,0],[227,116,1],[228,11,0],[30,257,0],[32,102,1],[-20,15,0],[135,226,0],[-63,193,1],[107,232,1],[130,226,0],[81,246,1],[29,32,0],[-60,34,0],[-92,243,0],[36,283,0],[185,180,1],[-171,194,0],[-111,110,0],[-89,287,0],[6,21,0],[0,0,0],[-55,71,0],[14,11,1],[-191,174,0],[-58,65,0],[0,257,1],[14,12,1],[-83,244,0],[51,246,0],[230,83,1],[41,281,1],[-8,25,0],[76,251,0],[-37,198,1],[87,248,1],[134,145,0],[3,19,1],[182,198,1],[134,239,1],[-36,25,0],[-119,237,0],[-127,234,0],[9,280,0],[223,21,1],[199,184,1],[66,251,0],[13,263,1],[237,59,0],[-230,94,0],[-230,114,0],[69,127,1],[112,225,0],[-10,92,1],[-70,266,1],[234,73,0],[-15,195,0],[-68,252,1],[-118,247,0],[9,74,0],[-8,41,0],[106,269,0],[-123,238,0],[232,1,1],[6,11,1],[9,18,1],[-7,128,0],[-19,260,0],[0,73,0],[48,279,0],[-13,10,1],[-25,262,0],[-158,210,1],[-33,13,0],[-33,189,0],[90,252,0],[-11,29,0],[23,32,0],[-5,1,1],[65,71,1],[-98,22,0],[-68,71,0],[-5,267,0],[186,226,1],[-49,239,0],[-30,13,0],[186,162,1],[-124,208,1],[-10,94,1],[166,172,0],[-68,237,1],[-9,26,1],[176,174,1],[149,195,1],[-19,10,0],[-32,242,0],[141,204,1],[-50,32,0],[221,21,0],[-30,22,1],[-40,27,0],[-67,120,0],[-11,36,1],[-18,222,1],[-14,6,1],[-134,218,0],[13,16,1],[-58,252,0],[157,221,0],[-11,17,1],[-9,8,1],[-13,8,1],[111,247,1],[138,222,0],[-14,16,1],[-18,17,1],[-7,42,0],[-9,12,1],[123,236,0],[234,27,1],[60,253,1],[-105,242,1],[-70,258,0],[146,204,0],[2,16,1],[-50,35,1],[141,214,0],[-105,268,0],[240,66,0],[-11,17,1],[-76,256,0],[-128,182,0],[54,245,0],[-82,248,1],[-233,-7,1],[7,272,0],[-69,247,0],[187,159,0],[-228,53,1],[-98,233,0],[68,143,0],[-5,-3,1],[0,4,0],[-231,17,0],[0,0,1],[60,244,0],[-2,5,1],[-5,251,0],[169,184,0],[-17,74,0],[-19,11,0],[87,42,1],[-7,67,1],[-52,259,1],[-22,27,1],[-2,15,0],[8,-1,1],[114,232,0],[-13,1,1],[12,10,1],[2,11,1],[-168,194,0],[-18,26,0],[116,258,0],[5,16,1],[-112,262,0],[-139,235,1],[-6,5,0],[0,3,1],[-6,257,0],[-13,10,1],[81,258,1],[1,17,1],[119,231,1],[-8,273,0],[0,2,1],[-1,26,0],[62,265,0],[-44,85,0],[3,49,0],[136,235,0],[-231,-13,0],[-2,5,1],[-18,13,0],[-58,251,0],[-11,-1,1],[0,98,1],[-19,9,0],[14,32,1],[-18,6,0],[-15,5,1],[38,74,1],[-9,5,1],[232,32,0],[-3,11,1],[-17,1,1],[-27,281,1],[35,259,1],[4,2,1],[-18,7,1],[-230,13,0],[138,228,1],[33,254,1],[-11,312,0],[-25,13,1],[-65,258,0],[133,227,0],[-2,284,0],[51,56,1],[-24,13,0],[-22,13,0],[-237,-1,1],[18,268,0],[17,484,0],[238,5,0],[-40,19,1],[-127,215,1],[98,104,1],[85,233,0],[239,63,0],[211,148,0],[11,-1,1],[5,143,1],[231,-5,0],[25,258,1],[-7,6,0],[-228,-5,0],[-117,231,0],[-9,7,1],[111,241,0],[-6,16,1],[-10,26,0],[148,214,1],[56,263,0],[-2,21,0],[-109,251,0],[6,197,1],[16,-8,0],[230,59,1],[89,264,0],[-101,236,0],[-19,15,0],[-22,6,0],[2,13,1],[-4,22,1],[-18,10,0],[-201,159,0],[-139,213,1],[52,246,0],[-8,4,1],[35,264,0],[-4,24,1],[16,0,0],[131,220,0],[19,253,1],[135,209,0],[-3,16,1],[-27,16,0],[-19,68,0],[-13,6,1],[217,154,0],[-24,-1,1],[-82,280,0],[-35,264,1],[-2,188,0],[130,207,0],[100,53,1],[-8,13,1],[-20,270,0],[-92,246,1],[-61,-17,0],[-2,69,1],[4,142,0],[234,84,0],[114,262,0],[0,30,1],[41,83,1],[165,205,0],[-59,252,0],[20,14,1],[-2,115,1],[171,213,0],[-138,208,1],[0,13,1],[-5,11,0],[228,88,0],[141,219,1],[0,11,1],[7,37,0],[-29,22,0],[7,9,1],[-102,56,0],[-13,8,1],[-116,213,1],[-3,-4,1],[8,136,0],[-15,16,0],[81,236,1],[4,4,1],[6,15,0],[-13,0,1],[-14,6,1],[27,11,0],[237,78,0],[-147,191,1],[-8,2,0],[207,136,1],[-20,47,0],[-110,83,0],[233,11,0],[160,189,0],[232,43,0],[-2,6,1],[10,259,0],[63,243,0],[-22,36,0],[232,63,0],[12,4,1],[-145,222,0],[-35,182,0],[-24,272,0],[-9,5,0],[2,14,0],[-25,109,0],[116,100,1],[-8,10,0],[-72,71,1],[3,9,0],[-62,53,0],[-5,5,1],[20,256,0],[90,122,1],[-1,12,1],[35,256,0],[2,12,1],[-32,48,0],[-226,-8,0],[-8,0,1],[134,226,0],[-16,6,0],[-98,237,1],[155,214,1],[195,185,0],[145,249,0],[16,92,0],[-73,20,1],[-11,29,1],[-10,31,0],[6,10,1],[172,189,1],[-133,232,0],[-15,295,0],[-237,-16,0],[-71,253,0],[-19,11,1],[-48,256,0],[46,257,0],[-8,4,0],[4,-14,0],[-172,206,0],[-12,274,0],[18,-9,1],[-5,6,0],[232,-22,1],[11,-5,1],[95,86,1],[0,-8,1],[2,19,0],[6,257,0],[-21,250,0],[0,10,0],[9,264,0],[-6,13,1],[70,253,0],[82,240,0],[8,4,1],[3,36,1],[106,230,0],[19,74,0],[127,106,1],[9,42,0],[5,7,1],[5,-1,1],[0,-3,0],[127,217,0],[-1,7,0],[-3,2,1],[15,256,1],[-150,199,0],[5,37,0],[8,10,1],[5,3,1],[213,157,0],[174,303,0],[0,6,1],[-14,13,0],[230,-5,0],[-56,53,0],[0,-6,0],[-3,12,1],[-160,69,1],[-50,2,0],[-2,-3,0],[125,221,1],[103,84,1],[-17,0,1],[138,199,0],[9,18,1],[131,99,0],[3,8,1],[-11,8,0],[-9,260,1],[-7,10,0],[60,143,1],[21,23,1],[5,254,1],[-14,10,1],[-128,272,0],[-227,20,1],[133,215,0],[-65,190,1],[-201,163,1],[-176,179,1],[-16,9,1],[-109,297,0],[1,268,1],[-53,269,0],[13,9,1],[-11,271,1],[-27,17,0],[221,132,1],[110,246,0],[27,10,1],[-30,13,0],[-16,151,0],[-16,7,1],[84,243,0],[-17,13,1],[21,249,0],[5,-5,1],[-51,38,1],[-88,232,0],[-71,137,1],[-5,5,0],[139,202,1],[-19,246,1],[71,-4,1],[-212,138,0],[5,10,0],[78,246,1],[-9,8,0],[-33,26,0],[-90,240,0],[-24,257,0],[0,-6,0],[131,233,0],[-23,29,1],[86,109,0],[-5,31,0],[228,89,1],[-12,22,0],[163,202,1],[-150,209,1],[-19,13,1],[-139,223,0],[-5,21,0],[-33,320,0],[-12,15,1],[-180,172,0],[-12,15,1]]

# ╔═╡ cd8759c9-6847-4cc8-b102-47ea3d879f4a
@bind rows Select((50:50:1440))

# ╔═╡ bb69ed93-2ce5-4d30-bfaa-3ff14daa1d80
begin
	   mapshot=map(x->Dict("x" => x[1], "y" => x[2], "f" =>x[3]), dataSet)
	   firstMapshot=first(mapshot,rows)
       x_value=map(x->x["x"],firstMapshot)
       y_value=map(x->x["y"],firstMapshot)
	   f_value=map(x->x["f"],firstMapshot)
	   df2=(x=x_value,y=y_value,f=f_value)
	   #length(mapshot)
     
end

# ╔═╡ fc974c2f-8c10-4ace-958d-653ae36e2566
let
set_aog_theme!()

axis = (width = 150, height = 150)
shot_frequency = data(df2) * frequency() * mapping(:f)
draw(shot_frequency; axis)
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
AlgebraOfGraphics = "cbdf2221-f076-402e-a563-3d30da359d67"
CSV = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
CairoMakie = "13f3f980-e62b-5c42-98c6-ff1f3baf88f0"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
AlgebraOfGraphics = "~0.6.3"
CSV = "~0.10.2"
CairoMakie = "~0.7.2"
DataFrames = "~1.3.2"
PlutoUI = "~0.7.34"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

[[deps.AbstractFFTs]]
deps = ["ChainRulesCore", "LinearAlgebra"]
git-tree-sha1 = "6f1d9bc1c08f9f4a8fa92e3ea3cb50153a1b40d4"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.1.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.AbstractTrees]]
git-tree-sha1 = "03e0550477d86222521d254b741d470ba17ea0b5"
uuid = "1520ce14-60c1-5f80-bbc7-55ef81b5835c"
version = "0.3.4"

[[deps.Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "af92965fb30777147966f58acb05da51c5616b5f"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.3"

[[deps.AlgebraOfGraphics]]
deps = ["Colors", "Dates", "Dictionaries", "FileIO", "GLM", "GeoInterface", "GeometryBasics", "GridLayoutBase", "KernelDensity", "Loess", "Makie", "PlotUtils", "PooledArrays", "RelocatableFolders", "StatsBase", "StructArrays", "Tables"]
git-tree-sha1 = "0f94aede3c688420397243a9f3440abfd73f0142"
uuid = "cbdf2221-f076-402e-a563-3d30da359d67"
version = "0.6.3"

[[deps.Animations]]
deps = ["Colors"]
git-tree-sha1 = "e81c509d2c8e49592413bfb0bb3b08150056c79d"
uuid = "27a7e980-b3e6-11e9-2bcd-0b925532e340"
version = "0.4.1"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.ArrayInterface]]
deps = ["Compat", "IfElse", "LinearAlgebra", "Requires", "SparseArrays", "Static"]
git-tree-sha1 = "1bdcc02836402d104a46f7843b6e6730b1948264"
uuid = "4fba245c-0d91-5ea0-9b3e-6abc04ee57a9"
version = "4.0.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Automa]]
deps = ["Printf", "ScanByte", "TranscodingStreams"]
git-tree-sha1 = "d50976f217489ce799e366d9561d56a98a30d7fe"
uuid = "67c07d97-cdcb-5c2c-af73-a7f9c32a568b"
version = "0.8.2"

[[deps.AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "66771c8d21c8ff5e3a93379480a2307ac36863f7"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.0.1"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[deps.CEnum]]
git-tree-sha1 = "215a9aa4a1f23fbd05b92769fdd62559488d70e9"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.4.1"

[[deps.CSV]]
deps = ["CodecZlib", "Dates", "FilePathsBase", "InlineStrings", "Mmap", "Parsers", "PooledArrays", "SentinelArrays", "Tables", "Unicode", "WeakRefStrings"]
git-tree-sha1 = "9519274b50500b8029973d241d32cfbf0b127d97"
uuid = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
version = "0.10.2"

[[deps.Cairo]]
deps = ["Cairo_jll", "Colors", "Glib_jll", "Graphics", "Libdl", "Pango_jll"]
git-tree-sha1 = "d0b3f8b4ad16cb0a2988c6788646a5e6a17b6b1b"
uuid = "159f3aea-2a34-519c-b102-8c37f9878175"
version = "1.0.5"

[[deps.CairoMakie]]
deps = ["Base64", "Cairo", "Colors", "FFTW", "FileIO", "FreeType", "GeometryBasics", "LinearAlgebra", "Makie", "SHA", "StaticArrays"]
git-tree-sha1 = "90fe6622efbb627e7c962e9bd6f5c4228680b7ca"
uuid = "13f3f980-e62b-5c42-98c6-ff1f3baf88f0"
version = "0.7.2"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "f9982ef575e19b0e5c7a98c6e75ee496c0f73a93"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.12.0"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "bf98fa45a0a4cee295de98d4c1462be26345b9a1"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.2"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

[[deps.ColorBrewer]]
deps = ["Colors", "JSON", "Test"]
git-tree-sha1 = "61c5334f33d91e570e1d0c3eb5465835242582c4"
uuid = "a2cac450-b92f-5266-8821-25eda20663c8"
version = "0.4.0"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "6b6f04f93710c71550ec7e16b650c1b9a612d0b6"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.16.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "SpecialFunctions", "Statistics", "TensorCore"]
git-tree-sha1 = "3f1f500312161f1ae067abe07d13b40f78f32e07"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.9.8"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[deps.Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "44c37b4636bc54afac5c574d2d02b625349d6582"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.41.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Reexport", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "ae02104e835f219b8930c7664b8012c93475c340"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.3.2"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "3daef5523dd2e769dad2365274f760ff5f282c7d"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.11"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.DensityInterface]]
deps = ["InverseFunctions", "Test"]
git-tree-sha1 = "80c3e8639e3353e5d2912fb3a1916b8455e2494b"
uuid = "b429d917-457f-4dbc-8f4c-0cc954292b1d"
version = "0.4.0"

[[deps.Dictionaries]]
deps = ["Indexing", "Random"]
git-tree-sha1 = "66bde31636301f4d217a161cabe42536fa754ec8"
uuid = "85a47980-9c8c-11e8-2b9f-f7ca1fa99fb4"
version = "0.3.17"

[[deps.Distances]]
deps = ["LinearAlgebra", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "3258d0659f812acde79e8a74b11f17ac06d0ca04"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.7"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Distributions]]
deps = ["ChainRulesCore", "DensityInterface", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "Test"]
git-tree-sha1 = "2e97190dfd4382499a4ac349e8d316491c9db341"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.46"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3f3a2501fa7236e9b911e0f7a588c657e822bb6d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.3+0"

[[deps.EllipsisNotation]]
deps = ["ArrayInterface"]
git-tree-sha1 = "d7ab55febfd0907b285fbf8dc0c73c0825d9d6aa"
uuid = "da5c29d0-fa7d-589e-88eb-ea29b0a81949"
version = "1.3.0"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ae13fcbc7ab8f16b0856729b050ef0c446aa3492"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.4.4+0"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "d8a578692e3077ac998b50c0217dfd67f21d1e5f"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.0+0"

[[deps.FFTW]]
deps = ["AbstractFFTs", "FFTW_jll", "LinearAlgebra", "MKL_jll", "Preferences", "Reexport"]
git-tree-sha1 = "463cb335fa22c4ebacfd1faba5fde14edb80d96c"
uuid = "7a1cc6ca-52ef-59f5-83cd-3a7055c09341"
version = "1.4.5"

[[deps.FFTW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c6033cc3892d0ef5bb9cd29b7f2f0331ea5184ea"
uuid = "f5851436-0d7a-5f13-b9de-f02708fd171a"
version = "3.3.10+0"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "67551df041955cc6ee2ed098718c8fcd7fc7aebe"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.12.0"

[[deps.FilePathsBase]]
deps = ["Compat", "Dates", "Mmap", "Printf", "Test", "UUIDs"]
git-tree-sha1 = "04d13bfa8ef11720c24e4d840c0033d145537df7"
uuid = "48062228-2e41-5def-b9a4-89aafe57970f"
version = "0.9.17"

[[deps.FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "8756f9935b7ccc9064c6eef0bff0ad643df733a3"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.12.7"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.FreeType]]
deps = ["CEnum", "FreeType2_jll"]
git-tree-sha1 = "cabd77ab6a6fdff49bfd24af2ebe76e6e018a2b4"
uuid = "b38be410-82b0-50bf-ab77-7b57e271db43"
version = "4.0.0"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[deps.FreeTypeAbstraction]]
deps = ["ColorVectorSpace", "Colors", "FreeType", "GeometryBasics", "StaticArrays"]
git-tree-sha1 = "770050893e7bc8a34915b4b9298604a3236de834"
uuid = "663a7486-cb36-511b-a19d-713bb74d65c9"
version = "0.9.5"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.GLM]]
deps = ["Distributions", "LinearAlgebra", "Printf", "Reexport", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "StatsModels"]
git-tree-sha1 = "fb764dacfa30f948d52a6a4269ae293a479bbc62"
uuid = "38e38edf-8417-5370-95a0-9cbb8c7f171a"
version = "1.6.1"

[[deps.GeoInterface]]
deps = ["RecipesBase"]
git-tree-sha1 = "6b1a29c757f56e0ae01a35918a2c39260e2c4b98"
uuid = "cf35fbd7-0cd7-5166-be24-54bfbe79505f"
version = "0.5.7"

[[deps.GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "58bcdf5ebc057b085e58d95c138725628dd7453c"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.1"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "a32d672ac2c967f3deb8a81d828afc739c838a06"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+2"

[[deps.Graphics]]
deps = ["Colors", "LinearAlgebra", "NaNMath"]
git-tree-sha1 = "1c5a84319923bea76fa145d49e93aa4394c73fc2"
uuid = "a2bd30eb-e257-5431-a919-1863eab51364"
version = "1.1.1"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.GridLayoutBase]]
deps = ["GeometryBasics", "InteractiveUtils", "Observables"]
git-tree-sha1 = "70938436e2720e6cb8a7f2ca9f1bbdbf40d7f5d0"
uuid = "3955a311-db13-416c-9275-1d80ed98e5e9"
version = "0.6.4"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.IfElse]]
git-tree-sha1 = "debdd00ffef04665ccbb3e150747a77560e8fad1"
uuid = "615f187c-cbe4-4ef1-ba3b-2fcf58d6d173"
version = "0.1.1"

[[deps.ImageCore]]
deps = ["AbstractFFTs", "ColorVectorSpace", "Colors", "FixedPointNumbers", "Graphics", "MappedArrays", "MosaicViews", "OffsetArrays", "PaddedViews", "Reexport"]
git-tree-sha1 = "9a5c62f231e5bba35695a20988fc7cd6de7eeb5a"
uuid = "a09fc81d-aa75-5fe9-8630-4744c3626534"
version = "0.9.3"

[[deps.ImageIO]]
deps = ["FileIO", "Netpbm", "OpenEXR", "PNGFiles", "QOI", "Sixel", "TiffImages", "UUIDs"]
git-tree-sha1 = "816fc866edd8307a6e79a575e6585bfab8cef27f"
uuid = "82e4d734-157c-48bb-816b-45c225c6df19"
version = "0.6.0"

[[deps.Imath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "87f7662e03a649cffa2e05bf19c303e168732d3e"
uuid = "905a6f67-0a94-5f89-b386-d35d92009cd1"
version = "3.1.2+0"

[[deps.Indexing]]
git-tree-sha1 = "ce1566720fd6b19ff3411404d4b977acd4814f9f"
uuid = "313cdc1a-70c2-5d6a-ae34-0150d3930a38"
version = "1.1.1"

[[deps.IndirectArrays]]
git-tree-sha1 = "012e604e1c7458645cb8b436f8fba789a51b257f"
uuid = "9b13fd28-a010-5f03-acff-a1bbcff69959"
version = "1.0.0"

[[deps.Inflate]]
git-tree-sha1 = "f5fc07d4e706b84f72d54eedcc1c13d92fb0871c"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.2"

[[deps.InlineStrings]]
deps = ["Parsers"]
git-tree-sha1 = "61feba885fac3a407465726d0c330b3055df897f"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.1.2"

[[deps.IntelOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d979e54b71da82f3a65b62553da4fc3d18c9004c"
uuid = "1d5cc7b8-4909-519e-a0f8-d0f5ad9712d0"
version = "2018.0.3+2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.Interpolations]]
deps = ["AxisAlgorithms", "ChainRulesCore", "LinearAlgebra", "OffsetArrays", "Random", "Ratios", "Requires", "SharedArrays", "SparseArrays", "StaticArrays", "WoodburyMatrices"]
git-tree-sha1 = "b15fc0a95c564ca2e0a7ae12c1f095ca848ceb31"
uuid = "a98d9a8b-a2ab-59e6-89dd-64a1c18fca59"
version = "0.13.5"

[[deps.IntervalSets]]
deps = ["Dates", "EllipsisNotation", "Statistics"]
git-tree-sha1 = "3cc368af3f110a767ac786560045dceddfc16758"
uuid = "8197267c-284f-5f27-9208-e0e47529a953"
version = "0.5.3"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "a7254c0acd8e62f1ac75ad24d5db43f5f19f3c65"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.2"

[[deps.InvertedIndices]]
git-tree-sha1 = "bee5f1ef5bf65df56bdd2e40447590b272a5471f"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.1.0"

[[deps.IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[deps.Isoband]]
deps = ["isoband_jll"]
git-tree-sha1 = "f9b6d97355599074dc867318950adaa6f9946137"
uuid = "f1662d9f-8043-43de-a69a-05efc1cc6ff4"
version = "0.1.1"

[[deps.IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[deps.KernelDensity]]
deps = ["Distributions", "DocStringExtensions", "FFTW", "Interpolations", "StatsBase"]
git-tree-sha1 = "591e8dc09ad18386189610acafb970032c519707"
uuid = "5ab0869b-81aa-558d-bb23-cbf5423bbe9b"
version = "0.6.3"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.LazyArtifacts]]
deps = ["Artifacts", "Pkg"]
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Loess]]
deps = ["Distances", "LinearAlgebra", "Statistics"]
git-tree-sha1 = "46efcea75c890e5d820e670516dc156689851722"
uuid = "4345ca2d-374a-55d4-8d30-97f9976e7612"
version = "0.5.4"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "e5718a00af0ab9756305a0392832c8952c7426c1"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.6"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MKL_jll]]
deps = ["Artifacts", "IntelOpenMP_jll", "JLLWrappers", "LazyArtifacts", "Libdl", "Pkg"]
git-tree-sha1 = "5455aef09b40e5020e1520f551fa3135040d4ed0"
uuid = "856f044c-d86e-5d09-b602-aeab76dc8ba7"
version = "2021.1.1+2"

[[deps.Makie]]
deps = ["Animations", "Base64", "ColorBrewer", "ColorSchemes", "ColorTypes", "Colors", "Contour", "Distributions", "DocStringExtensions", "FFMPEG", "FileIO", "FixedPointNumbers", "Formatting", "FreeType", "FreeTypeAbstraction", "GeometryBasics", "GridLayoutBase", "ImageIO", "IntervalSets", "Isoband", "KernelDensity", "LaTeXStrings", "LinearAlgebra", "MakieCore", "Markdown", "Match", "MathTeXEngine", "Observables", "OffsetArrays", "Packing", "PlotUtils", "PolygonOps", "Printf", "Random", "RelocatableFolders", "Serialization", "Showoff", "SignedDistanceFields", "SparseArrays", "StaticArrays", "Statistics", "StatsBase", "StatsFuns", "StructArrays", "UnicodeFun"]
git-tree-sha1 = "0aafd5121c6e1b6a83bd3bb341da45f058225a9b"
uuid = "ee78f7c6-11fb-53f2-987a-cfe4a2b5a57a"
version = "0.16.3"

[[deps.MakieCore]]
deps = ["Observables"]
git-tree-sha1 = "c5fb1bfac781db766f9e4aef96adc19a729bc9b2"
uuid = "20f20a25-4f0e-4fdf-b5d1-57303727442b"
version = "0.2.1"

[[deps.MappedArrays]]
git-tree-sha1 = "e8b359ef06ec72e8c030463fe02efe5527ee5142"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.1"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.Match]]
git-tree-sha1 = "1d9bc5c1a6e7ee24effb93f175c9342f9154d97f"
uuid = "7eb4fadd-790c-5f42-8a69-bfa0b872bfbf"
version = "1.2.0"

[[deps.MathTeXEngine]]
deps = ["AbstractTrees", "Automa", "DataStructures", "FreeTypeAbstraction", "GeometryBasics", "LaTeXStrings", "REPL", "RelocatableFolders", "Test"]
git-tree-sha1 = "70e733037bbf02d691e78f95171a1fa08cdc6332"
uuid = "0a4f8689-d25c-4efe-a92b-7142dfc1aa53"
version = "0.2.1"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MosaicViews]]
deps = ["MappedArrays", "OffsetArrays", "PaddedViews", "StackViews"]
git-tree-sha1 = "b34e3bc3ca7c94914418637cb10cc4d1d80d877d"
uuid = "e94cdb99-869f-56ef-bcf0-1ae2bcbe0389"
version = "0.3.3"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NaNMath]]
git-tree-sha1 = "b086b7ea07f8e38cf122f5016af580881ac914fe"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.7"

[[deps.Netpbm]]
deps = ["FileIO", "ImageCore"]
git-tree-sha1 = "18efc06f6ec36a8b801b23f076e3c6ac7c3bf153"
uuid = "f09324ee-3d7c-5217-9330-fc30815ba969"
version = "1.0.2"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.Observables]]
git-tree-sha1 = "fe29afdef3d0c4a8286128d4e45cc50621b1e43d"
uuid = "510215fc-4207-5dde-b226-833fc4488ee2"
version = "0.4.0"

[[deps.OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "043017e0bdeff61cfbb7afeb558ab29536bbb5ed"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.10.8"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.OpenEXR]]
deps = ["Colors", "FileIO", "OpenEXR_jll"]
git-tree-sha1 = "327f53360fdb54df7ecd01e96ef1983536d1e633"
uuid = "52e1d378-f018-4a11-a4be-720524705ac7"
version = "0.3.2"

[[deps.OpenEXR_jll]]
deps = ["Artifacts", "Imath_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "923319661e9a22712f24596ce81c54fc0366f304"
uuid = "18a262bb-aa17-5467-a713-aee519bc75cb"
version = "3.1.1+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "648107615c15d4e09f7eca16307bc821c1f718d8"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.13+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[deps.PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "ee26b350276c51697c9c2d88a072b339f9f03d73"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.5"

[[deps.PNGFiles]]
deps = ["Base64", "CEnum", "ImageCore", "IndirectArrays", "OffsetArrays", "libpng_jll"]
git-tree-sha1 = "2271d1c3b0103844a9f4af6cd17d70d146d5295f"
uuid = "f57f5aa1-a3ce-4bc8-8ab9-96f992907883"
version = "0.3.13"

[[deps.Packing]]
deps = ["GeometryBasics"]
git-tree-sha1 = "1155f6f937fa2b94104162f01fa400e192e4272f"
uuid = "19eb6ba3-879d-56ad-ad62-d5c202156566"
version = "0.4.2"

[[deps.PaddedViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "03a7a85b76381a3d04c7a1656039197e70eda03d"
uuid = "5432bcbf-9aad-5242-b902-cca2824c8663"
version = "0.5.11"

[[deps.Pango_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "FriBidi_jll", "Glib_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9bc1871464b12ed19297fbc56c4fb4ba84988b0d"
uuid = "36c8627f-9965-5494-a995-c6b170f724f3"
version = "1.47.0+0"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "0b5cfbb704034b5b4c1869e36634438a047df065"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.1"

[[deps.Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PkgVersion]]
deps = ["Pkg"]
git-tree-sha1 = "a7a7e1a88853564e551e4eba8650f8c38df79b37"
uuid = "eebad327-c553-4316-9ea0-9fa01ccd7688"
version = "0.1.1"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "6f1b25e8ea06279b5689263cc538f51331d7ca17"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.1.3"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "8979e9802b4ac3d58c503a20f2824ad67f9074dd"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.34"

[[deps.PolygonOps]]
git-tree-sha1 = "77b3d3605fc1cd0b42d95eba87dfcd2bf67d5ff6"
uuid = "647866c9-e3ac-4575-94e7-e3d426903924"
version = "0.1.2"

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "db3a23166af8aebf4db5ef87ac5b00d36eb771e2"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.0"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "2cf929d64681236a2e074ffafb8d568733d2e6af"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.3"

[[deps.PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "dfb54c4e414caa595a1f2ed759b160f5a3ddcba5"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.3.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "afadeba63d90ff223a6a48d2009434ecee2ec9e8"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.7.1"

[[deps.QOI]]
deps = ["ColorTypes", "FileIO", "FixedPointNumbers"]
git-tree-sha1 = "18e8f4d1426e965c7b532ddd260599e1510d26ce"
uuid = "4b34888f-f399-49d4-9bb3-47ed5cae4e65"
version = "1.0.0"

[[deps.QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "78aadffb3efd2155af139781b8a8df1ef279ea39"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.4.2"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Ratios]]
deps = ["Requires"]
git-tree-sha1 = "01d341f502250e81f6fec0afe662aa861392a3aa"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.2"

[[deps.RecipesBase]]
git-tree-sha1 = "6bf3f380ff52ce0832ddd3a2a7b9538ed1bcca7d"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.2.1"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "cdbd3b1338c72ce29d9584fdbe9e9b70eeb5adca"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "0.1.3"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "bf3188feca147ce108c76ad82c2792c57abe7b1f"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.7.0"

[[deps.Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "68db32dff12bb6127bac73c209881191bf0efbb7"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.3.0+0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.SIMD]]
git-tree-sha1 = "39e3df417a0dd0c4e1f89891a281f82f5373ea3b"
uuid = "fdea26ae-647d-5447-a871-4b548cad5224"
version = "3.4.0"

[[deps.ScanByte]]
deps = ["Libdl", "SIMD"]
git-tree-sha1 = "9cc2955f2a254b18be655a4ee70bc4031b2b189e"
uuid = "7b38b023-a4d7-4c5e-8d43-3f3097f304eb"
version = "0.3.0"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[deps.SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "15dfe6b103c2a993be24404124b8791a09460983"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.11"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.ShiftedArrays]]
git-tree-sha1 = "22395afdcf37d6709a5a0766cc4a5ca52cb85ea0"
uuid = "1277b4bf-5013-50f5-be3d-901d8477a67a"
version = "1.0.0"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SignedDistanceFields]]
deps = ["Random", "Statistics", "Test"]
git-tree-sha1 = "d263a08ec505853a5ff1c1ebde2070419e3f28e9"
uuid = "73760f76-fbc4-59ce-8f25-708e95d2df96"
version = "0.4.0"

[[deps.Sixel]]
deps = ["Dates", "FileIO", "ImageCore", "IndirectArrays", "OffsetArrays", "REPL", "libsixel_jll"]
git-tree-sha1 = "8fb59825be681d451c246a795117f317ecbcaa28"
uuid = "45858cf5-a6b0-47a3-bbea-62219f50df47"
version = "0.1.2"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "a4116accb1c84f0a8e1b9932d873654942b2364b"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.1.1"

[[deps.StackViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "46e589465204cd0c08b4bd97385e4fa79a0c770c"
uuid = "cae243ae-269e-4f55-b966-ac2d0dc13c15"
version = "0.1.1"

[[deps.Static]]
deps = ["IfElse"]
git-tree-sha1 = "d4da8b728580709d736704764e55d6ef38cb7c87"
uuid = "aedffcd0-7271-4cad-89d0-dc628f76c6d3"
version = "0.5.3"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "a635a9333989a094bddc9f940c04c549cd66afcf"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.3.4"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
git-tree-sha1 = "d88665adc9bcf45903013af0982e2fd05ae3d0a6"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.2.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "51383f2d367eb3b444c961d485c565e4c0cf4ba0"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.14"

[[deps.StatsFuns]]
deps = ["ChainRulesCore", "InverseFunctions", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "f35e1879a71cca95f4826a14cdbf0b9e253ed918"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "0.9.15"

[[deps.StatsModels]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "Printf", "REPL", "ShiftedArrays", "SparseArrays", "StatsBase", "StatsFuns", "Tables"]
git-tree-sha1 = "677488c295051568b0b79a77a8c44aa86e78b359"
uuid = "3eaba693-59b7-5ba5-a881-562e759f1c8d"
version = "0.6.28"

[[deps.StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "d21f2c564b21a202f4677c0fba5b5ee431058544"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.4"

[[deps.SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "bb1064c9a84c52e277f1096cf41434b675cd368b"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.6.1"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TiffImages]]
deps = ["ColorTypes", "DataStructures", "DocStringExtensions", "FileIO", "FixedPointNumbers", "IndirectArrays", "Inflate", "OffsetArrays", "PkgVersion", "ProgressMeter", "UUIDs"]
git-tree-sha1 = "991d34bbff0d9125d93ba15887d6594e8e84b305"
uuid = "731e570b-9d59-4bfa-96dc-6df516fadf69"
version = "0.5.3"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "216b95ea110b5972db65aa90f88d8d89dcb8851c"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[deps.WeakRefStrings]]
deps = ["DataAPI", "InlineStrings", "Parsers"]
git-tree-sha1 = "c69f9da3ff2f4f02e811c3323c22e5dfcb584cfa"
uuid = "ea10d353-3f73-51f8-a26c-33c1cb351aa5"
version = "1.4.1"

[[deps.WoodburyMatrices]]
deps = ["LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "de67fa59e33ad156a590055375a30b23c40299d3"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "0.5.5"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "1acf5bdf07aa0907e0a37d3718bb88d4b687b74a"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.12+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.isoband_jll]]
deps = ["Libdl", "Pkg"]
git-tree-sha1 = "a1ac99674715995a536bbce674b068ec1b7d893d"
uuid = "9a68df92-36a6-505f-a73e-abb412b6bfb4"
version = "0.2.2+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[deps.libsixel_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "78736dab31ae7a53540a6b752efc61f77b304c5b"
uuid = "075b6546-f08a-558a-be8f-8157d0f608a5"
version = "1.8.6+1"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "b910cb81ef3fe6e78bf6acee440bda86fd6ae00c"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"
"""

# ╔═╡ Cell order:
# ╠═411103c8-8636-11ec-2150-89fe0acea2d4
# ╠═4ea09c13-a7ea-4d0d-98bc-90c9a8fdf28d
# ╟─31eeacf4-d096-44d6-8082-97f7ec2129a8
# ╟─bb12842f-52e3-441e-a5a0-f84b2c547300
# ╠═cd8759c9-6847-4cc8-b102-47ea3d879f4a
# ╟─bb69ed93-2ce5-4d30-bfaa-3ff14daa1d80
# ╠═4aa4730d-cceb-45e4-8297-86b878810eb9
# ╠═fc974c2f-8c10-4ace-958d-653ae36e2566
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
