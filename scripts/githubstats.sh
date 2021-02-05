#!/bin/bash

############################################################
# Script to count all pull requests that have been assigned
# the authenticated user in the last week.
#
# It depends on coreutils (gdate) and hub.
#
# Outputs # of PRs and a list of all Github users
# that have created those PRs:
#
# $ githubstats.sh
# 4 pull requests:
# {
#   "awendt": 1,
#   "dependabot-preview[bot]": 3
# }
#
# You can also filter certain usernames:
#
# $ githubstats.sh --filter awendt
# 4 pull requests:
# {
#   "awendt": 1
# }
#
# Don't forget to quote when dealing with weird usernames:
#
# $ githubstats.sh --filter awendt,"dependabot-preview[bot]"
# 4 pull requests:
# {
#   "awendt": 1,
#   "dependabot-preview[bot]": 3
# }
############################################################

# By default, don't filter anything
filter=. # jq's identity function

while [[ "$#" -gt 0 ]]; do
  case $1 in
    --filter) filter="{$2}"; shift ;;
    *) echo "Unknown parameter passed: $1"; exit 1 ;;
  esac
  shift
done

MONDAY=`gdate -d'monday -7days' +%FT%T`
API_URL="https://api.github.com/issues?state=closed&filter=assigned&per_page=100&since=${MONDAY}"

ALL_PRS=`hub api "${API_URL}"`

echo `echo ${ALL_PRS} | jq length` pull requests

echo ${ALL_PRS} | jq "
  map({title: .title, from: .user.login})
  | group_by(.from)
  | map({ key: .[0].from, value: length })
  | from_entries
  | ${filter}
"
