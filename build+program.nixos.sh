#! /usr/bin/env bash

set -eo pipefail

if [[ $UID -ne 0 ]]; then echo "WARNING: run with "sudo -E" or the flashing step will fail (FIXME usb dev permissions)"; fi

#makeFlags="CFLAGS=-DALT_PINS_1=1" # Alternate pinout for datahand #2. datahand #1 uses default wiring, but "alt" wiring should be the standard moving forward, assuming i continue using the same microcontroller.
$(nix-build --no-out-link)/bin/hs-datahand | tee ./dhteensy/keymaps-elitak.h
cd ./dhteensy
nix-shell --pure --run "make clean && make $makeFlags && teensy-loader-cli -vw -mmcu=at90usb1286 dhteensy.hex"
