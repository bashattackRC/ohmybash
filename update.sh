#!/bin/bash
# SPDX-License-Identifier: MIT
export OMBVER="0.9"
set +x # exit on errors

if [ ! -d ~/".omb" ]; then
  echo "Bash Attack is not installed."
  exit 1
fi
if [ "$EUID" = 0 ]; then
  echo "Update aborted. Type `ba version` for more info."
  echo
  exec bash
fi

# Update OMB
git clone https://github.com/bashattackRC/bashrc ~/.omb-git
cd ~/.omb
rm -rfv omb_init.sh help plugins themes
cd ~/.omb-git
bash configure.sh
cd ~
cp ~/.omb-git/omb_init.sh ~/.omb/omb_init.sh -vf
cp -r ~/.omb-git/help ~/.omb/help -vf
cp -r ~/.omb-git/themes ~/.omb/themes -vf
cp -r ~/.omb-git/plugins ~/.omb/plugins -vf
rm -rf ~/.omb-git -v
rm ~/.omb/doctor.sh
echo "Updated!"
exec bash
