#!/bin/bash
set -euo pipefail

if [[ ! -z "$TOKEN" ]]; then
	GITHUB_TOKEN=$TOKEN
fi

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "GITHUB_TOKEN or TOKEN env variable is required."
	exit 1
fi

if [[ -z "$GITHUB_REPOSITORY" ]]; then
	echo "GITHUB_REPOSITORY env variable is required."
	exit 1
fi

args=$*
set -- $(echo $GITHUB_REPOSITORY | tr '/' ' ')
owner=$1
repo=${2:-''}

"/bin/chart-releaser" $args -r "$repo" -o "$owner" -t "$GITHUB_TOKEN"
