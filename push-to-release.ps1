# push-to-release.ps1

# Run the hello.py script in the current branch
$pythonScriptPath = "./hello.py"
$result = & python $pythonScriptPath

# Set Git user information
git config user.email "anilathma@cloudeqs.com"
git config user.name "Anilathmacloudeqs"

# Get the current branch name
$currentBranch = git rev-parse --abbrev-ref HEAD

# Move to the release branch (create if not exists)
git checkout -B release

# Copy hello.py from the current branch to the release branch
Copy-Item -Path $currentBranch\$pythonScriptPath -Destination ".\"

# Add and commit changes
git add .
git commit -m "Copy hello.py from $currentBranch to release branch"

# Push changes to the release branch using the PAT stored in repository secrets
$token = $env:PAT_TOKEN
$githubUsername = "Anilathmacloudeqs"
git push origin release
