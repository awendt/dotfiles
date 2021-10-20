#!/bin/bash

################################################################
# Script to count all pull requests that have been assigned
# the authenticated user in the last week (requires `hub`).
#
# Outputs # of PRs and a list of all Github users
# that have created those PRs:
#
#   $ githubstats.sh
#   4 pull requests:
#   {
#     "awendt": 1,
#     "dependabot-preview[bot]": 3
#   }
#
# It reports since Monday by default, but you can optionally
# pass a timestamp in the given format:
#
#   $ githubstats.sh --since 2021-02-01T00:00:00
#
# You can also filter certain usernames:
#
#   $ githubstats.sh --filter awendt
#   4 pull requests:
#   {
#     "awendt": 1
#   }
#
# Don't forget to quote when dealing with weird usernames:
#
#   $ githubstats.sh --filter 'awendt,"dependabot-preview[bot]"'
#   4 pull requests:
#   {
#     "awendt": 1,
#     "dependabot-preview[bot]": 3
#   }
################################################################

# By default, don't filter anything
filter=. # jq's identity function

# By default, get pull requests since Monday morning
# * -v is macOS-specific
# * 1w sets weekday to Monday
# * zero hours, minutes, and seconds
since=`date -v 1w -v 0H -v 0M -v 0S +%FT%T`

while [[ "$#" -gt 0 ]]; do
  case $1 in
    --filter) filter="{$2}"; shift ;;
    --since) since=$2; shift ;;
    *) echo "Unknown parameter passed: $1"; exit 1 ;;
  esac
  shift
done

API_URL="https://api.github.com/issues?state=closed&filter=assigned&per_page=100&since=${since}"

ALL_PRS=`hub api --paginate "${API_URL}" | jq -s add`

echo `echo ${ALL_PRS} | jq length` pull requests since ${since}

echo ${ALL_PRS} | jq "
  map({title: .title, from: .user.login})
  | group_by(.from)
  | map({ key: .[0].from, value: length })
  | from_entries
  | ${filter}
"
