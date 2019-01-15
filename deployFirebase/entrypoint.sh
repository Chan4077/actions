#!/bin/bash

echo "Updating local package index..."
sudo apt update

echo "Installing NodeJS..."
sudo apt install nodejs

echo "Current versions:"
nodejs -v
npm -v
