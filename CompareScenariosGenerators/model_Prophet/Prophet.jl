###########
# Prophet #
###########

using PyCall, DataFrames, Dates, CSV, Random, Statistics

pd      = pyimport("pandas")
prophet = pyimport("prophet")

time_series_path = ARGS[1]
num_steps_ahead =  parse(Int, ARGS[2])
num_scenarios =  parse(Int, ARGS[3])

df = CSV.read(time_series_path, DataFrame)

last_date = df[end,1]

ts_names = names(df)[2:end]

past_data = Matrix(df[:,2:end])

forecasts = zeros(num_steps_ahead, size(past_data)[2], num_scenarios)
for i in 1:size(past_data)[2]
    y = past_data[:, i]
    pyds = string.(df.dates)
    pydf = pd.DataFrame(Dict(
        "ds" => pyds,
        "y"  => log.(y)
    ))
    # parse the "ds" column back into datetime
    pydf["ds"] = pd.to_datetime(pydf["ds"])
    # Prophet model
    m = prophet.Prophet()
    m.fit(pydf)    
    # Make a future frame 
    future = m.make_future_dataframe(periods=num_steps_ahead, freq="M")
    # Forecast
    forecast = m.predict(future)
    forecast = exp.(Float64.(forecast["yhat"].tolist()))[end-num_steps_ahead+1:end]
    # Store the forecast.
    forecasts[:, i, :] = forecast
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