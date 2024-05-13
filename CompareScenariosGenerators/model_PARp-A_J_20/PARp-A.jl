############################
# PARp-A model with J = 20 #
############################

using PAR, DataFrames, Dates, CSV, Random

J = 20

time_series_path = ARGS[1]
num_steps_ahead =  parse(Int, ARGS[2])
num_scenarios =  parse(Int, ARGS[3])

df = CSV.read(time_series_path, DataFrame)

last_date = df[end,1]

ts_names = names(df)[2:end]

past_data = Matrix(df[end-J*12 + 1:end,2:end])

par_models = Vector{PARpA}()
for i in 1:size(past_data)[2]
    push!(par_models, PARpA(past_data[:,i], 12, 6; information_criteria = "aic"))
    fit_par!(par_models[i])
end

Random.seed!(123)    
forecasts = simulate_par(par_models, num_steps_ahead, num_scenarios)

# Write results
simulation_df = DataFrame(
    "dates" => Vector{Date}(undef, 0), 
    "scenario" => Vector{Int}(undef, 0), 
    [name => Vector{Float64}(undef, 0) for name in ts_names]...
)

for s in 1:num_scenarios, t in 1:num_steps_ahead
    push!(simulation_df, 
        vcat(
            last_date + Month(t),
            s,
            forecasts[t, :, s]
        )
    )
end

output_path = joinpath(dirname(time_series_path), "_simulated_scenarios.csv")
CSV.write(output_path, simulation_df)