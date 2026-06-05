##############
# Run  PARpA #
##############

using CSV, DataFrames, Dates, Random, PeriodicAutoregressive, Statistics

# Get ARGS.
time_series_path = ARGS[1]
num_steps_ahead =  parse(Int, ARGS[2])
num_scenarios =  parse(Int, ARGS[3])
# Read time series data.
df = CSV.read(time_series_path, DataFrame)
# Get the last date and time series names.
last_date = df[end,1]
ts_names = names(df)[2:end]
# Prepare data.
past_data = convert(Matrix{Float64}, Matrix(df[:, 2:end]))
# Take log of the data.
past_data = log.(past_data)
# Get the 1 year moving average.
past_data_moving_average = zeros(size(past_data))
for i in 1:size(past_data)[2]
    for j in 12:size(past_data)[1]
        past_data_moving_average[j, i] = mean(past_data[j-11:j, i])
    end
    past_data_moving_average[1:11, i] .= mean(past_data[1:11, i])
end
# Set the target_mean.
target_mean = past_data_moving_average[end, :]
# Adjust the time series.
past_data_adjusted = zeros(size(past_data))
for i in 1:size(past_data)[2]
    past_data_adjusted[:, i] = past_data[:, i] .+ target_mean[i] .- past_data_moving_average[:, i]
end
# Get the series back to the original scale.
past_data = exp.(past_data_adjusted)
# Greate forecasts vector.
forecasts = zeros(num_steps_ahead, size(past_data)[2], num_scenarios)
# Create PARpA vector.
models = Vector{PARpA}(undef, size(past_data)[2])
for i in 1:size(past_data)[2]    
    models[i] = PARpA(past_data[:, i], 12, 6)
    fit_par!(models[i])
end
Random.seed!(1234)
forecasts = simulate_par(models, num_steps_ahead, num_scenarios)

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