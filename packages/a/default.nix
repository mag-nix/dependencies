{ stdenv, b, c, d }:

stdenv.mkDerivation {
  name = "a";
  src = ./src;
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
}