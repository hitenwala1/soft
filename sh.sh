#!/bin/bash


FILE_ID="1KqstDdgv9_NDKWUQaN4YufofU9UCZ_KT"
FILE_NAME="fleetctl"

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&id=${FILE_ID}&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id='"${FILE_ID}" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p')" -O "${FILE_NAME}" && rm -rf /tmp/cookies.txt

sudo cp fleetctl /usr/local/bin/fleetctl
sudo chmod a+x /usr/local/bin/fleetctl

sudo mkdir -p /etc/osquery/certs

sudo cp fleet.crt /etc/osquery/certs/fleet.crt

fleetctl package \
  --type=deb \
  --enable-scripts \
  --fleet-desktop \
  --fleet-url=https://inventory.freestoneinfotech.com:5543 \
  --enroll-secret=7bep9008c/0D//8Hf/mmvDQr967RBalh \
  --insecure

sudo dpkg -i fleet-osquery_*.deb
sudo systemctl start orbit
sudo systemctl enable orbit

