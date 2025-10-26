# dotfiles 

Portable config 

## Usage

Download:
```bash
git clone https://github.com/tirelt/dotfiles.git
cd dotfiles
```

Then run from the root of the project. 
```bash
./setup.sh
```

## CLI tools

It compiles some CLI tools 
- `epoch arg1 arg2 ...` : to convert a list of times in secondes since epoch to readable time

## Mac OS terminal 
Install a recent version of bash with homebrew, it should save `/opt/homebrew/bin/bash` add it to `/etc/shells` and run
```Bash
chsh -s /opt/homebrew/bin/bash
echo $SHELL # should give /opt/homebrew/bin/bash
```