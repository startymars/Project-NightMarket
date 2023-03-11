#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# place .nojekyll to bypass Jekyll processing
echo > .nojekyll

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git checkout -B main
git add -A
git commit -m 'deploy'

# if you are deploying to https://startymars.github.io 
# git push -f git@github.com:startymars/startymars.github.io.git main

# if you are deploying to https://startymars.github.io/Project-NightMarket
git push -f https://github.com/startymars/nightMarket.git main:gh-pages

cd -