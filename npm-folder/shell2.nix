{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python39
    pkgs.nodejs
    pkgs.file
    pkgs.libstdcxx5
  ];
    shellHook = ''
    npm set prefix $PWD/.npm-global
    export PATH=$PWD/.npm-global/bin:$PATH
    export NODE_PATH=$PWD/.npm-global/lib/node_modules
    GIT_AUTHOR_EMAIL='florian-marie@getvirtualbrain.com'
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
      pkgs.libstdcxx5
      pkgs.stdenv.cc.cc.lib
      pkgs.file
    ]}
  '';
}
