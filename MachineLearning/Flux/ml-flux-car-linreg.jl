
	using Flux,Latexify,CSV,DataFrames
	using Flux:train!
	#path="/Users/lunarcheung/Public/github/StatsWithJuliaBook/data/cars.csv"
	path="/Users/lunarcheung/Public/github/StatsWithJuliaBook/data/weightHeight.csv"


# ╔═╡ b3920702-e068-440c-828b-cf6b0346ecaf
data=CSV.read(path, DataFrame)

# ╔═╡ d266930b-5a2d-4003-9b73-77a7ff036f5b
weight,height=data[:,:2]'|>float,data[:,:3]'|>float

# ╔═╡ 1584891b-25c0-4bc7-8c0f-ac4316a8bbf2

train_x,test_x=height[1:2:end]',height[2:2:end]'
train_y,test_y=weight[1:2:end]',weight[2:2:end]'	


# ╔═╡ 4c67439e-1810-4326-bcb7-e918ce944b4b

	model = Dense(1 => 1)
	predict = Dense(1 => 1)
	loss(x, y) = Flux.Losses.mse(predict(x), y);
	


# ╔═╡ 47d8e3d6-a5b5-447d-8262-ba498479c8e8
predict(train_x)

# ╔═╡ 4ace589c-36fb-4f31-bd35-a57f227bad1b
loss(train_x, train_y)

# ╔═╡ 2f84378d-34c2-4772-8e5c-7d966e9330c4
opt = Descent()

# ╔═╡ d426e08a-360c-4495-bfe4-cc88cf4dcf98
train_data = [(train_x, train_y)]

# ╔═╡ 424e27cf-9719-4eaf-917b-656114a47cf9
parameters = Flux.params(predict)

for epoch in 1:30
    train!(loss, parameters, train_data, opt)
end

# ╔═╡ dbc1ca24-04d7-4b81-acfe-d80aa2656d73
parameters

# ╔═╡ a5dd649d-3808-47ad-a4ea-9845469f3e00
loss(test_x, test_y)