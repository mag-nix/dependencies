{ stdenv }:

stdenv.mkDerivation {
  name = "c";
  src = ./src;
}