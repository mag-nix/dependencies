{ stdenv }:

stdenv.mkDerivation {
  name = "b";
  src = ./src;
}