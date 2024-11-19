{ stdenv }:

stdenv.mkDerivation {
  name = "d";
  src = ./src;
  buildPhase = ''
    echo ">>> build d <<<"
    sleep 1
  '';
  installPhase = ''
    mkdir -p $out
    cp hello $out
  '';
}