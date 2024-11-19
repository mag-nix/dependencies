{ stdenv }:

stdenv.mkDerivation {
  name = "a";
  src = ./src;
}