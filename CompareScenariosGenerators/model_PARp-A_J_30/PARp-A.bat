@echo off

SET MODEL_PATH=%~dp0

julia %MODEL_PATH%\PARp-A.jl %*
