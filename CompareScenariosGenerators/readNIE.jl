using DataFrames, CSV, Dates

#################
# Read NIE data #
#################

global NIE = zeros(1128,12)

f = open(raw"\\wsl.localhost\Ubuntu\home\brigatto\PARp\2024_03\parp.dat", "r") 

lines = readlines(f)

# starting line
                 #Sudeste   Madeira   TPires   Itaipu   Parana   Paranapanema     Sul    Iguacu   Nordeste   Norte   BMonte   Man-AP
starting_line = [      12,     6906,   13800,   20664,   27558,         34452,  41346,    48240,     55134,  62028,   68922,   75816]

# read NIE data
for REE in 1:12
    global cont_line = starting_line[REE]
    global cont = 1       
    for year in 1931:2024
        for month in 1:12
            line = lines[cont_line]
            if month == 1
                global NIE[cont, REE] = parse(Float64, line[5 + (month - 1)*10:5 + (month)*10 - 1])
            else
                global NIE[cont, REE] = parse(Float64, line[5 + (month - 1)*11:5 + (month)*11 - 2])
            end
            global cont += 1
        end
        global cont_line += 1
    end
end

NIE_SS = zeros(1128,4)

NIE_SS[:,1] = sum(NIE[:,j] for j in 1:6)
NIE_SS[:,2] = sum(NIE[:,j] for j in 7:8)
NIE_SS[:,3] = sum(NIE[:,j] for j in 9:9)
NIE_SS[:,4] = sum(NIE[:,j] for j in 10:12)

datas = collect(Date(1931,1,1):Month(1):Date(2024,12,1))
df = DataFrame(hcat(datas, NIE), ["dates", "Sudeste", "Madeira", "TPires", "Itaipu", "Parana", "Paranapanema", "Sul", "Iguacu", "Nordeste", "Norte", "BMonte", "Man-AP"])
CSV.write(raw"G:\Meu Drive\Doutorado\Desenvolvimento\5_ENA_Newave_Bias\GeraENA_Jun2022\NIE.csv", df_SS[1:1120,:])

datas = collect(Date(1931,1,1):Month(1):Date(2024,12,1))
df_SS = DataFrame(hcat(datas, NIE_SS), ["dates", "SE", "S", "NE", "N"])
CSV.write(raw"G:\Meu Drive\Doutorado\Desenvolvimento\5_ENA_Newave_Bias\\GeraENA_Dez2023\NIE_SS.csv", df_SS[1:1120,:])