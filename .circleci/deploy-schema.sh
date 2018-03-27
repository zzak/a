#!/bin/sh
set -e

pwd
REMOTE="https://github.com/zzak/b"

echo `date '+%Y-%m-%d %H:%M:%S'` > data

git clone $REMOTE
cd b
cp -a ../data .

git add -A
git commit --allow-empty -m "Deploying data [ci skip]"
git push --force --quiet origin master
cd ..
rm -rf b

echo "Finished deploying data!"

