###########
# Chronus #
###########

using PyCall, DataFrames, Dates, CSV, Random, Statistics

pd   = pyimport("pandas")
torch = pyimport("torch")
chronos = pyimport("chronos")
np = pyimport("numpy")

time_series_path = ARGS[1]
num_steps_ahead =  parse(Int, ARGS[2])
num_scenarios =  parse(Int, ARGS[3])

df = CSV.read(time_series_path, DataFrame)

last_date = df[end,1]

ts_names = names(df)[2:end]

past_data = Matrix(df[:,2:end])

forecasts = zeros(num_steps_ahead, size(past_data)[2], num_scenarios)
for i in 1:size(past_data)[2]
    y = log.(past_data[:, i])
    # Grab the BaseChronosPipeline class
    BaseChronosPipeline = chronos["BaseChronosPipeline"]
    # Build the pipeline
    pipeline = BaseChronosPipeline.from_pretrained(
        "amazon/chronos-t5-base";
        device_map="cpu",
        torch_dtype=torch.bfloat16,
        low_cpu_mem_usage=true,
    )
    # Prepare the input tensor
    context = torch.tensor(y).unsqueeze(0)
    # Run prediction
    _, mean = pipeline.predict_quantiles(
        context=context,
        prediction_length=num_steps_ahead,
        quantile_levels=[0.1, 0.5, 0.9],
        num_samples=200,
    )
    # Store the forecast.
    forecasts[:, i, :] = exp.(mean.numpy()')
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