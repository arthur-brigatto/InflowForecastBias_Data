##########
# NEWAVE #
##########

using DataFrames, Dates, CSV, Random

time_series_path = ARGS[1]
num_steps_ahead =  parse(Int, ARGS[2])
num_scenarios =  parse(Int, ARGS[3])

df = CSV.read(time_series_path, DataFrame)

last_date = df[end,1]

ts_names = names(df)[2:end]

past_data = Matrix(df[:,2:end])

path_NW = string("C:\\Users\\brigatto\\Documents\\GitHub\\PSCC_2024_Case_Study_Data\\CompareScenariosGenerators\\model_NW_PARpA\\decks\\Parp-A\\",year(last_date + Month(1)),"_",lpad(month(last_date + Month(1)), 2, "0"))

forecasts = Array{Float64}(undef,60 - month(last_date + Month(1)) + 1, size(past_data)[2], 2000)

for i in 1:size(past_data)[2]

    #open data file
    f = open(string(path_NW, "\\eafbm00", i, ".out"), "r")

    #skip header
    for cont in 1:5 readline(f) end

    #read data
    #Year 1
    for iScenario in 1:2000
        line = readline(f)
        for iMonth in month(last_date + Month(1)):12
            forecasts[iMonth - month(last_date + Month(1)) + 1, i, iScenario] = parse(Float64,line[7 + (iMonth-1)*9:15 + (iMonth-1)*9])
        end
    end
    #skip remaining statistics 
    line = readline(f)
    for cont in 1:8 readline(f) end    

    #Remaining years
    for iYear in 2:5
        for iScenario in 1:2000
            line = readline(f)
            for iMonth in 1:12
                forecasts[iMonth + (iYear - 1)*12 - month(last_date + Month(1)) + 1, i, iScenario] = parse(Float64,line[7 + (iMonth-1)*9:15 + (iMonth-1)*9])
            end
        end
        #read mean and skip remaining statistics 
        line = readline(f)
        for cont in 1:8 readline(f) end
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