#!/bin/bash
sudo apt update
sudo pkill -9 apt
sudo apt install mongodb -y
sudo systemctl start mongodb
sudo systemctl enable mongodb
sudo systemctl status mongodb
