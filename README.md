# Case study data for the paper "Assessing the Optimistic Bias in the Natural Inflow Forecasts: A Call for Model Monitoring in Brazil"

This repository contains all data used on the paper. The following list of Julia packages for time series analysis are required to reproduce the results:

- [CompareScenariosGenerators.jl](https://github.com/psrenergy/CompareScenariosGenerators.jl)
- [PAR.jl](https://github.com/psrenergy/PAR.jl)
- [StateSpaceModels.jl](https://github.com/LAMPSPUC/StateSpaceModels.jl)
- [ScoreDrivenModels.jl](https://github.com/LAMPSPUC/ScoreDrivenModels.jl)
- [SeasonalNaive.jl](https://github.com/arthur-brigatto/SeasonalNaive.jl)
- [Automatic Time Series Forecasting] (https://cran.r-project.org/web/packages/forecast/vignettes/JSS2008.pdf)
- [XGBoost.jl] (https://github.com/dmlc/XGBoost.jl)
- [Chronos] (https://github.com/amazon-science/chronos-forecasting)
- [Prophet] (http://facebook.github.io/prophet/)

Folder /CompareScenariosGenerators contains the Natural Inflow Energy observed data in file NIE.csv and its subfolders contains all models used and their respective results. Users should simply edit the file paths in file CompareScenariosGenerators.jl and in each evaluation_config.toml and then run the code in CompareScenariosGenerators.jl to reproduce the obtained results.

Workbooks on the root folder contains the results summary and graphs that are in the paper.
