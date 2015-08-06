#!/usr/bin/with-contenv sh
set -ex
if [ -d /repo/config/.git ]
then
    echo "Repo exists"
else
    mkdir -p /repo/config
    cd /repo/config
    git init
    git checkout -b server
    touch .git/git-daemon-export-ok
fi


#http://railsware.com/blog/2013/09/19/taming-the-git-daemon-to-quickly-share-git-repository/

git daemon  --base-path=/repo --enable=receive-pack --reuseaddr --informative-errors --export-all --verbose
