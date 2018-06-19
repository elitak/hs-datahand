# Use "sudo -E ./build+program.nixos.sh" to realize this, for followup flashing.
{ pkgs ? import <nixpkgs> {} }:
with builtins;
with pkgs.lib;
let
  basename = path: last (splitString "/" path);

  prune-for-dev = path: type:
    let
      ext = last (splitString "." path);
      parts = last (splitString "/" path);
    in
      !elem (basename path) ["dhteensy" "dist"] &&
      !elem ext ["sh" "nix" "md" "swp"] &&
      !hasPrefix "result" (basename path) &&
      !hasPrefix ".git" (basename path);
  pkg = pkgs.haskellPackages.callPackage ./package.nix { };
in

overrideDerivation pkg (_: { src = filterSource prune-for-dev ./.; })
