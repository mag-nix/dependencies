{ stdenv }:

stdenv.mkDerivation {
  name = "c";
  src = ./src;
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
}