#!/bin/bash

rm -rf ./home-monitor-service

rm -f ./README.md

rm -rf ./live-cam

git clone https://github.com/chriswininger/home-monitor-service.git

mv ./home-monitor-service/live-cam ./live-cam

rm -rf ./home-monitor-service

ln -s ./live-cam/README.md ./README.md

pushd ./live-cam/scripts/transfer-images-to-s3

npm install

popd

