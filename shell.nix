#!/usr/bin/env nix-shell
# from https://nix.dev/tutorials/declarative-and-reproducible-developer-environments
# the nix below is pinned to the versions in the tarball
{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/3590f02e7d5760e52072c1a729ee2250b5560746.tar.gz") {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.ninja
    pkgs.which
    pkgs.htop
    pkgs.zlib
    pkgs.gcc
    pkgs.cmake
  ];

  shellHook = ''
    echo hello
  '';

  MY_ENVIRONMENT_VARIABLE = "world";
}
