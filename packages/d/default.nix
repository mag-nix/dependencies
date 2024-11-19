{ stdenv }:

stdenv.mkDerivation {
  name = "d";
  src = ./src;
}