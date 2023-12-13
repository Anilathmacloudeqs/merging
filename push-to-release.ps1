# Define variables
$sourceBranch = "main"
$destinationBranch = "release"
$fileToPush = "hello.py"

# Debug statements
Write-Host "Current directory: $(Get-Location)"
Write-Host "Files in main branch: $(git ls-tree $sourceBranch)"

# Copy the file from main branch to release branch
git checkout $sourceBranch -- $fileToPush

# Debug statements
Write-Host "Files after checkout: $(git ls-files)"

# Stage and commit changes
git add $fileToPush
git commit -m "Update $fileToPush from $sourceBranch to $destinationBranch"

# Debug statements
Write-Host "Files after commit: $(git ls-files)"

# Push changes to the release branch
git push origin $destinationBranch
