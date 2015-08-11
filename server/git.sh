#!/usr/bin/with-contenv sh

git config --global user.email "configurator-server@$(hostname)"
git config --global user.name "Configurator Server @ $(hostname)"



set -ex
if [ -d /repo/config/.git ]
then
    echo "Repo exists"
else
    mkdir -p /repo/config
    cd /repo/config
    git init
    git checkout -b master
    git checkout -b server
    touch .scinit
    git add .scinit
    git commit -am "Initialized"
    touch .git/git-daemon-export-ok
fi

rm -rf /repo/config/.git/hooks/*.sample
cp -f /hooks/* /repo/config/.git/hooks/
chmod a+x /repo/config/.git/hooks/*

#http://railsware.com/blog/2013/09/19/taming-the-git-daemon-to-quickly-share-git-repository/

git daemon  --base-path=/repo --enable=receive-pack --reuseaddr --informative-errors --export-all 
