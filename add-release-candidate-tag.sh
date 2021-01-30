# Informations about the committer
INPUT_COMMIT_USER_NAME="Adrien Saunier"
INPUT_COMMIT_USER_EMAIL=""

# Informations about the release tag
shortened_commit_sha=${GITHUB_SHA::8}
release_tag_name="${RELEASE_CANDIDATE_PREFIX}-${shortened_commit_sha}"

message="Applying a new release candidate tag 🏷 ${release_tag_name}"


# Initialize git configuration
git config --local user.name "$INPUT_COMMIT_USER_NAME"
git config --local user.email "$INPUT_COMMIT_USER_EMAIL"


# Create the tag
echo $message

git tag \
    --annotate $release_tag_name \
    -m "$message"

git push --tags