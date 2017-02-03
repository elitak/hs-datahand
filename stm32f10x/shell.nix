{ pkgs ? import <nixpkgs> {} }:
with pkgs;
stdenv.mkDerivation {
  name = "ajhc-datahand-1.0";
  #src = ./.;
  buildInputs = [ gnumake
                  gcc-arm-embedded
                  haskell.packages.ghc763.ajhc
                ];
  shellHook = ''
    #export LDSCRIPT=${avrgcclibc}/avr/lib/ldscripts/avr51.xn
  '';
}
