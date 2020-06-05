#!/bin/bash

docker build -t kqkq/nginx-websockify:1.19.0 -t kqkq/nginx-websockify:mainline -t kqkq/nginx-websockify:1 -t kqkq/nginx-websockify:1.19 -t kqkq/nginx-websockify:latest mainline/buster
