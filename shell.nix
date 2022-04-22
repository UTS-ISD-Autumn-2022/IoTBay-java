{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    yarn
    jdk11
  ];

  shellHook = ''
    echo "building dependant files"
    cd www-src
    yarn install
    yarn scss
    yarn js
    
    cd ..
    echo "Finished!"
  '';
}
