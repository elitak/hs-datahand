{ mkDerivation, base, stdenv }:
mkDerivation {
  pname = "hs-datahand";
  version = "0.2.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base ];
  homepage = "https://github.com/elitak/hs-datahand";
  description = "DataHand layout compositor";
  license = stdenv.lib.licenses.gpl3;
}
