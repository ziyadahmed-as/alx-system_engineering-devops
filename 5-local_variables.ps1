# 5-local_variables.ps1
# Lists environment variables, local variables, and functions in Bash-like format

# Environment variables
Get-ChildItem Env: | ForEach-Object { "$($_.Name)=$($_.Value)" }

# Local (non-readonly) variables
Get-Variable | Where-Object { -not ($_.Options -match 'ReadOnly|Constant|AllScope|Private') } | ForEach-Object { "$($_.Name)=$($_.Value)" }

# Functions
Get-Command -CommandType Function | ForEach-Object { $_.Name }
