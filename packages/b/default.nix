{ stdenv }:

stdenv.mkDerivation {
  name = "b";
  src = ./src;
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
}