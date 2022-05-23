function getPlotArr(arr)
		intervalArray=arr   #as we refactor code from above code,don't change internal code structure, use temp variable 
     arrlength=length(intervalArray)
     xsArr=[0:i:2π for i in intervalArray]

    plotArr=[]
      for i in  1:arrlength
       ys=[sin(x) for x in xsArr[i]]
       p=scatter(xsArr[i],ys,color=:green,markersize=2,title="interval=$(intervalArray[i])",label=false,framestyle=:origin)
      push!(plotArr,p)
      end
    return  plotArr
end