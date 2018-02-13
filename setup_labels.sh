#!/usr/bin/env bash

echo -n "GitHub User: "
read USER

echo -n "GitHub Password: "
read -s PASS

echo ""
echo -n "GitHub Repo (user/repo_name): "
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)

REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# Delete default labels
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question"
curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix"

# Create labels
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Duplicate","color":"fb8c00"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Suggestion","color":"7bdd2a"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"BUG","color":"e53935"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Enhancement","color":"43a047"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Help Wanted","color":"9c27b0"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Invalid","color":"795548"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Large Change","color":"ffeb3b"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Next Version","color":"1e88e5"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Question","color":"009688"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Wont Fix","color":"78909c"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl --user "$USER:$PASS" --include --request POST --data '{"name":"Code Smell","color":"fbca04"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

