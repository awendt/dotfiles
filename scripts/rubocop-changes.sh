#!/bin/bash

# Script to check modified Ruby files with rubocop, install in any repo with:
#
# cd .git/hooks; ln -s ~/dotfiles/scripts/rubocop-changes.sh pre-commit

git diff --cached --name-only --diff-filter=AMR -- *.rb *.rake | xargs rubocop
