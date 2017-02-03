
 - ajhc ver was showing no signs of life
 - tried other C demos like stm_p103_demos collection. nothing, with flashing warnings/errors.
 - Then STM32F103VHB6_RevZ_Demo1_Lanchon_20080210.zip worked; used include stm..-lib instead as include file and SetBit() funcs
 - all the init code in the above commented out made no diff, all we needed was SetBit()
 - now gonna make ajhc use SetBit() via ffi since they seem to set something important

###How to Build
nix-shell -I nixpkgs=~/src/nixpkgs/ajhc --pure
ajhc -i hs_src -f ffi -p applicative -p bytestring -X RecordWildCards --tdir=jhc_custom/rts/src -C -o hs_main.c hs_src/Main.hs
pushd lib; make; popd
pushd jhc_custom/rts; make; popd
make mini-demo.bin

###Notes on programming
* make mini-demo.bin
* (there must be a valid DISPLAY set, even for commandline mode: vncserver; export DISPLAY=:1)
* (bin path must have a slash in it...)
* make flash
* GOTCHA: use st-flash --reset write img.bin 0x8000000 (address is must!)
