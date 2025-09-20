#!/bin/bash

mkdir -p ~/.ssh

ln -sf "$(pwd)/.vimrc" ~/.vimrc
ln -sf "$(pwd)/.bash_profile" ~/.bash_profile
ln -sf "$(pwd)/.bashrc" ~/.bashrc

CLI_TOOLS_DIR="$HOME/cli_tools"
mkdir -p "$CLI_TOOLS_DIR" 

gcc ./cli_tools/epoch.c -std=c17 -o "$CLI_TOOLS_DIR/epoch"
chmod +x "$CLI_TOOLS_DIR/epoch"

gcc ./cli_tools/binary.c -std=c17 -o "$CLI_TOOLS_DIR/binary"
chmod +x "$CLI_TOOLS_DIR/binary"

source "$HOME/.bash_profile"
