#! /usr/bin/env bash
# WARNING run as root, or fix usb write perms!
NIX_PATH="$NIX_PATH:nixpkgs=/home/keb/np"
`nix-build`/bin/hs-datahand | tee ../dhteensy/keymaps-elitak.h
pushd ../dhteensy; nix-shell --pure --run 'make && echo Please put keyboard into flash mode. Waiting for it to appear... && teensy-loader-cli -mmcu=at90usb1286 -w dhteensy.hex && echo Success!' ; popd
