module NNBasicFunction



  export hardlim , hardlims, purelin, satlin, satlins, logsig, tansig, poslin;

   function hardlim(x)
		if (x<0)
	     return 0
	    else
	    return  +1
	   end
	end

	
    
    function hardlims(x)
		if (x<0)
	     return -1
	    else
	    return +1
	   end
    end
   
    function purelin(x)
	   x
   	end

   function satlin(x)
	   if(x<0)
		   return 0
	   elseif(0<=x<=1)
		   return x
	   else 
		   return 1
	   end
   end

	function satlins(x)
	   if(x<-1)
		   return -1
	   elseif(-1<=x<=1)
		   return x
	   else 
		   return 1
	   end
   end
	
	function logsig(x)
		let top=1,bottom=1+ℯ^-x
			return top/bottom
		end
	end

	function tansig(x)
		let first= ℯ^x, last=ℯ^-x
			top= first-last
			bottom=first+last
		return top/bottom
		end
	end
	function poslin(x)
		if(x<0)
		  return 0
		else
		  return x
		end
	end

end

