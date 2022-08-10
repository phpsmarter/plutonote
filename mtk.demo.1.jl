using ModelingToolkit

@variables t x(t) RHS(t)  # independent and dependent variables
@parameters τ       # parameters
D = Differential(t) # define an operator for the differentiation w.r.t. time

# your first ODE, consisting of a single equation, indicated by ~
@named fol = ODESystem([ D(x)  ~ (1 - x)/τ])

using DifferentialEquations: solve
using Plots: plot

prob = ODEProblem(fol, [x => 0.0], (0.0,10.0), [τ => 3.0])
sol = solve(prob)
plot(sol)