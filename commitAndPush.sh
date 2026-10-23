#!/bin/bash

oldName="$(git config --global user.name)"
oldEmail="$(git config --global user.email)"
read -p "git config --global user.name: " myName
read -p "git config --global user.email: " myEmail

git config --global user.name "${myName}"
git config --global user.email "${myEmail}"

read -p "Commit message: " message
read -p "Confirm? (y/N): " confirm
if [[ ${confirm} = "y" ]]; then
        git add .
        git commit --message="${message}"
        git push
fi

git config --global user.name "${oldName}"
git config --global user.email "${oldEmail}"

exit
