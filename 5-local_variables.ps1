# 5-local_variables.ps1
# Lists environment variables, local variables, and functions

# List all environment variables in NAME=VALUE format
Get-ChildItem Env: | ForEach-Object { "$($_.Name)=$($_.Value)" }

# List all local variables excluding automatic or readonly variables, in NAME=VALUE format
Get-Variable | Where-Object { -not ($_.Options -match 'ReadOnly|Constant|AllScope|Private') } | ForEach-Object { "$($_.Name)=$($_.Value)" }

# List all functions by name
Get-Command -CommandType Function | ForEach-Object { $_.Name }
