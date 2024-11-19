{ stdenv }:

stdenv.mkDerivation {
  name = "d";
  src = ./src;
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
}