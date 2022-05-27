### A Pluto.jl notebook ###
# v0.19.4

using Markdown
using InteractiveUtils

# ╔═╡ f7eeb847-6821-4d33-a7b2-2d317b63a8c1
begin
	using PlutoUI
	
    PlutoUI.TableOfContents()
	
end

# ╔═╡ 3919b63c-dd71-11ec-0251-5f2867c41821
PlutoUI.Resource("https://tva1.sinaimg.cn/thumbnail/e6c9d24egy1h2alsw1tzxj20m80gomxn.jpg")

# ╔═╡ 47309f82-27fd-49df-b604-b400857eefcf
md"# M4MADS 依托书籍介绍"

# ╔═╡ 4082ecb7-73d6-4b2f-b490-99d360da038c

md"""
!!! notice "Abstract"

    使用书籍介绍包括:

    1. 微积分
    2. 线性代数
    3. 统计和概率
    4. 机器学习和神经网络
    5. 数学思维和认知
    6. 基础数学,数学历史和应用数学
    7. 视频教程介绍
    
    如果有可能可视化,都会使用可视化技术描述概念 . 不定期更新内容

    注意:这里这是推荐, 你可以使用你认为好的教程, 但是对于实现具体内容方面,需要一些具体的资料作为依托, 不可能把所有的书籍都做交互和可视化处理.所有正规出版书籍不提供下载,请自行寻找.开源版本提供下载链接
    
"""

# ╔═╡ 03abce2a-5f8d-4a3d-8bbf-64bf17042816
md"""
## 1. 微积分

   **传统微积分**的学习很枯燥, 学习过程中很容易会偏重计算而忽视了概念的形成过程,对于现代社会, 计算已经不是主要问题, 我们把关注点转移到概念的形成过程. 微积分是实践性很强的科目, 诞生之时起就建立了:问题=>问题描述=>寻找解决问题的步骤=>形成数学模型=>在实践中检测数学模型的流程. 

  **计算过程**在整个流程中只占很小一部分, 大部分时间是用来描述问题和理解问题,如果描述的问题和已知的模型很类似, 解决办法就能很快获得. 

   ### 《Calculus》
   ![Calculus-single variable](https://img3.doubanio.com/view/subject/s/public/s9057890.jpg)
   
作者是 Deborah Hughes-Hallett,  可视化依据的是第七版的内容, 实例和习题的页码和章节以这个版本为基准. 

在豆瓣读书可以看到该作者更多的书籍 [Deborah Hughes-Hallett 的著作](https://book.douban.com/subject_search?search_text=Deborah%20Hughes-Hallett)
   

本书有上下两册, 分别是一元微积分和多元微积分. 

  ### 《实用微积分》
翻译版本叫做 《实用微积分》 是一本简化版本, 但是基本的教学方法是一样的.出版时间比较久,不一定能看到了, 在一些图书馆或许可以找到.

![《实用微积分》](https://img9.doubanio.com/view/subject/s/public/s4429454.jpg)


 ### 选择原因
   本书在序言就提供了一个 "Four Rules".  微积分学习的四个原则:
   - 可视化原则
   - 数值数据原则
   - 数学符号原则
   - 语言描述原则
   在本教程的整个编程过程中始终都遵循这四个原则. 绘制的每一个图形都是基于此. 在学习过程中, 你会慢慢理解这个过程.  这是我认为可行的学习路径.


    
"""

# ╔═╡ 65009033-c431-4472-a276-63a242b6daaf
md"""
 ## 2. 线性代数
  ###  线性代数及其应用 
  ![](https://img9.doubanio.com/view/subject/s/public/s33740396.jpg)
  
  作者 :David C. Lay

  这本书应该知道的比较多. 许多学习者是从这本书才了解到使用几何直观学习线性代数的方法. 这也是我们的出发点, 接着三维线性空间的几何可视化来学习线性代数概念. 在三维线性空间理解了概念, 过渡到高维度是非常自然的事情. 
    线性代数及其应用 的每一章节最开始的例子都可以扩展成为一个完整的学科. 线性代数威力巨大
    
本教程线性代数可视化部分内容的页码和章节以这本书的中文第五版为基准.

  ###  线性代数导论
  ![](https://img2.doubanio.com/view/subject/s/public/s33475893.jpg)
  
  作者:Gilbert Strang  
   
   本书国内引进, 但只是影印版, 没有翻译.  用网上的一个评论,这本书是革命性的.Stang教授发明的如封面图上的四个空间的示意图为线性代数直观化理解奠定了基础.   作为理解的参考书籍
  
### 矩阵理论和线性代数
   
![](https://www.mathstat.dal.ca/~selinger/linear-algebra/img/cover-small.jpg)
  
  作者:Peter Selinger
   
  这本书写作相当好,而且是开源版本,可以免费下载.  
  
也提供本书的可是话教程

  
     
"""

# ╔═╡ 50e486f4-1534-4e96-9ad6-1a015f170717
md"""
## 统计学
  ### 行为科学统计精要（第8版）
  
![](https://img9.doubanio.com/view/subject/s/public/s28918905.jpg)

 作者:弗雷德里克·J. 格雷维特 

 虽然是作为心理学科的教材, 但是作为广泛意义上的统计学教材是可以的. 就我个人现在的认知:统计学要理解一个核心概念- 样本平均数的标准误. 这本书对这个概念讲的很清楚. 理解了样本均数标准误, 现代科学研究中基于试验采样的数据科学方法才得的实现.   
 
理解数据科学的入口就在这里. 

统计学里的可视化内容涉及不多, 会反复的出现总体和样本关系的示例. Julia的绘图软件包都提供了很好的统计绘图方法, 所以统计绘图方法不是我们要掌握的重点. 重点是理解总体和样本关系以及样本均数标准误的概念.

   ### 白话统计学
   
![](https://img9.doubanio.com/view/subject/s/public/s27292686.jpg)

作者 : 蒂莫西·C·厄丹

与上一本书的思路一致, 对核心的概念讲解的很清楚. 学习统计学先不要考虑复杂的统计工具, 首先要理解基础的概念. 所有的统计学方法都是基于样本采样,所有样本采样质量的度量就是标准误. 

   ### 贝叶斯统计
   
 
"""

# ╔═╡ 3b5c5f2e-f9f9-4036-8cd4-7d2419276711
md"""
## 4.机器学习和神经网络
   ### 机器学习导论

  ![](https://img9.doubanio.com/view/subject/s/public/s29221575.jpg)
   
作者: 米罗斯拉夫·库巴特

   本书作为机器学习的入门教程.讲的很清楚, 每部分内容里的伪代码部分很好, 对于理论和算法之间联系的理解过渡有很大帮助

   ### 神经网络设计（原书第2版）

   ![](https://img1.doubanio.com/view/subject/s/public/s29936638.jpg)
    神经网络可视化基于这本书. 
    
本书原版[Neural Network Design 2nd Edition](https://hagan.okstate.edu/nnd.html)是开源版本, 有PDF文档和源代码包括Matlab和Python版本. 完全的交互式代码过于复杂, 这里不会完全实现所有的交互式, 只实现基本的内容
    

### 深度学习的数学

![](https://img1.doubanio.com/view/subject/s/public/s32295077.jpg)
    
作者:[日]涌井良幸 / [日]涌井贞美
   
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.39"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "a985dc37e357a3b22b260a5def99f3530fb415d3"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.2"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

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

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "1285416549ccfcdf0c50d4997a94331e88d68413"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "8d1f54886b9037091edf146b517989fc4a09efec"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.39"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╠═3919b63c-dd71-11ec-0251-5f2867c41821
# ╟─47309f82-27fd-49df-b604-b400857eefcf
# ╟─f7eeb847-6821-4d33-a7b2-2d317b63a8c1
# ╠═4082ecb7-73d6-4b2f-b490-99d360da038c
# ╠═03abce2a-5f8d-4a3d-8bbf-64bf17042816
# ╠═65009033-c431-4472-a276-63a242b6daaf
# ╠═50e486f4-1534-4e96-9ad6-1a015f170717
# ╠═3b5c5f2e-f9f9-4036-8cd4-7d2419276711
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
