{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc883" }:
let
  bootstrap = import <nixpkgs> {};

  nixpkgs = builtins.fromJSON (builtins.readFile ./nixpkgs.json);

  pspkgs = builtins.fromJSON (builtins.readFile ./purescript.json);

  src = bootstrap.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    inherit (nixpkgs) rev sha256;
  };

  easy-ps = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      inherit (pspkgs) rev sha256;
    }
  ) {
    inherit pkgs;
  };

  pkgs = import src {};
  myHaskellPackages = pkgs.haskell.packages."${compiler}";

  myPackages = myHaskellPackages.callCabal2nix "project" ./servant-purescript.cabal {};
in
myHaskellPackages.shellFor {
  withHoogle = true;
  packages = p: [ myPackages ];
  inherit ((import ./pre-commit.nix).pre-commit-check) shellHook;
  buildInputs = with myHaskellPackages;
    [
      hlint
      ghcid
      cabal2nix
      ormolu
      cabal-install
    ] ++ [
      pkgs.zlib
      easy-ps.purs
      easy-ps.spago
      easy-ps.spago2nix
      pkgs.cacert
      pkgs.nodejs
    ];
}
