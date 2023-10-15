#!/bin/bash
sudo apt update
sleep 30s
sudo apt install mongodb -y
sudo systemctl start mongodb
sudo systemctl enable mongodb
sudo systemctl status mongodb