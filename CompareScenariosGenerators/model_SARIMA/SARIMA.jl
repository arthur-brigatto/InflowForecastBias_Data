###############
# Run  SARIMA #
###############

using RCall, CSV, DataFrames, Dates, StatsBase, Random, TimeSeries, Query


time_series_path = ARGS[1]
num_steps_ahead =  parse(Int, ARGS[2])
num_scenarios =  parse(Int, ARGS[3])

df = CSV.read(time_series_path, DataFrame)

last_date = df[end,1]

ts_names = names(df)[2:end]

past_data = log.(Matrix(df[:,2:end]))
past_data = past_data[end-12*30 + 1:end, :]

R"require(forecast)"

forecasts = zeros(num_steps_ahead, size(past_data)[2], num_scenarios)

for i in 1:size(past_data)[2]    
    R"x <- ts($(past_data[:,i]), frequency=12)"
    R"model = auto.arima(x)"
    R"set.seed(123)"
    for s in 1:num_scenarios
        if num_steps_ahead > 1
            forecasts[:, i, s] = exp.(rcopy(R"as.vector(simulate(model, $num_steps_ahead))"))
        else
            forecasts[1, i, s] = exp.(rcopy(R"as.vector(simulate(model, $num_steps_ahead))"))
        end
    end
end

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