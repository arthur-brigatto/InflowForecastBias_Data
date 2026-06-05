##############################
# XGBoost with max_depth = 8 #
##############################

using XGBoost, DataFrames, Dates, CSV, Random, Statistics

max_depth = 8
max_lag = 24
window  = 60

time_series_path = ARGS[1]
num_steps_ahead =  parse(Int, ARGS[2])
num_scenarios =  parse(Int, ARGS[3])

df = CSV.read(time_series_path, DataFrame)

last_date = df[end,1]

ts_names = names(df)[2:end]

past_data = Matrix(df[:,2:end])

nrows     = size(past_data)[1] - window
nfeatures = max_lag + 1

forecasts = zeros(num_steps_ahead, size(past_data)[2], num_scenarios)
for i in 1:size(past_data)[2]
    y = log.(past_data[:, i])
    # Initialize the data structures.
    X         = Array{Float64}(undef, nrows, nfeatures)
    y_target  = Array{Float64}(undef, nrows)
    # Fill in.
    for i in 1:nrows
        t = window + i
        for k in 1:max_lag
            X[i, k] = y[t - k]
        end
        X[i, max_lag+1] = sum( y[t-window : t-1] ) / window
        y_target[i] = y[t]
    end
    # Fit.
    model = xgboost((X, y_target), num_round=1000, max_depth=max_depth, objective="reg:squarederror")
    # Forecast.
    for forecast in 1:num_steps_ahead
        # Update the last line of the X matrix.
        last = copy(X[end, 1:24])
        last[2:24] = last[1:23]
        last[1]    = y_target[end]
        # Update the moving average term.
        MA = mean(y_target[end-window+1:end])
        # Append to X.
        X = vcat(X, [last' MA])
        # Predict on the new row.
        append!(y_target,  predict(model, X[end, :]')[1])
    end
    # Store the forecast.
    forecasts[:, i, :] = exp.(y_target[end-num_steps_ahead+1:end])
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