using CompareScenariosGenerators

# NW PARp
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_NW_PARp\evaluation_config.toml"])

# NW PARp-A
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_NW_PARpA\evaluation_config.toml"])

# PARp-A with J = 20
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_J_20\evaluation_config.toml"])

# PARp-A with J = 30
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_J_30\evaluation_config.toml"])

# PARp-A with J = 40
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_J_40\evaluation_config.toml"])

# PARp-A with J = 50
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_J_50\evaluation_config.toml"])

# PARp-A with J = 60
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_J_60\evaluation_config.toml"])

# PARp-A with J = 70
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_J_70\evaluation_config.toml"])

# PARp-A with J = 80
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_J_80\evaluation_config.toml"])

# PARp-A with w = 2
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_w_2\evaluation_config.toml"])

# PARp-A with w = 4
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_w_4\evaluation_config.toml"])

# PARp-A with w = 11
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_w_11\evaluation_config.toml"])

# SARIMA
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_SARIMA\evaluation_config.toml"])

# Score Driven
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_ScoreDrivenModel\evaluation_config.toml"])

# SeasonalNaive
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_SeasonalNaive\evaluation_config.toml"])

# Structural Model
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_StructuralModel\evaluation_config.toml"])

# Monthly median
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_MonthlyMedian\evaluation_config.toml"])

# results

CompareScenariosGenerators.main_report_metrics([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_NW_PARp\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_NW_PARp-A\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_PARp-A_J_20\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_PARp-A_J_30\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_PARp-A_J_40\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_PARp-A_J_50\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_PARp-A_J_60\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_PARp-A_J_70\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_PARp-A_J_80\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_PARp-A_w_2\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_PARp-A_w_4\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_PARp-A_w_11\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_SeasonalNaive\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_SARIMA\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_StructuralModel\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_ScoreDrivenModel\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_MonthlyMedian\metrics.json"])
                                                
