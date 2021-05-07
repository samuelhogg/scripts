#!/bin/bash

# wget -O - https://raw.githubusercontent.com/samuelhogg/scripts/main/newinstall.sh | bash

curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o ~/Downloads/vscode.deb
sudo apt install ~/Downloads/vscode.deb
