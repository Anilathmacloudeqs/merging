# push-to-release.ps1

# Run the hello.py script (if needed)
$pythonScriptPath = ".\hello.py"
$result = & python $pythonScriptPath

# Navigate to the repository root
cd $PSScriptRoot

# Checkout the release branch or create it if it doesn't exist
git checkout -B release

# Add and commit changes
git add .
git commit -m "Update release branch"

# Push changes to the release branch
git push origin release
