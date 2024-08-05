{ pkgs ? import <nixpkgs> {
    overlays = [ (import ../default.nix) ];
  }
, mkShell ? pkgs.mkShell
}:

mkShell {
  packages = [
    pkgs.llvm."18.1.8"
  ];
}
