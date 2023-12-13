# push-to-release.ps1

# Run the hello.py script
$pythonScriptPath = ".\hello.py"
$result = & python $pythonScriptPath

# Print the result
Write-Host "Result from hello.py script: $result"
