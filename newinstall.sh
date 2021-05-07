#!/bin/bash

curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o ~/Downloads/vscode.deb
sudo apt install ~/Downloads/vscode.deb
