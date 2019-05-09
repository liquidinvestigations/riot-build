#!/bin/bash -ex

git clone https://github.com/vector-im/riot-web
cd riot-web
git checkout v0.13.5

npm install

(
  cd node_modules
  rm -rf matrix-react-sdk
  ln -s ../../matrix-react-sdk
)

npm run dist

mv riot-web/dist/riot-v0.13.5-dirty.tar.gz ./riot.tgz
