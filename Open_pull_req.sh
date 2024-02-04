#!/bin/bash

if [ "$#" -ne 1 ]; then
    exit 1
fi

TOKEN="$1"

get_pull_requests() {
    organizations_names=$1
    repository_names=$2
    url="https://api.github.com/repos/${organizations_names}/${repository_names}/pulls"
    headers="Authorization: token ${TOKEN}"
    pull_requests=$(curl -s -H "${headers}" "${url}")
    echo "${pull_requests}"
}

main() {
    organizations=("Organization-399")

    for org in "${organizations[@]}"; do
        repos_url="https://api.github.com/orgs/${org}/repos"
        headers="Authorization: token ${TOKEN}"
        repos=$(curl -s -H "${headers}" "${repos_url}" | jq -r '.[].name')

        for repo in ${repos}; do
            pull_requests=$(get_pull_requests "${org}" "${repo}")

            OLD_IFS="$IFS"
            IFS=$'\n'

            pr_titles=$(echo "${pull_requests}" | jq -r '.[].title')

            for pr_title in ${pr_titles}; do
                echo "Organization: ${org}, Repository: ${repo}, Pull Request Title: ${pr_title}"
            done

            IFS="$OLD_IFS"
        done
    done
}

main
