# push-to-release.ps1

# Run the hello.py script
$pythonScriptPath = "./hello.py"
$result = & python $pythonScriptPath

# Navigate to the repository root
cd $PSScriptRoot

# Set Git user information
git config user.email "anilathma@cloudeqs.com"
git config user.name "Anilathmacloudeqs"

# Ensure we are on the main branch
git checkout main

# Remove the existing release branch if it exists
git branch -D release

# Create a new release branch
git checkout -b release

# Copy hello.py to the root of the repository
Copy-Item -Path $pythonScriptPath -Destination ".\"

# Add and commit changes
git add .
git commit -m "Update release branch with hello.py"

# Push changes to the release branch using the PAT stored in repository secrets
$token = $env:PAT_TOKEN
$githubUsername = "Anilathmacloudeqs"
git push origin release
