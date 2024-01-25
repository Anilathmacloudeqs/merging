# push-to-release.ps1

# Set Git user information
git config user.email "anilathma@cloudeqs.com"
git config user.name "Anilathmacloudeqs"

# Get the current branch name
$currentBranch = git rev-parse --abbrev-ref HEAD

# Move to the release branch (create if not exists)
git checkout -B release

# List all files in the current branch
Get-ChildItem | ForEach-Object { Write-Output $_.FullName }

# Add and commit changes
git add .
git commit -m "List all files in $currentBranch"

# Push changes to the release branch using the PAT stored in repository secrets
$token = $env:PAT_TOKEN
$githubUsername = "Anilathmacloudeqs"
git push origin release
