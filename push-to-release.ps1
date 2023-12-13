# push-to-release.ps1

# Run the hello.py script (if needed)
$pythonScriptPath = ".\hello.py"
$result = & python $pythonScriptPath

# Navigate to the repository root
cd $PSScriptRoot

# Set Git user information
git config user.email "anilathma@cloudeqs.com"
git config user.name "Anilathmacloudeqs"

# Checkout the release branch or create it if it doesn't exist
git checkout -B release

# Add and commit changes
git add .
git commit -m "Update release branch"

# Push changes to the release branch using a personal access token (replace YOUR_TOKEN with your actual token)
$token = "YOUR_TOKEN"
git push origin release -u $token
