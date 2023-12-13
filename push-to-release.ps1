# Define variables
$sourceBranch = "main"
$destinationBranch = "release"
$fileToPush = "hello.py"

# Clone the repository
git clone https://github.com/${{ github.repository }}.git
cd ${{ github.repository_name }}

# Checkout the release branch
git checkout $destinationBranch

# Copy the file from main branch to release branch
git checkout $sourceBranch -- $fileToPush

# Stage and commit changes
git add $fileToPush
git commit -m "Update $fileToPush from $sourceBranch to $destinationBranch"

# Push changes to the release branch
git push origin $destinationBranch
