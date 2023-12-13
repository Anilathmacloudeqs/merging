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

# Navigate to the repository root
cd $PSScriptRoot

# Create a new file or modify an existing one
echo "Hello, Release Branch!" > release_file.txt

# Add and commit the changes
git add .
git commit -m "Update release branch"

# Push changes to the release branch using a personal access token (replace YOUR_TOKEN and YOUR_USERNAME)
$token = "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"
$githubUsername = "YOUR_USERNAME"
git push origin release -u ($token + ':' + $githubUsername + '/release')

