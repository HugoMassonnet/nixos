{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs
    pkgs.nodePackages.npm
  ];

  # Set an isolated npm environment
  NPM_CONFIG_GLOBAL = false;
  NPM_CONFIG_PREFIX = "$TMPDIR/npm-global";
  TMPDIR = "$(mktemp -d)";
}
