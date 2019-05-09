#!/bin/bash -ex

git clone https://github.com/liquidinvestigations/matrix-react-sdk
( cd matrix-react-sdk; git checkout liquid )

(
  cd matrix-react-sdk
  git checkout liquid
  npm install
  npm run build
)
