using CompareScenariosGenerators

# NW PARp
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_NW_PARp\evaluation_config.toml"])

# NW PARp-A
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_NW_PARpA\evaluation_config.toml"])

# PARp-A with J = 30
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_J_30\evaluation_config.toml"])

# PARp-A with J = 50
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_J_50\evaluation_config.toml"])

# PARp-A with J = 70
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_J_70\evaluation_config.toml"])

# PARp-A with w = 2
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_w_2\evaluation_config.toml"])

# PARp-A with w = 4
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_w_4\evaluation_config.toml"])

# PARp-A with w = 11
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_PARp-A_w_11\evaluation_config.toml"])

# SARIMA
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_SARIMA\evaluation_config.toml"])

# SeasonalNaive
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_SeasonalNaive\evaluation_config.toml"])

# ALTM
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_ALTM\evaluation_config.toml"])

# XGBoost
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_XGBoost\evaluation_config.toml"])

# Prophet
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_Prophet\evaluation_config.toml"])

# Chronus
CompareScenariosGenerators.main_evaluation_loop([raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\model_Chronus\evaluation_config.toml"])

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
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_ALTM\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_XGBoost\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_Prophet\metrics.json",
                                                raw"C:\Users\brigatto\Documents\GitHub\InflowForecastBias_Data\CompareScenariosGenerators\results_Chronus\metrics.json"])
                                                
