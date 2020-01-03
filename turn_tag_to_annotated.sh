#!/bin/bash
git checkout master
git fetch && git pull
git fetch --tags

RED='\033[0;33m'
NC='\033[0m'

tags=($(git tag --list))

for i in "${tags[@]}"
do
    date_of_tag=$(git log -1 --format=%ai $i)
    message=$(git log -1 --pretty=%s --abbrev-commit $i)

    echo -e "Formating tag ${RED}$i${NC} to annotated"

    git checkout $i &> /dev/null
    GIT_COMMITTER_DATE=$date_of_tag git tag -af --message="$message" $i
done


git checkout master