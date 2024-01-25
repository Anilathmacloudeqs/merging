# GitHub API endpoint for listing files in a repository
$apiUrl = "https://api.github.com/repos/Anilathmacloudeqs/merging/contents/"

# Personal Access Token (PAT)
$accessToken = $env:PAT_TOKEN 

# Repository details
$user = "Anilathmacloudeqs"
$repo = "merging"
$branch = "main"

# Construct the request URL
$requestUrl = "$apiUrl$user/$repo/$branch"

try {
    # Make the request to GitHub API
    $headers = @{
        "Authorization" = "Bearer $accessToken"
        "User-Agent" = "PowerShell-Script"
    }

    $response = Invoke-RestMethod -Uri $requestUrl -Headers $headers -Method Get

    # Print the names of all files in the branch
    foreach ($file in $response) {
        if ($file.type -eq "file") {
            Write-Host "File Name: $($file.name)"
        }
    }
} catch {
    Write-Host "Error: $_"
}
