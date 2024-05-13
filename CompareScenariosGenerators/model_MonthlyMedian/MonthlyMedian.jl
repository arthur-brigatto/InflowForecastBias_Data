########################
# Monthly Median model #
########################

using CSV, DataFrames, Dates, Statistics

time_series_path = ARGS[1]
num_steps_ahead =  parse(Int, ARGS[2])
num_scenarios = 1

df = CSV.read(time_series_path, DataFrame)

last_date = df[end,1]

ts_names = names(df)[2:end]

past_data = Matrix(df[:,2:end])

forecasts = zeros(num_steps_ahead, size(past_data)[2])
for i in 1:size(past_data)[2]
    for step in 1:num_steps_ahead
        forecasts[step,i] = median([past_data[end-(12-step)-(j-1)*12 - Int(floor((step - 1)/12)*12),i] for j in 1:5])
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

