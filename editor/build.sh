set -ex

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential  curl python git gcc g++ make ca-certificates npm nodejs localepurge net-tools socat
ln -s /usr/bin/nodejs /usr/bin/node

# Add S6 for process management
curl -L  https://github.com/just-containers/s6-overlay/releases/download/v1.11.0.1/s6-overlay-amd64.tar.gz > /tmp/s6-overlay-amd64.tar.gz
tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# Build codebox
git clone https://github.com/sillelien/codebox.git
cd codebox
git checkout 1.0.0-alpha.5
npm install -g .
#cd ./usr/local/lib/node_modules/codebox/node_modules/shux/node_modules/pty.js && make clean && make
cd ..

# Remove Cache and build files
apt-get remove -y gcc g++ make localepurge
apt-get autoremove -y
apt-get install -y deborphan
apt-get purge -y $(deborphan)
apt-get remove -y deborphan
apt-get clean
rm -rf /tmp/*

du -sh / || :
