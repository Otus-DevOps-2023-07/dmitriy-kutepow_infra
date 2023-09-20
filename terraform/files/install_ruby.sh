#!/bin/bash
sudo apt update
sudo pkill -9 apt
sudo apt install -y ruby-full ruby-bundler build-essential
