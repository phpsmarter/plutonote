using Distributions,StatsPlots,Random

Random.seed!(12); # Set seed for reproducibility

p_true = 0.5;

N = 100;

data = rand(Bernoulli(p_true), N);


prior_belief = Beta(1, 1);


function updated_belief(prior_belief::Beta, data::AbstractArray{Bool})
    # Count the number of heads and tails.
    heads = sum(data)
    tails = length(data) - heads

    # Update our prior belief in closed form (this is possible because we use a conjugate prior).
    return Beta(prior_belief.α + heads, prior_belief.β + tails)
end

# Show updated belief for increasing number of observations
@gif for n in 0:N
    plot(
        updated_belief(prior_belief, data[1:n]);
        size=(500, 250),
        title="Updated belief after $n observations",
        xlabel="probability of heads",
        ylabel="",
        legend=nothing,
        xlim=(0, 1),
        fill=0,
        α=0.3,
        w=3,
    )
    vline!([p_true])
end

