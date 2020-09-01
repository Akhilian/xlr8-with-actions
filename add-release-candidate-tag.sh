echo "Applying a new tag"
sha_of_commit=$(git rev-parse --short HEAD)
echo $sha_of_commit
echo ${{github.sha}}