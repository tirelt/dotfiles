[ -d "/opt/homebrew/bin" ] && export PATH="/opt/homebrew/bin:$PATH"
[ -d "$HOME/.gchup/bin" ] && export PATH="$HOME/.ghcup/bin:$PATH"
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.cargo/bin" ] && export PATH="$HOME/.cargo/bin:$PATH"
export CLI_TOOLS_DIR="$HOME/cli_tools"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
