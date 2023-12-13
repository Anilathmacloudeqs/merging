# Define variables
$sourceBranch = "main"
$destinationBranch = "release"
$fileToPush = "hello.py"

Write-Host "test1"

git config --global user.email "actions@github.com"
git config --global user.name "GitHub Actions"

git fetch origin "$destinationBranch:$destinationBranch"

git checkout $destinationBranch

git checkout $sourceBranch -- $fileToPush

git add $fileToPush
git commit -m "Update $fileToPush from $sourceBranch to $destinationBranch"

git push origin $destinationBranch
