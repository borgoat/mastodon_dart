let
  unstable = import (fetchTarball https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz) { };
in
{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = [
      unstable.dart
      unstable.flutter
    ];
}
