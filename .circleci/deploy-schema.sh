#!/bin/sh
set -e

pwd
REMOTE="https://github.com/zzak/b"
GH_EMAIL="mail@zzak.io"
GH_NAME="zzak"

echo `date '+%Y-%m-%d %H:%M:%S'` > data

git clone $REMOTE
cd b
git config --global user.email "$GH_EMAIL" > /dev/null 2>&1
git config --global user.name "$GH_NAME" > /dev/null 2>&1

cp -a ../data .

git add -A
git commit --allow-empty -m "Deploying data [ci skip]"
git push --force --quiet origin master
cd ..
rm -rf b

echo "Finished deploying data!"

